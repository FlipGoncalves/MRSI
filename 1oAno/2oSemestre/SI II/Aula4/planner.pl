decide(Start,End,Plan) 
:- 
    setof(C/P,generate_plan(Start,End,P,C),L),
    L = [C/Plan|_].

generate_plan(End,End,_,[End],0).

generate_plan(Start,End,Plan,Cost) 
:- 
    generate_plan(Start,End,[Start],Plan,Cost).

generate_plan(Start,End,Visited,[Start|Plan],Cost) 
:- 
    connected(Start,X),
    \+ member(X,Visited),
    generate_plan(X,End,[X|Visited],Plan,Cost0), 
    current_cost(Start,X,C),
    Cost is C+Cost0.