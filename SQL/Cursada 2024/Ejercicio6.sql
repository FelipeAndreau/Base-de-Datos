A. Lionel Galo abandonó la Empresa en la que trabajaba, y fue contratado por CGO.
update UsuarioxEmpresa
set idEmpresa = '4'
where [idUsuario] = '106EBB47-610A-416D-A147-9AAF2B930DFA'
B. Maximiliano Gonzalez, fue enrolado en el ejército por lo que pidió la baja de la Empresa Albocar en la que trabajaba
hasta su regreso.
delete from UsuarioxEmpresa
where idUsuario = 'CA0937E4-D9EF-4728-963D-9B8A22D46E24'
C. Entonces luego, la empresa Albocar, adquirió la empresa Az Motor, y todos sus empleados.
update UsuarioxEmpresa
set idEmpresa = '1'
where idEmpresa = '7'
D. Luego, por un problema de seguridad, todos los empleados de Goicoechea han tenido que cambiar sus contraseñas.
update Usuario
set
Contrasena = 'Nueva contrasena'
from
UsuarioxEmpresa as UXE
where
UXE.idEmpresa = '3'
and UXE.idUsuario = Usuario.Token
