# Aula_04_exe_04.py
#
# Segmentation
#
# Filipe Gonçalves - 10/2022

#import
import sys
import numpy as np
import cv2

# Read the image from argv
image = cv2.imread( sys.argv[1] , cv2.IMREAD_GRAYSCALE )
# mon1.bmp

# binary image
ret, image_bin = cv2.threshold(image, 90, 255, cv2.THRESH_BINARY)

# inversion of resulting image
image_inv = cv2.bitwise_not(image_bin)

# double erosion of negative image
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (11,11))
image_er_cir = cv2.erode(image_inv, kernel)
image_er_fin = cv2.erode(image_er_cir, kernel)

cv2.imshow('Orginal', image)
cv2.imshow('Binary Image', image_bin)
cv2.imshow('Inverted Image', image_inv)
cv2.imshow('Segmented Image', image_er_fin)

cv2.waitKey(0)


