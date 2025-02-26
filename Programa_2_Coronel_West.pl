% Naciones
asia(corea_del_sur).
america(estados_unidos).

% Nacionalidades
estaunidense(coronel_west).

% Tipo de Armas
armas(misiles).

% Pais X enemigo de Pais Y.
enemigo(X,Y):-asia(X),america(Y).

% Pais Hostil
hostil(X):-enemigo(X,_).

% Pais X tiene Y Armas
tiene(X,Y):-hostil(X),armas(Y).

% X persona Vende Y Armas a Z pais
vende(X,Y,Z):-estaunidense(X),armas(Y),tiene(Z,_).

% X Persona es Criminal
criminal(X):-vende(X,_,_).

%Busqueda
%criminal(X).