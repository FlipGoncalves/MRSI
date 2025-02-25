;; Auto-generated. Do not edit!


(when (boundp 'ex5::setDogName)
  (if (not (find-package "EX5"))
    (make-package "EX5"))
  (shadow 'setDogName (find-package "EX5")))
(unless (find-package "EX5::SETDOGNAME")
  (make-package "EX5::SETDOGNAME"))
(unless (find-package "EX5::SETDOGNAMEREQUEST")
  (make-package "EX5::SETDOGNAMEREQUEST"))
(unless (find-package "EX5::SETDOGNAMERESPONSE")
  (make-package "EX5::SETDOGNAMERESPONSE"))

(in-package "ROS")





(defclass ex5::setDogNameRequest
  :super ros::object
  :slots (_new_name ))

(defmethod ex5::setDogNameRequest
  (:init
   (&key
    ((:new_name __new_name) "")
    )
   (send-super :init)
   (setq _new_name (string __new_name))
   self)
  (:new_name
   (&optional __new_name)
   (if __new_name (setq _new_name __new_name)) _new_name)
  (:serialization-length
   ()
   (+
    ;; string _new_name
    4 (length _new_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _new_name
       (write-long (length _new_name) s) (princ _new_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _new_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _new_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ex5::setDogNameResponse
  :super ros::object
  :slots (_result ))

(defmethod ex5::setDogNameResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ex5::setDogName
  :super ros::object
  :slots ())

(setf (get ex5::setDogName :md5sum-) "ef27681b79a917a66e27f7b1af5214cd")
(setf (get ex5::setDogName :datatype-) "ex5/setDogName")
(setf (get ex5::setDogName :request) ex5::setDogNameRequest)
(setf (get ex5::setDogName :response) ex5::setDogNameResponse)

(defmethod ex5::setDogNameRequest
  (:response () (instance ex5::setDogNameResponse :init)))

(setf (get ex5::setDogNameRequest :md5sum-) "ef27681b79a917a66e27f7b1af5214cd")
(setf (get ex5::setDogNameRequest :datatype-) "ex5/setDogNameRequest")
(setf (get ex5::setDogNameRequest :definition-)
      "string new_name
---
bool result
")

(setf (get ex5::setDogNameResponse :md5sum-) "ef27681b79a917a66e27f7b1af5214cd")
(setf (get ex5::setDogNameResponse :datatype-) "ex5/setDogNameResponse")
(setf (get ex5::setDogNameResponse :definition-)
      "string new_name
---
bool result
")



(provide :ex5/setDogName "ef27681b79a917a66e27f7b1af5214cd")


