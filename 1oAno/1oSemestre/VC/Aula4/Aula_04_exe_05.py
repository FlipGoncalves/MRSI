# Aula_04_exe_05.py
#
# Opening
#
# Filipe Gonçalves - 10/2022

#import
import sys
import numpy as np
import cv2

image_art3 = cv2.imread( "images/art3.bmp" , cv2.IMREAD_GRAYSCALE )
image_art2 = cv2.imread( "images/art2.bmp" , cv2.IMREAD_GRAYSCALE )

# binary images
ret, image_art3_bin = cv2.threshold(image_art3, 120, 255, cv2.THRESH_BINARY)
ret, image_art2_bin = cv2.threshold(image_art2, 120, 255, cv2.THRESH_BINARY)

# erosion followed by dilation
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (11,11))
image_art3_er = cv2.erode(image_art3_bin, kernel)
image_art3_op = cv2.dilate(image_art3_er, kernel)

kernel = np.ones((9,3), np.uint8)
image_art2_er1 = cv2.erode(image_art2_bin, kernel)
image_art2_op1 = cv2.dilate(image_art2_er1, kernel)

kernel = np.ones((3,9), np.uint8)
image_art2_er2 = cv2.erode(image_art2_bin, kernel)
image_art2_op2 = cv2.dilate(image_art2_er2, kernel)

cv2.imshow('Orginal Art3', image_art3)
cv2.imshow('Orginal Art2', image_art2)
cv2.imshow('Opened Art3', image_art3_op)
cv2.imshow('Opened Art2 9x3', image_art2_op1)
cv2.imshow('Opened Art2 3x9', image_art2_op2)

cv2.waitKey(0)


