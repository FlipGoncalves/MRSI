# Aula_03_ex_03.py
#
# Median Filter
#
# Filipe Gonçalves - 10/2022

#import
import sys
import numpy as np
import cv2

def printImageFeatures(image):
	# Image characteristics
	if len(image.shape) == 2:
		height, width = image.shape
		nchannels = 1;
	else:
		height, width, nchannels = image.shape

	# print some features
	print("Image Height: %d" % height)
	print("Image Width: %d" % width)
	print("Image channels: %d" % nchannels)
	print("Number of elements : %d" % image.size)

# Read the image from argv
image = cv2.imread( sys.argv[1] , cv2.IMREAD_GRAYSCALE );
#image = cv2.imread( "./lena.jpg", cv2.IMREAD_GRAYSCALE );

if  np.shape(image) == ():
	# Failed Reading
	print("Image file could not be open!")
	exit(-1)

printImageFeatures(image)

cv2.imshow('Orginal', image)

# Median filter 3 x 3
imageMFilter3x3_1 = cv2.medianBlur( image, 3)
cv2.namedWindow( "Median Filter 3 - 1 Iter", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Median Filter 3 - 1 Iter", imageMFilter3x3_1 )

# Median filter 5 x 5
imageMFilter5x5_1 = cv2.medianBlur( image, 5)
cv2.namedWindow( "Median Filter 5 - 1 Iter", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Median Filter 5 - 1 Iter", imageMFilter5x5_1 )

# Median filter 7 x 7
imageMFilter7x7_1 = cv2.medianBlur( image, 7)
cv2.namedWindow( "Median Filter 7 - 1 Iter", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Median Filter 7 - 1 Iter", imageMFilter7x7_1 )

# 2nd time filter 3 x 3
imageMFilter3x3_2 = cv2.medianBlur( imageMFilter3x3_1, 3)
# 3rd time filter 3 x 3
imageMFilter3x3_3 = cv2.medianBlur( imageMFilter3x3_2, 3)
cv2.namedWindow( "Median Filter 3 - 3 Iter", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Median Filter 3 - 3 Iter", imageMFilter3x3_3 )



cv2.waitKey(0)


