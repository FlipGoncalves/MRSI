#!/usr/bin/env python3
import argparse

import rospy
from std_msgs.msg import String
import colorama


def msgReceivedCallback(msg):
    color = rospy.get_param("text_color")
    rospy.loginfo(getattr(colorama.Fore, color) + "I received " + str(msg.data) + colorama.Style.RESET_ALL)
    
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