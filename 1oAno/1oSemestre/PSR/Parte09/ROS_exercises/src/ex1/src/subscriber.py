#!/usr/bin/env python3
import argparse

import rospy
from std_msgs.msg import String


def msgReceivedCallback(msg):
    rospy.loginfo("I received " + str(msg.data))
    
def main():


    # Initialization of a ros node
    rospy.init_node('subscriber', anonymous=True)

    # Init the subscriber
    rospy.Subscriber("chatter", String, msgReceivedCallback)

    # ------------------------------------
    # Execution 
    # ------------------------------------
    rospy.spin()

    # ------------------------------------
    # Termination 
    # ------------------------------------

if __name__ == '__main__':
    main()