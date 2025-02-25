# -----------
# User Instructions
#
# Modify your doit function to incorporate 3
# distance measurements to a landmark(Z0, Z1, Z2).
#
# Each landmark measurement should modify 4
# values in your Omega matrix and 2 in your
# Xi vector.

from math import *
from matrix import matrix
import random

#===============================================================
#
# SLAM in a rectolinear world (we avoid non-linearities)
#	  
# 
#===============================================================


# ######################################################################
# ######################################################################
# ######################################################################


"""
For the following example, you would call doit(-3, 5, 3, 10, 5, 2):
3 robot positions
  initially: -3 (measure landmark to be 10 away)
  moves by 5 (measure landmark to be 5 away)
  moves by 3 (measure landmark to be 2 away)

  

which should return a mu of:
[[-3.0],
 [2.0],
 [5.0],
 [7.0]]
"""
def doit(initial_pos, move1, move2, Z0, Z1, Z2):
	#
	#
	# Add your code here.
	#
	#
	
	return mu

doit(-3, 5, 3, 10, 5, 2)



