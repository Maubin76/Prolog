% un exemple de hello world
mot('hello').
mot('world').

doubleMot(X, Y) :- mot(X), mot(Y), X\==Y.

avant(X, Y) :- compare('<',X,Y).

question :- doubleMot(A, B), write(' '), write(A), write(' '), write(B) .