; Auto-generated. Do not edit!


(cl:in-package ex5-srv)


;//! \htmlinclude setDogName-request.msg.html

(cl:defclass <setDogName-request> (roslisp-msg-protocol:ros-message)
  ((new_name
    :reader new_name
    :initarg :new_name
    :type cl:string
    :initform ""))
)

(cl:defclass setDogName-request (<setDogName-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setDogName-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setDogName-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ex5-srv:<setDogName-request> is deprecated: use ex5-srv:setDogName-request instead.")))

(cl:ensure-generic-function 'new_name-val :lambda-list '(m))
(cl:defmethod new_name-val ((m <setDogName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ex5-srv:new_name-val is deprecated.  Use ex5-srv:new_name instead.")
  (new_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setDogName-request>) ostream)
  "Serializes a message object of type '<setDogName-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'new_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'new_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setDogName-request>) istream)
  "Deserializes a message object of type '<setDogName-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'new_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'new_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setDogName-request>)))
  "Returns string type for a service object of type '<setDogName-request>"
  "ex5/setDogNameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setDogName-request)))
  "Returns string type for a service object of type 'setDogName-request"
  "ex5/setDogNameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setDogName-request>)))
  "Returns md5sum for a message object of type '<setDogName-request>"
  "ef27681b79a917a66e27f7b1af5214cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setDogName-request)))
  "Returns md5sum for a message object of type 'setDogName-request"
  "ef27681b79a917a66e27f7b1af5214cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setDogName-request>)))
  "Returns full string definition for message of type '<setDogName-request>"
  (cl:format cl:nil "string new_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setDogName-request)))
  "Returns full string definition for message of type 'setDogName-request"
  (cl:format cl:nil "string new_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setDogName-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'new_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setDogName-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setDogName-request
    (cl:cons ':new_name (new_name msg))
))
;//! \htmlinclude setDogName-response.msg.html

(cl:defclass <setDogName-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass setDogName-response (<setDogName-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setDogName-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setDogName-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ex5-srv:<setDogName-response> is deprecated: use ex5-srv:setDogName-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <setDogName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ex5-srv:result-val is deprecated.  Use ex5-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setDogName-response>) ostream)
  "Serializes a message object of type '<setDogName-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setDogName-response>) istream)
  "Deserializes a message object of type '<setDogName-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setDogName-response>)))
  "Returns string type for a service object of type '<setDogName-response>"
  "ex5/setDogNameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setDogName-response)))
  "Returns string type for a service object of type 'setDogName-response"
  "ex5/setDogNameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setDogName-response>)))
  "Returns md5sum for a message object of type '<setDogName-response>"
  "ef27681b79a917a66e27f7b1af5214cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setDogName-response)))
  "Returns md5sum for a message object of type 'setDogName-response"
  "ef27681b79a917a66e27f7b1af5214cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setDogName-response>)))
  "Returns full string definition for message of type '<setDogName-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setDogName-response)))
  "Returns full string definition for message of type 'setDogName-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setDogName-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setDogName-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setDogName-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setDogName)))
  'setDogName-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setDogName)))
  'setDogName-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setDogName)))
  "Returns string type for a service object of type '<setDogName>"
  "ex5/setDogName")