from __future__ import print_function
from pyswip import Prolog, registerForeign

def hello(t):
    print("Hello,", t)

registerForeign(hello, arity=1)

prolog = Prolog()
prolog.assertz("father(michael,john)")
prolog.assertz("father(michael,gina)")
print(list(prolog.query("father(michael,X), hello(X)")))    