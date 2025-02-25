# Aula_03_ex_05.py
#
# Sobel Operator
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

if  np.shape(image) == ():
	# Failed Reading
	print("Image file could not be open!")
	exit(-1)

printImageFeatures(image)

cv2.imshow('Orginal', image)

# Sobel Operatot 3 x 3
imageSobel3x3_X = cv2.Sobel(image, cv2.CV_64F, 1, 0, 3)
imageSobel3x3_Y = cv2.Sobel(image, cv2.CV_64F, 0, 1, 3)

cv2.namedWindow( "Sobel 3 x 3", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Sobel 3 x 3 - X", imageSobel3x3_X )
cv2.imshow( "Sobel 3 x 3 - Y", imageSobel3x3_Y )
image8bits = np.uint8( np.absolute(imageSobel3x3_X) ) + np.uint8( np.absolute(imageSobel3x3_Y) )

cv2.imshow( "8 bits - Sobel 3 x 3 - X+Y", image8bits )


cv2.waitKey(0)


