#!/usr/bin/env python

# ---------- Augmented Reality Paint ------------
# Filipe Goncalves, 98083
# Diogo Monteiro, 97606
# Fábio Silva, 97729
# 
# PSR, October 2022.
# -----------------------------------------------

import argparse
import cv2
import numpy as np
import copy
import json
import time
from colorama import Fore, Style
import random

# define a class to pass parameters around functions easily
class PaintParameters:
    # Default parameters
    size_brush = 5
    last_point = None
    brush = True
    drawing_square = False
    drawing_circle = False
    centroid = None
    centroid_I = (-1, -1)
    color = (0,0,0)

    # min distance_squared between two consecutive points to be detected as an oscilation
    shake_detection_threshold = 1600
    # mouse coordinates for mouse brush
    mouse_coords = {'x': None, 'y': None}
    # last pressed key
    key = -1
    # set to True to stop main loop
    stop = False

    def __init__(self, frame, height, width, use_video_canvas, use_shake_detection, use_mouse, paint_numeric):
        self.frame = frame
        self.cam_output = frame
        self.height = height
        self.width = width
        # create canvas
        self.painter = np.ones((height, width, 3), np.uint8) * 255
        # mask
        self.mask = np.zeros((height, width, 3))
        self.output = self.painter
        self.use_video_canvas = use_video_canvas
        self.use_shake_detection = use_shake_detection
        self.use_mouse = use_mouse
        self.paint_numeric = paint_numeric



def processImage(ranges, image):
    """
    # Applies binary threshould operation according to given ranges
    """

    # processing
    mins = np.array([ranges['B']['min'], ranges['G']['min'], ranges['R']['min']])
    maxs = np.array([ranges['B']['max'], ranges['G']['max'], ranges['R']['max']])

    # mask
    mask = cv2.inRange(image, mins, maxs)
    # conversion from numpy from uint8 to bool
    mask = mask.astype(bool)

    # process the image
    image_processed = copy.deepcopy(image)
    image_processed[np.logical_not(mask)] = 0

    # get binary image with threshold the values not in the mask
    _, image_processed = cv2.threshold(image_processed, 1, 255, cv2.THRESH_BINARY)

    return image_processed


# create numeric paint and the evaluation value
def numericPainter(parameters: PaintParameters, last_color):
    # create paint numeric
    parameters.evaluation_painter = parameters.painter.copy()

    # random number of lines
    num_lines = random.randint(2,2)

    # array for all the points necessary to build the lines and fill the gaps
    points = []

    # colors used (b,g,r)
    colors = [(255,0,0), (0,255,0), (0,0,255)]

    w = parameters.width
    h = parameters.height

    # calculate lines
    for i in range(num_lines+1):

        # all lines and last line which is the final wall
        if i != num_lines:
            points.append([(random.randint(int(w/num_lines)*i,int(w/num_lines)*(i+1)), 0), (random.randint(int(w/num_lines)*i,int(w/num_lines)*(i+1)), w)])
        else:
            points.append([[w,0], [w,h]])

        # start and end point for the polygon
        if i == 0:
            start_point = [0,0]
            end_point = [0,h]
        else:
            start_point = points[i-1][0]
            end_point = points[i-1][1]

        # all points for the polygon
        pts = np.array([start_point, points[i][0], points[i][1], end_point], np.int32)
        pts = pts.reshape((-1, 1, 2))

        # color randomizer for each gap
        color = colors[random.randint(0,2)]
        while last_color == color:
            color = colors[random.randint(0,2)]

        # create polygon to paint the right colors
        parameters.evaluation_painter = cv2.fillPoly(parameters.evaluation_painter, [pts], color)
        # points for the text in the center
        point_txt = (int((points[i][1][0] - start_point[0])/2))+start_point[0], int((end_point[1] - start_point[1])/2)

        # painter
        parameters.painter = cv2.putText(parameters.painter, str(colors.index(color)+1), point_txt, cv2.FONT_HERSHEY_SIMPLEX, 1, (0,0,0), 2, cv2.LINE_AA)

        # save last color for next polygon
        last_color = color

    # create lines
    for i in range(len(points)):
        cv2.line(parameters.evaluation_painter, points[i][0], points[i][1], (0,0,0), 3, -1)
        cv2.line(parameters.painter, points[i][0], points[i][1], (0,0,0), 3, -1)

    # temp for clear
    parameters.temp = parameters.painter.copy()

    # number of pixels for the evaluation
    parameters.total_pixels = np.sum(np.equal(parameters.evaluation_painter, parameters.painter).astype(np.uint8))

    # print different colors and their number
    print("Colors:\n"+ Style.BRIGHT + Fore.BLUE +"1 - Blue\n"+ Style.BRIGHT + Fore.GREEN +"2 - Green\n"+ Style.BRIGHT + Fore.RED +"3 - Red" + Style.RESET_ALL)


# create image for commands
def commands(canvas):
    # text variables
    font = cv2.FONT_HERSHEY_SIMPLEX
    org = (50, 50)
    fontScale = 1
    color = (255, 255, 255)
    thickness = 2
    
    commands = ["q -> quit", "+ -> increase brush size", "- -> decrease brush size", "r -> change color to red",
                "g -> change color to green", "b -> change color to blue", "c -> clear canvas", 
                "w -> write image in file", "e -> erase", "s -> switch brush on/off"]

    for c in range(len(commands)):
        org = (50, 40*(c+1))
        canvas = cv2.putText(canvas, commands[c], org, font, fontScale, color, thickness, cv2.LINE_AA)

    return canvas


def findCentroid(parameters: PaintParameters, image_binary):
    parameters.centroid = None

    # use mouse as brush
    if parameters.use_mouse and parameters.mouse_coords['x'] is not None:
        parameters.centroid = (parameters.mouse_coords['x'], parameters.mouse_coords['y'])

    connectivity = 4  
    # Perform the operation
    nb_components, labels, stats, centroids = cv2.connectedComponentsWithStats(cv2.cvtColor(image_binary, cv2.COLOR_BGR2GRAY), connectivity, cv2.CV_32S)
    # Find the largest component
    # Note: range() starts from 1 since 0 is the background label.
    if nb_components > 1:
        #count = 0
        max_label, _ = max([(i, stats[i, cv2.CC_STAT_AREA]) for i in range(1, nb_components)], key=lambda x: x[1])

        # centroid coordinates
        centroid = (int(centroids[max_label][0]), int(centroids[max_label][1]))

        # highlight largest area
        parameters.mask = np.equal(labels, max_label)
        b,g,r = cv2.split(parameters.frame)
        b[parameters.mask] = 0
        r[parameters.mask] = 0
        g[parameters.mask] = 200
        parameters.cam_output = cv2.merge((b,g,r))

        # put text and highlight the center
        cv2.line(parameters.cam_output, (centroid[0]+5, centroid[1]), (centroid[0]-5, centroid[1]), (0,0,255), 5, -1)
        cv2.line(parameters.cam_output, (centroid[0], centroid[1]+5), (centroid[0], centroid[1]-5), (0,0,255), 5, -1)

        parameters.centroid = centroid
    else:
        parameters.mask = np.zeros((parameters.height, parameters.width, 3))
        #if count == 0:
        #    print(Style.BRIGHT + Fore.RED + "Please place your object in front of the camera!" + Style.RESET_ALL)
        #    count += 1


def drawOnCanvas(parameters: PaintParameters):

    centroid = parameters.centroid
    last_point = parameters.last_point

    if last_point is not None and centroid is not None:
        if not parameters.drawing_square and not parameters.drawing_circle and parameters.brush:
            # get squared distance between current point and previous
            distance = (last_point[0]-centroid[0])**2 + (last_point[1]-centroid[1])**2
            # oscilation detected, draw a single point
            if distance > parameters.shake_detection_threshold and parameters.use_shake_detection:
                cv2.circle(parameters.painter, centroid, parameters.size_brush, parameters.color, -1)
            else:
                cv2.line(parameters.painter, last_point, centroid, parameters.color, parameters.size_brush, -1)
            
        #Drawing a square
        if parameters.key == ord("1") and not parameters.drawing_square:
            parameters.centroid_I = centroid
            parameters.drawing_square = True
        # Preview shape
        elif parameters.key == ord("1") and parameters.drawing_square:
            cv2.rectangle(parameters.frame, parameters.centroid_I, centroid, parameters.color, parameters.size_brush)
        # Key is no longer held, commit to drawing shape
        elif parameters.drawing_square:
            parameters.drawing_square = False
            cv2.rectangle(parameters.painter, parameters.centroid_I, centroid, parameters.color, parameters.size_brush)
            
        # Drawing a circle
        if parameters.key == ord("2") and not parameters.drawing_circle:
            parameters.centroid_I = centroid
            parameters.drawing_circle = True
        # Preview shape
        elif parameters.key == ord("2") and parameters.drawing_circle:
            radius = int(((parameters.centroid_I[0]-centroid[0])**2 + (parameters.centroid_I[1]-centroid[1])**2)**0.5)
            cv2.circle (parameters.frame, parameters.centroid_I, radius, parameters.color, parameters.size_brush)
        # Key is no longer held, commit to drawing shape
        elif parameters.drawing_circle:
            parameters.drawing_circle = False
            radius = int(((parameters.centroid_I[0]-centroid[0])**2 + (parameters.centroid_I[1]-centroid[1])**2)**0.5)
            cv2.circle (parameters.painter, parameters.centroid_I, radius, parameters.color, parameters.size_brush)
   
    parameters.last_point = centroid


def processKey(parameters: PaintParameters, window_name_paint):
    # user quits
    if parameters.key == ord("q"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"q"+Fore.RED+"\n\tEnding program")
        parameters.stop = True
    # brush
    elif parameters.key == ord("+"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"+"+"\n\tIncreasing"+Style.RESET_ALL+" brush size")
        parameters.size_brush += 1
    elif parameters.key == ord("-"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"-"+"\n\tDecreasing"+Style.RESET_ALL+" brush size")
        parameters.size_brush = max(2, parameters.size_brush-1)

    # color
    elif parameters.key == ord("r"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"r"+Style.RESET_ALL+"\n\tChanging color to "+Style.BRIGHT+Fore.RED+"RED"+Style.RESET_ALL)
        parameters.color = (0,0,255)
    elif parameters.key == ord("g"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"g"+Style.RESET_ALL+"\n\tChanging color to "+Style.BRIGHT+Fore.GREEN+"GREEN"+Style.RESET_ALL)
        parameters.color = (0,255,0)
    elif parameters.key == ord("b"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"b"+Style.RESET_ALL+"\n\tChanging color to "+Style.BRIGHT+Fore.BLUE+"BLUE"+Style.RESET_ALL)
        parameters.color = (255,0,0)

    # clear
    elif parameters.key == ord("c"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"c"+Style.RESET_ALL+"\n\tClearing canvas")
        parameters.painter = np.ones((parameters.height, parameters.width, 3), np.uint8) * 255
        if parameters.paint_numeric:
            parameters.painter = parameters.temp
    
    # save
    elif parameters.key == ord("w"):
        file_name = f"drawing_{(time.ctime(time.time())).replace(' ', '_')}.png"
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"w"+Style.RESET_ALL+"\n\tWriting to file " + Style.BRIGHT + Fore.GREEN + file_name + Style.RESET_ALL)
        cv2.imwrite(file_name, parameters.output)
        if parameters.paint_numeric:
            # do evaluation_painter
            max_pixels = (parameters.height * parameters.width * 3) - parameters.total_pixels
            total_pixels = np.sum(np.equal(parameters.evaluation_painter, parameters.painter).astype(np.uint8)) - parameters.total_pixels

            accuracy = ((total_pixels / max_pixels) * 100)

            print(f"Accuracy: {Style.BRIGHT}{Fore.GREEN}{round(accuracy,2)}{Style.RESET_ALL}%")

            if accuracy < 40:
                print("Evaluation: "+ Style.BRIGHT + Fore.RED +"Not Sattisfactory - D" + Style.RESET_ALL)
            elif accuracy < 60:
                print("Evaluation: " + Style.BRIGHT + Fore.CYAN +"Satisfactory - C" + Style.RESET_ALL)
            elif accuracy < 80:
                print("Evaluation: " + Style.BRIGHT + Fore.BLUE +"Good - B" + Style.RESET_ALL)
            elif accuracy < 90:
                print("Evaluation: " + Style.BRIGHT + Fore.GREEN +"Very Good - A" + Style.RESET_ALL)
            else:
                print("Evaluation: " + Style.BRIGHT + Fore.YELLOW +"Excellent - A+" + Style.RESET_ALL)

            cv2.destroyAllWindows()
            cv2.imshow("Evaluation", parameters.evaluation_painter)
            cv2.imshow(window_name_paint, parameters.painter)
            cv2.waitKey(0)
            parameters.stop = True

    # extra keys
    # erase
    elif parameters.key == ord("e"):
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"e"+Style.RESET_ALL+"\n\tErasing")
        parameters.color = (255,255,255)

    # switch brush
    elif parameters.key == ord("s"):
        parameters.brush = not parameters.brush
        print("Key Selected: "+Style.BRIGHT+Fore.YELLOW+"s"+Style.RESET_ALL+"\n\tSwitching brush "+((Style.BRIGHT+Fore.GREEN+"ON") if parameters.brush else (Style.BRIGHT+Fore.RED+"OFF")) +Style.RESET_ALL)
    

def finalizeOutput(parameters: PaintParameters):
    if parameters.use_video_canvas:
        mask = np.not_equal(cv2.cvtColor(parameters.painter, cv2.COLOR_BGR2GRAY), 255)
        # Repeat mask along the three channels
        mask = np.repeat(mask[:,:,np.newaxis], 3, axis=2)
        parameters.output = parameters.frame.copy()
        parameters.output[mask] = parameters.painter[mask]
    else:
        parameters.output = parameters.painter

    # flip camera and drawing horizontaly
    parameters.cam_output = cv2.flip(parameters.cam_output, 1)  
    parameters.output = cv2.flip(parameters.output, 1)  


def main():

    # parse arguments
    parser = argparse.ArgumentParser(description='Definition of test mode')
    parser.add_argument('-j', '--json', required=True, dest='JSON', help='Full path to json file.')
    parser.add_argument('-v', '--video-canvas', required=False, help='Use video streaming as canvas', action="store_true", default=False)
    parser.add_argument('-p', '--paint-numeric', required=False, help='Use a numerical canvas to paint', action="store_true", default=False)
    parser.add_argument('-s', '--use-shake-detection', required=False, help='Use shake detection', action="store_true", default=False)
    parser.add_argument('-m', '--use-mouse', required=False, help='Use mouse as brush instead of centroid', action="store_true", default=False)

    args = vars(parser.parse_args())
    print(args)

    # Print the game (Typing Test) and the group membres
    print('\n---------------------------------')
    print('| ' + Style.BRIGHT + Fore.RED + 'PSR ' + Fore.GREEN + 'Augmented Reality Painter' + ' |' + Style.RESET_ALL)
    print('|                               |')
    print('|        Filipe Goncalves       |')
    print('|         Diogo Monteiro        |')
    print('|           Fábio Silva         |')
    print('|                               |')
    print('---------------------------------\n')

    # print counter
    count = 0

    # start video capture
    capture = cv2.VideoCapture(0)

    # Opening JSON file
    try:
        with open(args["JSON"]) as f:
            data = json.load(f)
    except:
        print(f"{Fore.RED}Error opening file, exiting...{Style.RESET_ALL}")
        exit(1)


    _, frame = capture.read()
    # height and width of our captured frame
    height, width = frame.shape[0:2]

    # create parameters object
    parameters = PaintParameters(
        frame, height, width,
        args["video_canvas"],
        args["use_shake_detection"],
        args["use_mouse"],
        args["paint_numeric"]
    )


    # windows
    window_name = 'Original'
    cv2.namedWindow(window_name,cv2.WINDOW_AUTOSIZE)
    cv2.moveWindow(window_name, 1, 0)
    window_name_paint = 'Painter'
    cv2.namedWindow(window_name_paint,cv2.WINDOW_AUTOSIZE)
    cv2.moveWindow(window_name_paint, width, 0)
    window_name_segmented = 'Segmented'
    cv2.namedWindow(window_name_segmented,cv2.WINDOW_AUTOSIZE)
    cv2.moveWindow(window_name_segmented, 0, height)
    window_name_area = 'Largest Area'
    cv2.namedWindow(window_name_area,cv2.WINDOW_AUTOSIZE)
    cv2.moveWindow(window_name_area, width, height)
    window_name_commands = 'Commands'
    cv2.namedWindow(window_name_commands,cv2.WINDOW_AUTOSIZE)
    cv2.moveWindow(window_name_commands, width*2, 0)


    if parameters.use_mouse:
        # pass {'x': int, 'y': int} dict as param
        def mouseHoverCallback(event, x, y, flags, param):
            if event == cv2.EVENT_MOUSEMOVE:
                # mirror x coordinate, as the drawing is flipped horizontally
                param['x'] = width - int(x)
                param['y'] = int(y)
        cv2.setMouseCallback(window_name_paint, mouseHoverCallback, parameters.mouse_coords)

    if parameters.paint_numeric:
        # create paint numeric
        numericPainter(parameters, (0,0,0))


    # while user wants video capture
    while not parameters.stop:

        # get frame
        ret, parameters.frame = capture.read()
        parameters.cam_output = parameters.frame

        # get key
        parameters.key = cv2.waitKey(16)  # 60 fps

        # error getting the frame
        if not ret:
            print(Style.BRIGHT + Fore.RED + "failed to grab frame" + Style.RESET_ALL)
            break

        image_binary = processImage(data["limits"], parameters.frame)
        findCentroid(parameters, image_binary)
        drawOnCanvas(parameters)
        finalizeOutput(parameters)

        cv2.imshow(window_name, parameters.cam_output)
        cv2.imshow(window_name_paint, parameters.output)
        cv2.imshow(window_name_commands, commands(np.ones((frame.shape[0], frame.shape[1], 3)) * 0))
        cv2.imshow(window_name_segmented, image_binary)
        cv2.imshow(window_name_area, parameters.mask.astype(np.uint8)*255)

        processKey(parameters, window_name_paint)
        
    
    # end capture and destroy windows
    capture.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
