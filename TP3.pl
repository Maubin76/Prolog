/* ----- Problème 1 ----- */

/* Prédicats */ 
/* Enlève X de la liste L pour obtenir L1 */
enlever(X, [X|Q], Q).
enlever(X, [Y|Q], [Y|Q1]):- enlever(X, Q, Q1).

/* Permutation de la liste L */
permut([], []).
permut(L, [X|L2]):- enlever(X, L, L1), permut(L1, L2).

/* Prédicats de test */
griffe(chat).
griffe(lion).

/* Règles */
aCote(X,Y,[X,Y|Q]).
aCote(X,Y,[Y,X|Q]).
aCote(X,Y,[T|Q]):-aCote(X,Y,Q).

entre(X,Y,Z,[X,Y,Z|Q]).
entre(X,Y,Z,[Z,Y,X|Q]).
entre(X,Y,Z,[T|Q]):-entre(X,Y,Z,Q).

boite([X1, X2, X3, X4, X5, X6]):- % Génération de la liste des animaux
                                  permut([chat, lion, serpent, canard, ver, pingouin], [X1, X2, X3, X4, X5, X6]),
                                  % Animal à griffes à la 2ème ou 3ème position
                                  griffe(X2),griffe(X3), 
                                  % Le serpent est à côté du canard
                                  aCote(canard,chat,[X1, X2, X3, X4, X5, X6]),
                                  % Le ver est entre le serpent et le pinguoin
                                  entre(serpent,ver,pingouin,[X1, X2, X3, X4, X5, X6]),
                                  % Le pinguoin est entre le ver et le lion
                                  entre(ver,pingouin,lion,[X1, X2, X3, X4, X5, X6]).