# Ejercicio 1 
> Para cada uno de los siguientes esquemas, plantear las dependencias funcionalesque encuentre entre los atributos:CIUDADES (ciu-código-postal, ciu-nombre, ciu-total-habitantes, prov-pertenececod, prov- pertenece-nombre)FACTURA (fac-número, fac-cli-código, fac-cli-nombre, fac-fecha, fac-importe,fac-tipo)

**CIUDADES** = (ciu-codigo-postal , ciu-nombre , ciu-total-habitantes , prov-pertenece-cod , prov-pertenece-nombre)

**FACTURA** = (fac-numero , fac-cli-codigo , fac-clinombre , fac-fecha , fac-importe , fac-tipo)

**DF CIUDADES** (Dependencias Funcionales)

ciu-codigo-postal --> ciu-nombre , ciu-total-habitantes , prov-pertenece-cod , prov-pertenece-nombre

> Con el codigo postal podemos obtener todos esos datos

**Se Cumple la 1ra Forma**

**DP CIUDADES** (Dependencias Parciales)

ciu-codigo-postal --> ciu-nombre , ciu-total-habitantes
pro-pertenece-cod --> prov-pertenece-nomb

**Se Cumple la 2da Forma**

**DF FACTURA** (Dependencias Funcionales)

fac-numero , fac-codigo , fac-tipo --> fac-cli-nombre , fac-fecha , fac-importe

**DP FACTURA** (Dependencias Parciales)

fac-cli-codigo --> fac-cli-nombre



