#!/usr/bin/env python

from functools import partial
import rospy
from std_msgs.msg import String
from ex5.msg import Dog
from ex5.srv import setDogName, setDogNameResponse

def serviceRequestCallback(request, dog):
    print('Received a request to change dog name to ' + request.new_name)
    dog.name = request.new_name # actually change dog name

    response = setDogNameResponse()
    response.result = 1
    return response

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

    # Create my service
    service = rospy.Service('set_dog_name', setDogName, partial(serviceRequestCallback, dog=dog))

    while not rospy.is_shutdown():
        rospy.loginfo("Publishing " + str(dog))
        pub.publish(dog)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
