# Aula_02_ex_02.py
#
# Drawing of Grid
#
# Filipe Gonçalves - 09/2022


# import
import cv2
import sys

image = cv2.imread( sys.argv[1], cv2.IMREAD_UNCHANGED )

cv2.namedWindow("Grid", cv2.WINDOW_AUTOSIZE)

color = (111,111,111) # gray

distance = 20

# if grayscale
if len(image.shape) < 3:
	color = (255) # white

print(image.shape)
height, width = image.shape[0:2]

for i in range(distance, height, distance):
    cv2.line(image, (0,i), (width,i), color)

for i in range(distance, width, distance):
    cv2.line(image, (i,0), (i,height), color)


cv2.imshow("Grid", image)

cv2.imwrite("images/grid_image.png", image)

cv2.waitKey(-1)

cv2.destroyAllWindows()