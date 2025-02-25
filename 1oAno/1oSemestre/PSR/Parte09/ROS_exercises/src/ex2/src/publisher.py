#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
import colorama

def main():

    # Initialization of a ros node
    rospy.init_node('publisher', anonymous=True)

    # Create the publisher
    publisher = rospy.Publisher("chatter", String, queue_size=10)

    color = rospy.get_param("text_color")

    # ------------------------------------
    # Execution 
    # ------------------------------------

    rate = rospy.Rate(rospy.get_param("frequency")) 

    while not rospy.is_shutdown():
        msg = getattr(colorama.Fore, color) + 'New Message: ' + str(rospy.get_time()) + colorama.Style.RESET_ALL

        rospy.loginfo('Publishing ' + msg)
        publisher.publish(msg)
        rate.sleep()

    # ------------------------------------
    # Termination 
    # ------------------------------------

if __name__ == '__main__':
    main()