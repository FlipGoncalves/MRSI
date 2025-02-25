
(cl:in-package :asdf)

(defsystem "ex4-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Dog" :depends-on ("_package_Dog"))
    (:file "_package_Dog" :depends-on ("_package"))
  ))