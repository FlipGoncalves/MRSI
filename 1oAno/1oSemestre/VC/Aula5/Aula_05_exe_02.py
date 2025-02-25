# Aula_05_exe_02.py
#
# Referencial Imprinting in calirated image
#
# Filipe Gonçalves - 11/2022

import numpy as np
import cv2
import glob

# Board Size
board_h = 9
board_w = 6

# Arrays to store object points and image points from all the images.
objpoints = [] # 3d point in real world space
imgpoints = [] # 2d points in image plane.


def  FindAndDisplayChessboard(img):
    # Find the chess board corners
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    ret, corners = cv2.findChessboardCorners(gray, (board_w,board_h),None)

    return ret, corners

# prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
objp = np.zeros((board_w*board_h,3), np.float32)
objp[:,:2] = np.mgrid[0:board_w,0:board_h].T.reshape(-1,2)

# Arrays to store object points and image points from all the images.
objpoints = [] # 3d point in real world space
imgpoints = [] # 2d points in image plane.

# Read images
images = glob.glob('./images/left*.jpg')

cameraMatrix = []
distortion = []
rvecs = []
tvecs = []

for fname in images:
    img = cv2.imread(fname)
    ret, corners = FindAndDisplayChessboard(img)
    if ret == True:
        objpoints.append(objp)
        imgpoints.append(corners)

    retval, cameraMatrix, distortion, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, img.shape[:2], 0, 0)
    
    intrinsics = [cameraMatrix[0][0], cameraMatrix[1][1], cameraMatrix[0][2], cameraMatrix[1][2]]

retval, _ = cv2.projectPoints(np.float64([[0,0,0],[0,0,-2],[0,2,0],[2,0,0]]), rvecs[-1], tvecs[-1], cameraMatrix, distortion)
print(retval)

cv2.line(img, (int(retval[0][0][0]), int(retval[0][0][1])), (int(retval[1][0][0]), int(retval[1][0][1])), (0,0,255), 3)
cv2.line(img, (int(retval[0][0][0]), int(retval[0][0][1])), (int(retval[2][0][0]), int(retval[2][0][1])), (0,255,0), 3)
cv2.line(img, (int(retval[0][0][0]), int(retval[0][0][1])), (int(retval[3][0][0]), int(retval[3][0][1])), (255,0,0), 3)

cv2.imshow('img',img)
cv2.waitKey(-1)
cv2.destroyAllWindows()