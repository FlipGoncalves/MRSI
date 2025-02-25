; Auto-generated. Do not edit!


(cl:in-package ex4-msg)


;//! \htmlinclude Dog.msg.html

(cl:defclass <Dog> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (age
    :reader age
    :initarg :age
    :type cl:fixnum
    :initform 0)
   (color
    :reader color
    :initarg :color
    :type cl:string
    :initform "")
   (brothers
    :reader brothers
    :initarg :brothers
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass Dog (<Dog>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Dog>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Dog)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ex4-msg:<Dog> is deprecated: use ex4-msg:Dog instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Dog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ex4-msg:name-val is deprecated.  Use ex4-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <Dog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ex4-msg:age-val is deprecated.  Use ex4-msg:age instead.")
  (age m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <Dog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ex4-msg:color-val is deprecated.  Use ex4-msg:color instead.")
  (color m))

(cl:ensure-generic-function 'brothers-val :lambda-list '(m))
(cl:defmethod brothers-val ((m <Dog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ex4-msg:brothers-val is deprecated.  Use ex4-msg:brothers instead.")
  (brothers m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Dog>) ostream)
  "Serializes a message object of type '<Dog>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'brothers))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'brothers))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Dog>) istream)
  "Deserializes a message object of type '<Dog>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'brothers) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'brothers)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Dog>)))
  "Returns string type for a message object of type '<Dog>"
  "ex4/Dog")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Dog)))
  "Returns string type for a message object of type 'Dog"
  "ex4/Dog")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Dog>)))
  "Returns md5sum for a message object of type '<Dog>"
  "3077797aba907ebe79e21a78f227ffd1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Dog)))
  "Returns md5sum for a message object of type 'Dog"
  "3077797aba907ebe79e21a78f227ffd1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Dog>)))
  "Returns full string definition for message of type '<Dog>"
  (cl:format cl:nil "string name~%uint8 age~%string color~%string[] brothers~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Dog)))
  "Returns full string definition for message of type 'Dog"
  (cl:format cl:nil "string name~%uint8 age~%string color~%string[] brothers~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Dog>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
     4 (cl:length (cl:slot-value msg 'color))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'brothers) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Dog>))
  "Converts a ROS message object to a list"
  (cl:list 'Dog
    (cl:cons ':name (name msg))
    (cl:cons ':age (age msg))
    (cl:cons ':color (color msg))
    (cl:cons ':brothers (brothers msg))
))
