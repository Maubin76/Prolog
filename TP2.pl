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
triParInsertionTerminale([T|Q],Acc,S) :- inserer(T,Acc,R), triParInsertionTerminale(Q,R,S).

/* Tests

inserer(3,[1,2,4,5,6],R).
    -> R = [1,2,3,4,5,6]
triParInsertionEnveloppee([3,2,6,1,4,5],R).
    -> R = [1,2,3,4,5,6]
triParInsertionTerminale([3,2,6,1,4,5],[],R).
    -> R = [1,2,3,4,5,6]
*/

/* ----- Problème 2 ----- */

/* Prédicat d'ajout dans un arbre binaire de recherche */
ajout([], A, [[], A, []]).
ajout([G, N, D], N, [G, N, D]).
ajout([G, N, D], A, [GA, N, D]) :- A < N, ajout(G, A, GA).
ajout([G, N, D], A, [G, N, DA]) :- A > N, ajout(D, A, DA).

/* Test qui donne l'arbre du sujet de TP

ajout([[[[], 3, []], 4, [[], 5, []]] , 6, [[], 7, []]], 2, R).
    -> R = [[[[[],2,[]],3,[]],4,[[],5,[]]],6,[[],7,[]]]
    -> Ajout de 2 en bas à gauche de l'arbre
*/

/* ----- Problème 3 ----- */

/* Prédicat qui compare les feuilles de 2 arbres n-aires */

/* Prédicat de concaténation */
concatenation([], L, L).
concatenation([T|Q], L, [T|R]):- concatenation(Q, L, R).

/* Prédicat d'applatissement d'un arbre dans une liste*/
aplatir([], []).
aplatir([T|Q], R):- !, aplatir(T, T2), aplatir(Q, Q2), concatenation(T2, Q2, R).
aplatir(A, [A]).

/* Prédicat de comparaison des feuilles */
memes_feuilles([], []).
memes_feuilles(X, Y):- aplatir(X, X2)