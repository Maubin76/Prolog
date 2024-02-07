/* ----- Problème 1 ----- */

inserer(X, [], [X]).
inserer(X, [T|Q], [X, T|Q]) :- X =< T.
inserer(X, [T|Q], [T|S]) :- X > T, inserer(X, Q, S).

/* Récursivité enveloppée */
triParInsertionEnveloppee([], []).
triParInsertionEnveloppee([T|Q], S) :- triParInsertion(Q, QS), inserer(T, QS, S).

/* Récursivité terminale */
/* triParInsertionTerminale(L, S, Q) avec :
    L : Liste à trier
    S : Liste triée
    Acc : Accumulateur */
triParInsertionTerminale([],R,R).
triParInsertionTerminale([T|Q],R,R2) :- inserer(T,R,R3), triParInsertion2(Q,R3,R2).

/* Tests

inserer([3,6],[1,2,4,5],R).

triParInsertionEnveloppee([3,2,6,1,4,5],R).

triParInsertionTerminale([3,2,6,5],[1,4],R).

*/

/* ----- Problème 2 ----- */

