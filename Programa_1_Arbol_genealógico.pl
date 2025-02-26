hombre(abraham).
hombre(homero).
hombre(herbert).
hombre(bart).
hombre(clancy).

mujer(lisa).
mujer(maggie).
mujer(marge).
mujer(selma).
mujer(patty).
mujer(jacqueline).
mujer(mona).
mujer(ling).

padre(abraham,homero).
padre(abraham,herbert).
padre(homero,bart).
padre(homero,lisa).
padre(homero,maggie).
padre(clancy,selma).
padre(clancy,patty).
padre(clancy,marge).

madre(mona,homero).
madre(jacqueline,selma).
madre(jacqueline,patty).
madre(jacqueline,marge).
madre(marge,bart).
madre(marge,lisa).
madre(marge,maggie).
madre(selma,ling).

% X es abuel@ de Z, si X es padre de Y y Y es padre Z o 
% si X es padre de Y y Y es madre Z
abuelo(X,Z):-hombre(X),(padre(X,Y),padre(Y,Z));(padre(X,Y),madre(Y,Z)).
abuela(X,Z):-mujer(X),(madre(X,Y),madre(Y,Z));(madre(X,Y),padre(Y,Z)).

% X es hij@ de Y si Y es padre de X o Y es madre de X
hijo(X,Y):-hombre(X),(padre(Y,X);madre(Y,X)).
hija(X,Y):-mujer(X),(padre(Y,X);madre(Y,X)).

% X es herman@ de Y, si Z es padre de X, y Y es hij@ de Z
hermano(X,Y):-hombre(X),padre(Z,X),(hijo(Y,Z);hija(Y,Z)),not(X=Y).
hermana(X,Y):-mujer(X),padre(Z,X),(hijo(Y,Z);hija(Y,Z)),not(X=Y).

% X es niet@ de Y si Y es abuel@ X
nieto(X,Y):-hombre(X),(abuelo(Y,X);abuela(Y,X)).
nieta(X,Y):-mujer(X),(abuelo(Y,X);abuela(Y,X)).

% X es sobrin@ de Y, si X es hijo de Z, y Z sea herman@ de Y
sobrino(X,Y):-hijo(X,Z),(hermano(Z,Y);hermana(Z,Y)).
sobrina(X,Y):-hija(X,Z),(hermano(Z,Y);hermana(Z,Y)).

% X es ti@ de Y, si Y es sobrin@ de X
tio(X,Y):-hombre(X),(sobrino(Y,X);sobrina(Y,X)).
tia(X,Y):-mujer(X),(sobrino(Y,X);sobrina(Y,X)).

% X es prim@ de Y, si X es hij@ de Z, y si Y es hij@ de W, y Z es herman@ de W
primo(X,Y):-hombre(X),(hijo(X,Z);hija(X,Z)),(hijo(Y,W);
                                            hija(Y,W)),(hermano(Z,W);hermana(Z,W)).
prima(X,Y):-mujer(X),(hijo(X,Z);hija(X,Z)),(hijo(Y,W);
                                           hija(Y,W)),(hermano(Z,W);hermana(Z,W)).

% Busquedas
% abuelo(X,Y).abuela(X,Y).
% hijo(X,Y).hija(X,Y).
% hermano(X,Y).hermana(X,Y).
% nieta(X,Y).nieto(X,Y).
% sobrino(X,Y).sobrina(X,Y).
% tio(X,Y).tia(X,Y).
% primo(X,Y).prima(X,Y).

