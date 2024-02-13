/* ----- Problème 1 ----- */

/* Prédicats */
enlever(X, [X|Q], Q).
enlever(X, [Y|Q], [Y|Q1]):- enlever(X, Q, Q1).

permut([], [].).
permut (L, [X|L2]):- enlever(X, L, L1), permut(L1, L2).

voisin(X, Y, [X, Y|Q]).
voisin(X, Y, [T|Q]):- voisin(X, Y, Q).
voisin(X, Y, L):- voisin(Y, X, L).

entre(X, Y, Z, L):- voisin(X, Z, L), voisin(Z, Y, L)

/* Données */
voisin(canard, chat, L);
entre(serpent, pingouin, ver, L).
entre(ver, lion, pinguoin).

boite([X1, X2, X3, X4, X5, X6]):- 