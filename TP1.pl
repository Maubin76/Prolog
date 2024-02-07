/* modélisation du graphe
   et exemple de commentaires sur plusieurs lignes */
   
/* Problème 1 */
/* Exemple de graphe */
arc(1,2).
arc(1,3).
arc(2,4).
arc(2,5).
arc(3,5).
arc(4,5).
arc(4,6).
arc(5,6).

/* Récursivité simple : définition d'un chemin */
chemin(X, Y) :- arc(X,Y).
chemin(X, Y) :- arc(X, Z) , chemin(Z, Y).

/* Problème 2 */

membre(X, [X|Q]).
membre(X, [T|Q]) :- membre(X, Q).

inclus([], Y).
inclus([T|Q], Y) :- membre(T, Y) , inclus(Q, Y).

enlever(X, [], []).
enlever(X, [T|Q], [T|Q2]) :- enlever(X, Q, Q2).

egal_ens(X, Y) :- inclus(X, Y) , inclus(Y,X).

intersection([], Y, []).
intersection([X|Q], Y, [X|Z]) :- membre(X, Y) , intersection(Q, Y, Z).
intersection([X|Q], Y, Z) :- intersection(Q, Y, Z).

disjoint(X, Y) :- intersection(X, Y, Z).

non(P) :- P, !, fail.
non(P) :- P=P.
