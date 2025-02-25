# Aula_03_ex_01.py
#
# Thresholding
#
# Filipe Gonçalves - 10/2022

import numpy as np
import cv2

image = cv2.imread( "./lena.jpg", cv2.IMREAD_GRAYSCALE )

cv2.imshow('Orginal', image)

ret, image_bin = cv2.threshold(image, 127, 255, cv2.THRESH_BINARY)
ret, image_bin_inv = cv2.threshold(image, 127, 255, cv2.THRESH_BINARY_INV)
ret, image_trunc = cv2.threshold(image, 127, 255, cv2.THRESH_TRUNC)
ret, image_tozero = cv2.threshold(image, 127, 255, cv2.THRESH_TOZERO)
ret, image_tozero_inv = cv2.threshold(image, 127, 255, cv2.THRESH_TOZERO_INV)

cv2.imshow('Threshold Binary', image_bin)
cv2.imshow('Threshold Binary Inverse', image_bin_inv)
cv2.imshow('Threshold Truncate', image_trunc)
cv2.imshow('Threshold ToZero', image_tozero)
cv2.imshow('Threshold ToZero Inverse', image_tozero_inv)

cv2.waitKey(0)
