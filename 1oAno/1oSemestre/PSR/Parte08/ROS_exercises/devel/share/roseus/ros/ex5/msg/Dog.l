;; Auto-generated. Do not edit!


(when (boundp 'ex5::Dog)
  (if (not (find-package "EX5"))
    (make-package "EX5"))
  (shadow 'Dog (find-package "EX5")))
(unless (find-package "EX5::DOG")
  (make-package "EX5::DOG"))

(in-package "ROS")
;;//! \htmlinclude Dog.msg.html


(defclass ex5::Dog
  :super ros::object
  :slots (_name _age _color _brothers ))

(defmethod ex5::Dog
  (:init
   (&key
    ((:name __name) "")
    ((:age __age) 0)
    ((:color __color) "")
    ((:brothers __brothers) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _age (round __age))
   (setq _color (string __color))
   (setq _brothers __brothers)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:brothers
   (&optional __brothers)
   (if __brothers (setq _brothers __brothers)) _brothers)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint8 _age
    1
    ;; string _color
    4 (length _color)
    ;; string[] _brothers
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _brothers)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint8 _age
       (write-byte _age s)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;; string[] _brothers
     (write-long (length _brothers) s)
     (dolist (elem _brothers)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _age
     (setq _age (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _brothers
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _brothers (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _brothers i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get ex5::Dog :md5sum-) "3077797aba907ebe79e21a78f227ffd1")
(setf (get ex5::Dog :datatype-) "ex5/Dog")
(setf (get ex5::Dog :definition-)
      "string name
uint8 age
string color
string[] brothers
")



(provide :ex5/Dog "3077797aba907ebe79e21a78f227ffd1")


