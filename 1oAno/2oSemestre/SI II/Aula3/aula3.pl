%%%%%% Aula 3
%% Operadores
:- op(800, fx, if).       % unary operator
:- op(700, xfx, then).    % non associative operator
:- op(300, xfy, or).      % righ-associative operator
:- op(200, xfy, and).     % lower precedence == higher priority

%% Factos
if hall_wet and kitchen_dry then leak_in_toilet.
if hall_wet and toilet_wet then kitchen_problem.
if window_closed or no_rain then no_water_entered.
if kitchen_problem and no_water_entered then leak_in_kitchen.

fact(hall_wet).
fact(toilet_wet).
fact(window_closed).

%% Backward chaining over Prolog
% isTrue(+P) -> verifica se P é um facto
isTrue(P) :- fact(P).
isTrue(P) :- if Conditions then P, isTrue(Conditions).
isTrue(C1 and C2) :- isTrue(C1), isTrue(C2).
isTrue(C1 or C2) :- isTrue(C1); isTrue(C2).

%% Forward chaining over Prolog
% forward -> (with prolog database) encontra todos os factos em Prolog
forward :- new_fact(P), !, writeln(P), forward.
forward :- writeln('No more facts').

% new_fact(P) -> se P nao tiver sido visto, cria o novo facto P
new_fact(P) :- not_yet_seen(P), assert('$seen'(P)).

% not_yet_seen(P) -> cria novo facto P se nao tiver sido visto
not_yet_seen(P) :- fact(P), \+ seen(P).
not_yet_seen(P) :- if Conditions then P, \+ seen(P), check(Conditions).

% seen(P) -> cria novo facto P
seen(P) :- clause('$seen'(P),true).

% check(P) -> check se a condicao é verdade ou nao
check(C1 and C2) :- seen(C1), seen(C2).
check(C1 or C2) :- seen(C1); seen(C2).

% forward2(-L) -> (with prolog database) encontra todos os factos em Prolog
forward2(L) :- retractall('$seen'(_)), forward2([], L).
forward2(L1, L2) :- new_fact(P), !, writeln(P), forward2([P|L1], L2).
forward2(L, L) :- writeln('No more facts').

%%%% GRUPO II
%% 2 -
% forward3(-L) -> (without prolog database) encontra todos os factos em Prolog
forward3(L) :- forward3([],L).
forward3(L1, L2) :- not_yet_seen3(P, L1), !, forward3([P|L1], L2).
forward3(L, L).

not_yet_seen3(P, L) :- fact(P), \+ seen3(P, L).
not_yet_seen3(P, L) :- if Conditions then P, \+ seen3(P, L), check3(Conditions, L).
seen3(P, L) :- member(P, L).
check3(C1 and C2, L) :- seen3(C1, L), seen3(C2, L).
check3(C1 or C2, L) :- seen3(C1, L); seen3(C2, L).