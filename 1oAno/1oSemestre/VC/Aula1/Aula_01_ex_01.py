# Aula_01_ex_01.py
#
# Example of visualization of an image with openCV
#
# Filipe Gonçalves - 09/2022


#import
import numpy as np
import cv2
import sys
import random


# Read the image
image = cv2.imread( sys.argv[1], cv2.IMREAD_UNCHANGED );

if  np.shape(image) == ():
	# Failed Reading
	print("Image file could not be open")
	exit(-1)

# Image characteristics
height, width = image.shape

print("Image Size: (%d,%d)" % (height, width))
print("Image Type: %s" % (image.dtype))

# Create a vsiualization window (optional)
# CV_WINDOW_AUTOSIZE : window size will depend on image size
cv2.namedWindow( "Display window", cv2.WINDOW_AUTOSIZE )

# Show the image
cv2.imshow( "Display window", image )

# Wait
cv2.waitKey( 1000 );

# Destroy the window -- might be omitted
cv2.destroyWindow( "Display window" )



## 1.3)

image_copy = image.copy()

for x in range(height):
	for y in range(width):
		image_copy[x][y] = 0 if image[x][y] < 128 else image[x][y]


# Create a vsiualization window (optional)
# CV_WINDOW_AUTOSIZE : window size will depend on image size
cv2.namedWindow( "Display window", cv2.WINDOW_AUTOSIZE )

# Show the image
cv2.imshow( "Display window", image_copy )

# Wait
cv2.waitKey( 1000 );

# Destroy the window -- might be omitted
cv2.destroyWindow( "Display window" )



## 1.4)

# Read the image
deti_bmp = cv2.imread( "deti.bmp", cv2.IMREAD_UNCHANGED );
deti = cv2.imread( "deti.jpg", cv2.IMREAD_UNCHANGED );

# Create a vsiualization window (optional)
# CV_WINDOW_AUTOSIZE : window size will depend on image size
cv2.namedWindow( "Deti", cv2.WINDOW_AUTOSIZE )

# Show the image
cv2.imshow( "Deti", deti )
cv2.imshow( "Deti_bmp", deti_bmp )

# Wait
cv2.waitKey( 1000 );

# Destroy the window -- might be omitted
cv2.destroyWindow( "Deti" )
cv2.destroyWindow( "Deti_bmp" )

# Create a vsiualization window (optional)
# CV_WINDOW_AUTOSIZE : window size will depend on image size
cv2.namedWindow( "Deti_sub", cv2.WINDOW_AUTOSIZE )

# substract images
deti_subtract = cv2.subtract(deti, deti_bmp)
deti_subtract_2 = cv2.subtract(deti_bmp, deti)

# Show the image
cv2.imshow( "Deti_sub", deti_subtract )
cv2.imshow( "Deti_bmp_sub", deti_subtract_2 )

# Wait
cv2.waitKey( 1000 );

# Destroy the window -- might be omitted
cv2.destroyWindow( "Deti_sub" )
cv2.destroyWindow( "Deti_bmp_sub" )



## 1.5)

# Read the image
deti = cv2.imread( "deti.jpg", cv2.IMREAD_UNCHANGED );

# mouse callback function
def mouse_handler(event, x, y, flags, params): 
    if event == cv2.EVENT_LBUTTONDOWN:
        cv2.circle(deti, (x, y), 20, (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), -1)
        cv2.imshow( "Deti-Circle", deti )

# Create a vsiualization window (optional)
# CV_WINDOW_AUTOSIZE : window size will depend on image size
cv2.namedWindow( "Deti-Circle", cv2.WINDOW_AUTOSIZE )

# Mouse callback
cv2.setMouseCallback("Deti-Circle", mouse_handler)

# Show the image
cv2.imshow( "Deti-Circle", deti )

# Wait
cv2.waitKey( 5000 );

# Destroy the window -- might be omitted
cv2.destroyWindow( "Deti-Circle" )



## 1.6)

# Read the image
image_original = cv2.imread( "deti.jpg", cv2.IMREAD_UNCHANGED )

# Turn image into gray scale
image_gray = cv2.cvtColor(image_original, cv2.COLOR_BGR2GRAY)

# Create a vsiualization window (optional)
# CV_WINDOW_AUTOSIZE : window size will depend on image sizef
cv2.namedWindow( "deti_gray", cv2.WINDOW_AUTOSIZE )

# Show the image
cv2.imshow( "deti_gray", image_gray )

# Wait
cv2.waitKey( 1000 );

# Destroy the window -- might be omitted
cv2.destroyWindow( "deti_gray" )



# Optional: Take photo and save it in different formats

# video capture source camera (Here webcam of laptop)

cam = cv2.VideoCapture(0)

cv2.namedWindow("test")

img_counter = 0

while True:
    ret, frame = cam.read()
    if not ret:
        print("failed to grab frame")
        break

    cv2.imshow("test", frame)

    k = cv2.waitKey(1)

    if k == ord("q"):
        break
    elif k%256 == 32:
        # SPACE pressed

        cv2.imwrite("images/opencv_frame_{}.png".format(img_counter), frame)
        cv2.imwrite("images/opencv_frame_{}.jpeg".format(img_counter), frame)
        
        print(f"{'images/opencv_frame_{}.jpeg'.format(img_counter)} written!")
        img_counter += 1

cam.release()

cv2.destroyAllWindows()