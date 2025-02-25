
import math
import random

from pyswip import Prolog, registerForeign

def current_cost(*args): #foreign procedure (i.e. foreign to Prolog)
    s1, s2 = args[0].value, args[1].value
    if s1 not in traveller.spots or s2 not in traveller.spots:
        return False
    (x1,y1) = traveller.spots[s1]
    (x2,y2) = traveller.spots[s2]
    minx, miny = min(x1,x2), min(y1,y2)
    maxx, maxy = max(x1,x2), max(y1,y2)
    acum, count = 0, 0
    for x in range(minx,maxx+1):
        for y in range(miny,maxy+1):
            acum += traveller.perception[x][y]
            count += 1
    args[2].value = (1+2*acum/count)*traveller.distance(s1,s2)
    return True
 
# tell Prolog that this python procedure can be used as a predicate
registerForeign(current_cost, arity=3)

class TravellerAgent:

    def __init__(self,spots):
        self.spots = spots
        self.prolog = Prolog()
        self.prolog.consult("topology.pl") # consult map topology (graph)
        self.prolog.consult("planner.pl")  # consult planner code

    def distance(self,s1,s2):
        (x1,y1) = self.spots[s1]
        (x2,y2) = self.spots[s2]
        return math.sqrt((x1-x2)**2 + (y1-y2)**2)

    def perceive(self): # random simulation of traffic intensity
        dimx = 2 + max([x for (x,y) in self.spots.values()])
        dimy = 2 + max([y for (x,y) in self.spots.values()])
        return [ [random.random() for y in range(dimy)] for x in range(dimx) ]

    def decide(self,current,end): # wrapper of Prolog procedure
        q = f'decide({current},{end},Plan)'
        queryresult = list(self.prolog.query(q))
        if queryresult != []:
            return queryresult[0]['Plan']

    def act(self,current,plan):
        if plan[0]==current and len(plan)>1:
            print(current,'->',plan[1])
            return plan[1]

    def mainLoop(self,start,end):
        plan = None
        current = start
        while current!=end:
            self.perception = self.perceive()
            plan = self.decide(current,end)
            if plan==None:
                print('No plan exists')
                break
            print('plan -->',plan)
            current = self.act(current,plan)

traveller = TravellerAgent( { 'a':(3,8), 'b':(1,6), 'c':(6,6), 'd':(8,7),
                              'e':(4,5), 'f':(2,2), 'g':(6,3), 'h':(3,1) } )


"""
traveller.perception = traveller.perceive()
q = 'plan(a,h,Plan,Cost)'
queryresult = list(traveller.prolog.query(q))
for solution in queryresult:
    print(solution)
"""

traveller.mainLoop('a','h')



