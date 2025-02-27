conexion(vancouver,edmonton,16).
conexion(vancouver,calgary,13).
conexion(edmonton,saskatoon,12).
conexion(calgary,edmonton,4).
conexion(calgary,regina,14).
conexion(regina,winnipeg,4).
conexion(regina,saskatoon,7).
conexion(saskatoon,calgary,9).
conexion(saskatoon,winnipeg,20).

conecta(O,D,C):-conexion(O,D,C); conexion(O,E,A), conexion(E,D,B), C is A + B.

viaje(O,D,E,C):-conexion(O,D,C); conexion(O,E,A), conexion(E,D,B), C is A + B.

aristas(X,Y):-conexion(X,Y,_).