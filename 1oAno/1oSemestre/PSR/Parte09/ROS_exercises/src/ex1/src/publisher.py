#!/usr/bin/env python3

import argparse

import rospy
from std_msgs.msg import String

def main():

    # Initialization of a ros node
    rospy.init_node('publisher', anonymous=True)

    # Create the publisher
    publisher = rospy.Publisher("chatter", String, queue_size=10)

    # ------------------------------------
    # Execution 
    # ------------------------------------
    rate = rospy.Rate(10) 

    while not rospy.is_shutdown():
        msg = 'New Message: ' + str(rospy.get_time())

        rospy.loginfo('Publishing ' + msg)
        publisher.publish(msg)
        rate.sleep()

    # ------------------------------------
    # Termination 
    # ------------------------------------

if __name__ == '__main__':
    main()