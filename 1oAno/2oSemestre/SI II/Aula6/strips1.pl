generatePlan(IS,Objective,Plan)                     % initial state, objective, output plan
    :-  retractall(node(_,_,_,_)),                  % clean up the database (remove last search tree)
        reset_gensym,                               % reset generation of unique identifier
        gensym(node_,ID),                           % generate ID for root node
        assert(node(ID,IS,none,none)),              % store root node
        generatePlanRec([ID],Objective,solID),      % initial queue, objective, solution node
        getPlan(solID,Plan).

getPlan(ID,[])                                      % climb the tree from a given node (ID) up to the
    :-  node(ID,_,none,none).                       % root and return the corresponding sequence

getPlan(ID,Plan)                                    % of actions (Plan)
    :-  node(ID,_,Action,IDparent),
        getPlan(IDparent,Plan0),
        append(Plan0,[Action],Plan).

generateTransition(ID,State,ChildID)
    :-  stripsOperator(Action,PCL,DL,AL),           % domain-specific operators
        subset_bt(PCL,State),                       % instanciate preconditions (PCL) in State, if possible
        subtract(State,DL,AuxState),                % subtract negat. effects (subtract/3 pre-defined)
        append(AuxState,AL,NewState),               % append positive effects
        \+ (node(_,State_x,_,_), State_x=NewState),    % para nao ter repeticao de estados
        gensym(node_,ChildID),
        assert(node(ChildID,NewState,Action,ID)).   % store new node in database

subset_bt([],_).                            % similar to pre-defined subset/2, but with backtracking

subset_bt([H|T],S)
    :-  member(H,S),
        subset_bt(T,S).

generatePlanRec([ID|_],Objective,ID)
    :-  node(ID,State,_,_),
        subset(Objective,State).                    % Objective is subset of State: solution found
    % (end of recursion)

generatePlanRec([ID|Queue],Objective, SolutionID)   % recursive rule
    :-  node(ID,State,_,_),
        findall(ChildID,generateTransition(ID,State,ChildID),ChildList),
        append(Queue,ChildList,NewQueue),           % FIFO queue => breadth-first search
        generatePlanRec(NewQueue,Objective,SolutionID).