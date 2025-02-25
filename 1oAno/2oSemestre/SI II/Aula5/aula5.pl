addition --> number, ['+'], number.

number --> sinal, integer ; integer.

integer --> digit ; digit, integer.

digit --> [0] ; [1] ; [2] ; [3] ; [4] ; [5] ; [6] ; [7] ; [8] ; [9].

sinal --> ['+'] ; ['-'].

regular_lang --> seq_a, seq_b.
seq_a --> [a], seq_a.
seq_a --> [].
seq_b --> [b], seq_b.
seq_b --> [].

# '' -> corresponde a um atomo
# "" -> corresponde a uma string

anbn --> [a], anbn, [b].
anbn --> [].

digit(D) --> [D], { integer(D), D =<9, D>= 0 }.

integer(N,L) --> digit(D), integer(M, K), { L is 10*K, N is M + L*D }.
integer(D,1) --> digit(D).


# aula seguinte

anbncn(N) --> seq_a(N), seq_b(N), seq_c(N).
seq_a(N) --> [a], seq_a(K), { N is K + 1 }.
seq_a(0) --> [].
seq_b(N) --> [b], seq_b(K), { N is K + 1 }.
seq_b(0) --> [].
seq_c(N) --> [c], seq_c(K), { N is K + 1 }.
seq_c(0) --> [].