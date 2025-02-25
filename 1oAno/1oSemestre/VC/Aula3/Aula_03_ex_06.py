# Aula_03_ex_06.py
#
# Canny Edges
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

# Canny FIlter 1 - 255
imageCFilter255 = cv2.Canny( image, 1, 255)
cv2.namedWindow( "Canny Filter 1 - 255", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Canny Filter 1 - 255", imageCFilter255 )

# Canny FIlter 220 - 225
imageCFilter220 = cv2.Canny( image, 220, 225)
cv2.namedWindow( "Canny Filter 220 - 225", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Canny Filter 220 - 225", imageCFilter220 )

# Canny FIlter 1 - 128
imageCFilter128 = cv2.Canny( image, 1, 128)
cv2.namedWindow( "Gaussian Filter 1 - 128", cv2.WINDOW_AUTOSIZE )
cv2.imshow( "Gaussian Filter 1 - 128", imageCFilter128 )


cv2.waitKey(0)


