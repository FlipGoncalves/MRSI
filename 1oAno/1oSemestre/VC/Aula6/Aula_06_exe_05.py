# Aula_06_exe_05.py
#
# Stereo Image Rectification
#
# Filipe Gonçalves - 11/2022

import numpy as np
import cv2
import glob
from functools import partial

def mouse_handler(event, x, y, flags, params, img, window_name):

    if event == cv2.EVENT_LBUTTONDOWN:
        p = np.asarray([x,y]) 
        epilineR = cv2.computeCorrespondEpilines(p.reshape(-1,1,2), 1, F) 
        epilineR = epilineR.reshape(-1,3)[0]
        color = np.random.randint(0, 255, 3).tolist()

        points_x = [0, img.shape[1]]
        m = - epilineR[0]/epilineR[1]
        b = - (epilineR[2] - 10)/epilineR[1]

        points = [  (points_x[0], int(m*points_x[0]+b)), 
                    (points_x[1], int(m*points_x[1]+b))   ]

        cv2.line(img, points[0], points[1], color, 2)
        cv2.imshow(window_name, img)

def drawlines(img):
    height, width, _ = img.shape

    for i in range(0, height, 25):
        color = np.random.randint(0, 255, 3).tolist()
        cv2.line(img, (0,i), (width,i), color, 2)

with np.load('stereoParams.npz') as data: 
    intrinsics1 = data['intrinsics1'] 
    distortion1 = data['distortion1']
    intrinsics2 = data['intrinsics2'] 
    distortion2 = data['distortion2']
    R = data['R']
    T = data['T']
    E = data['E']
    F = data['F']
    
# Read images
images_l = sorted(glob.glob('.//images//left*.jpg'))
images_r = sorted(glob.glob('.//images//right*.jpg'))

img_l = cv2.imread(images_l[0])
img_r = cv2.imread(images_r[0])

img_undistort_l = cv2.undistort(img_l, intrinsics1, distortion1)
img_undistort_r = cv2.undistort(img_r, intrinsics2, distortion2)

R1 = np.zeros(shape=(3,3)) 
R2 = np.zeros(shape=(3,3)) 
P1 = np.zeros(shape=(3,4)) 
P2 = np.zeros(shape=(3,4)) 
Q = np.zeros(shape=(4,4))

height, width = img_undistort_l.shape[:2]

R1, R2, P1, P2, Q, _, _ = cv2.stereoRectify(intrinsics1, distortion1, intrinsics2, distortion2 ,(width, height), R, T, R1, R2, P1, P2, Q, flags=cv2.CALIB_ZERO_DISPARITY, alpha=-1, newImageSize=(0,0))

map1x, map1y = cv2.initUndistortRectifyMap(intrinsics1, distortion1, R1, P1, (width,height), cv2.CV_32FC1) 
map2x, map2y = cv2.initUndistortRectifyMap(intrinsics2, distortion2, R2, P2, (width,height), cv2.CV_32FC1)

imgl_rect = cv2.remap(img_l, map1x, map1y, cv2.INTER_LINEAR)
imgr_rect = cv2.remap(img_r, map2x, map2y, cv2.INTER_LINEAR)

imgl = imgl_rect.copy()
imgr = imgr_rect.copy()

drawlines(imgl)
drawlines(imgr)

cv2.imshow("Left Rectified", imgl)
cv2.imshow("Right Rectified", imgr)

cv2.waitKey(-1)

cv2.imshow("Left Rectified", imgl_rect)
cv2.imshow("Right Rectified", imgr_rect)

cv2.setMouseCallback("Left Rectified", partial(mouse_handler, img=imgr_rect, window_name="Right Rectified"))
cv2.setMouseCallback("Right Rectified", partial(mouse_handler, img=imgl_rect, window_name="Left Rectified"))

cv2.waitKey(-1)
cv2.destroyAllWindows()