# Aula_06_exe_01.py
#
# Chessboard Calibration
#
# Filipe Gonçalves - 11/2022

import numpy as np
import cv2
import glob

# Board Size
board_h = 9
board_w = 6

def FindAndDisplayChessboard(img):
    # Find the chess board corners
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    ret, corners = cv2.findChessboardCorners(gray, (board_w,board_h),None)

    # If found, display image with corners
    if ret == True:
        img = cv2.drawChessboardCorners(img, (board_w, board_h), corners, ret)
        cv2.imshow('img',img)
        cv2.waitKey(500)

    return ret, corners

# prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
objp = np.zeros((board_w*board_h,3), np.float32)
objp[:,:2] = np.mgrid[0:board_w,0:board_h].T.reshape(-1,2)

# Arrays to store object points and image points from all the images.
objpoints = [] # 3d point in real world space
left_corners = [] # 2d points in image plane.
right_corners = [] # 2d points in image plane.

# Read images
images_l = sorted(glob.glob('./images/left*.jpg'))
images_r = sorted(glob.glob('./images/right*.jpg'))

for fname_l, fname_r in zip(images_l, images_r):
    img_l = cv2.imread(fname_l)
    img_r = cv2.imread(fname_r)
    ret1, l_corners = FindAndDisplayChessboard(img_l)
    ret2, r_corners = FindAndDisplayChessboard(img_r)
    if ret1 and ret2:
        objpoints.append(objp)
        left_corners.append(l_corners)
        right_corners.append(r_corners)

retval, cameraMatrix1, distortion1, rvecs, tvecs = cv2.calibrateCamera(objpoints, left_corners, img_l.shape[:2], 0, 0)
retval, cameraMatrix2, distortion2, rvecs, tvecs = cv2.calibrateCamera(objpoints, right_corners, img_r.shape[:2], 0, 0)

intrinsics1 = [cameraMatrix1[0][0], cameraMatrix1[1][1], cameraMatrix1[0][2], cameraMatrix1[1][2]]        
intrinsics2 = [cameraMatrix2[0][0], cameraMatrix2[1][1], cameraMatrix2[0][2], cameraMatrix2[1][2]]

cv2.waitKey(-1)
cv2.destroyAllWindows()