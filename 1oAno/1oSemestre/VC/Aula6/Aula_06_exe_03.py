# Aula_06_exe_03.py
#
# Stereo Chessboard Calibration
#
# Filipe Gonçalves - 11/2022

import numpy as np
import cv2
import glob

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

cv2.imshow("Left Undistort", img_undistort_l)
cv2.imshow("Right Undistort", img_undistort_r)

cv2.waitKey(-1)
cv2.destroyAllWindows()