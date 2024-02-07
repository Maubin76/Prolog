/* ----- Problème 1 ----- */

/* Récursivité simple */
/* inserer(X, L, S) avec :
    X : Elément à insérer
    L : Liste triée dans laquelle insérer
    S : Liste triée avec X inséré */
inserer(X, [], [X]).
inserer(X, [T|Q], [X, T|Q]) :- X =< T.
inserer(X, [T|Q], [T|S]) :- X > T, inserer(X, Q, S).

/* Récursivité enveloppée */
/* triParInsertionEnveloppee(L, S) avec :
    L = [T|Q] : Liste à trier
    S : Liste triée */
triParInsertionEnveloppee([], []).
triParInsertionEnveloppee([T|Q], S) :- triParInsertionEnveloppee(Q, QS), inserer(T, QS, S).

/* Récursivité terminale */
/* triParInsertionTerminale(L, S, Q) avec :
    L = [T|Q] : Liste à trier
    Acc : Accumulateur
    S : Liste triée */
triParInsertionTerminale([],R,R).
triParInsertionTerminale([T|Q],Acc,S) :- inserer(T,Acc,R3), triParInsertionTerminale(Q,R3,S).

/* Tests

inserer(3,[1,2,4,5,6],R).
    -> R = [1,2,3,4,5,6]
triParInsertionEnveloppee([3,2,6,1,4,5],R).
    -> R = [1,2,3,4,5,6]
triParInsertionTerminale([3,2,6,1,4,5],R,[]).
    -> R = [1,2,3,4,5,6]
*/

/* ----- Problème 2 ----- */

