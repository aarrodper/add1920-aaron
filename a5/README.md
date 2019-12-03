# Servidor 389-DS - OpenSUSE
## [1.1] Nombre de equipo FQDN

![](img/0.png)

Ahora, lo conveniente sería abrir los puertos necesarios del cortafuegos. Pero vamos a comprobar si se abren automáticamente con la instalación.

## [2.1] Instalación del paquete
Es tan simple como `zypper in 389-ds` y luego ejecutar el script que se descarga en `/usr/sbin/setup-ds.pl`

Lo dejamos todo por defecto, excepto los siguientes puntos.
- `Setup type: 2. Typical`
- `FQDN: server20.curso1920`
- `DS identifier: ldap20`
- `Suffix (valid DN): dc=ldap20,dc=curso1920`

Nos dará un error con el módulo *selinux*, pero de momento no indagaremos en él.

## [2.2] Comprobamos el servicio

![servicio](img/2-compserv.png)

![cortafuegos](img/2-compfire.png)

>El cortafuegos se modificó automáticamente :+1:

## [2.3] Comprobar el acceso al contenido

![ldapsearch -b](img/2-compbasedatos.png)
- Observamos que existen las OU Groups y People :+1:

![ldapsearch pass](img/2-compbasedatospass.png)

- Hemos realizado la misma consulta pero usando usuario y clave.

## [3.1] Buscar Unidades Organizativas

![buscar ou](img/5.png)

## [3.2] Agregar usuarios

Para ello usaremos un fihero **ldif** como el siguiente.


## [3.3] Comprobar nuevo usuario
