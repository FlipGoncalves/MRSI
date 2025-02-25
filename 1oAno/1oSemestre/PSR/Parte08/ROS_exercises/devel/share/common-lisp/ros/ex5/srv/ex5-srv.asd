
(cl:in-package :asdf)

(defsystem "ex5-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "setDogName" :depends-on ("_package_setDogName"))
    (:file "_package_setDogName" :depends-on ("_package"))
  ))