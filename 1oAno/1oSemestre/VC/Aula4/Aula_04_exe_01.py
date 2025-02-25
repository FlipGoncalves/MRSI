# Aula_04_exe_01.py
#
# Dilation
#
# Filipe Gonçalves - 10/2022

#import
import sys
import numpy as np
import cv2

# Read the image from argv
image = cv2.imread( sys.argv[1] , cv2.IMREAD_GRAYSCALE )
# wdg2.bmp

# binary image
ret, image_bin = cv2.threshold(image, 120, 255, cv2.THRESH_BINARY)

# inversion of resulting image
image_inv = cv2.bitwise_not(image_bin)

# dilation of negative image
kernel = np.ones((11,11), np.uint8)
image_dil_sq = cv2.dilate(image_inv, kernel)
image_dil_cir = cv2.dilate(image_inv, cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (11,11)))

cv2.imshow('Orginal', image)
cv2.imshow('Binary Image', image_bin)
cv2.imshow('Inverted Image', image_inv)
cv2.imshow('Dilated Image Circular', image_dil_cir)
cv2.imshow('Dilated Image Squared', image_dil_sq)

cv2.waitKey(0)


