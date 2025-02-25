%%%%%% Aula 2
% occurs(+X, +L) -> se X ocorre na lista L
occurs(X, [X|_]).
occurs(X, [_|T]) :- occurs(X, T).

% concatenate(+L1, +L2, -L3) -> concatenar a lista L1 e a lista L2 na lista L3
concatenate([], L, L).
concatenate([H1|T1], L2, [H1|T3]) :- concatenate(T1, L2, T3).

% invert(+L, -I) -> inverter a lista L e retornar na lista I
invert([], []).
invert([H|T], I) :- invert(T, IT), concatenate(IT, [H], I).

% count(+X, +L, -N) -> contar o numero de vezes que X aparece na lista e retornar na constante N
count(X, [], 0).
count(X, [H|T], N) :- count2(X, T, N1), N is N1+1.
count(X, [Y|T], N) :- Y\=X, count(X, T, N).

% count2(+X, +L, -N) -> contar o numero de vezes que X aparece na lista e retornar na constante N, mas com cut (!)
count2(X, [], 0).
count2(X, [X|T], N) :- !, count2(X, T, N1), N is N1+1.
count2(X, [Y|T], N) :- count2(X, T, N).

% mininum_of_list(+L, -Min) -> valor minimo Min na lista L
mininum_of_list([X], X).
mininum_of_list([H|T], Min) :- mininum_of_list(T, Min), Min<H, !.
mininum_of_list([H|_], H).

% less_abs_than(+X, +Y) -> verificar se o valor absoluto de X e menor que o valor absoluto de Y
less_abs_than(X, Y) :- AbsX is abs(X), AbsY is abs(Y), AbsX<AbsY.