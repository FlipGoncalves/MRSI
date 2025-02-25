# Aula_04_exe_06.py
#
# Closing
#
# Filipe Gonçalves - 10/2022

#import
import sys
import numpy as np
import cv2

# Read the image from argv
image = cv2.imread( "images/art4.bmp" , cv2.IMREAD_GRAYSCALE )

# binary image
ret, image_bin = cv2.threshold(image, 90, 255, cv2.THRESH_BINARY)

# inversion of resulting image
image_inv = cv2.bitwise_not(image_bin)

# dilation followed by erosion
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (22,22))
image_dil = cv2.dilate(image_inv, kernel)
image_clo = cv2.erode(image_dil, kernel)

cv2.imshow('Orginal', image)
cv2.imshow('Closed Image', image_clo)

cv2.waitKey(0)


