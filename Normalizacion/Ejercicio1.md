# Ejercicio 1
Para cada uno de los siguientes esquemas, plantear las dependencias funcionales
que encuentre entre los atributos: <br>

CIUDADES (ciu-código-postal, ciu-nombre, ciu-total-habitantes, prov-pertenececod, prov-pertenece-nombre) <br>

FACTURA (fac-número, fac-cli-código, fac-cli-nombre, fac-fecha, fac-importe,
fac-tipo) <br>

## CIUDADES (ciu-código-postal, ciu-nombre, ciu-total-habitantes, prov-pertenececod, prov- pertenece-nombre)

DF: 
ciu-codigo-postal → ciu-nombre, ciu-total-habitantes, prov-pertenece
<br>
DP: 
ciu-codigo-postal → ciu-nombre, ciu-total-habitantes 
prov-pertenececod → prov-pertenece-nomb
<br>

## FACTURA (fac-número, fac-cli-código, fac-cli-nombre, fac-fecha, fac-importe,fac-tipo)
<br>
DF
fac-numero, fac-cli-codigo, fac-tipo → fac-cli-nombre, fac-fecha, fac-importe
<br>
DP
fac-cli-codigo → fac-cli-nombre
<br>
Poner fac-tipo como parte de la clave esta mal porque el tipo tiene que prexistir antes que la factura

