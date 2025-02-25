#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from ex4.msg import Dog

def talker():

    dog = Dog() # instantiating the dog class
    dog.name = 'Dalila'
    dog.color = 'brown'
    dog.age = 5
    dog.brothers.append('Zeus')
    dog.brothers.append('Rex')

    pub = rospy.Publisher('chatter', Dog, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz

    while not rospy.is_shutdown():
        rospy.loginfo("Publishing " + str(dog))
        pub.publish(dog)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
