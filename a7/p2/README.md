# Salt-stack
## 1. Definición
`Hay varias herramientas conocidas del tipo gestor de infrastructura como Puppet, Chef y Ansible. En esta actividad vamos a practicar Salt-stack con OpenSUSE.`

## 2. Preparativos
Nuestras máquinas tendrán los siguientes nombres e IP's.

![](img/1-nombre.png)

No podemos olvidarnos de configurar `/etc/hosts`

- En Máster

![](img/etc-hosts-master.png)

- Y en Minion

![](img/etc-hosts-minion.png)

## 3. Máster: instalación y configuración
Instalamos "salt-master"

![](img/2-inst.png)

Modificamos `/etc/salt/master` de esta manera:

![](img/3-mod.png)

Activamos el servicio para que se inicie en el arranque y lo iniciamos.

![](img/4-service1.png)

![](img/4-service2.png)

Ahora consultamos los minions aceptados por el máster. De momento, no hay ninguno.


![](img/5-none.png)

## 4. Minion
### 4.1 Instalación y configuración

![](img/2-inst-minion.png)

Modificamos el archivo "minion" de "/etc/salt/" especificando quién es el máster.

![](img/6-minion.png)


>En este punto hemos tenido que desactivar el firewall, al menos momentáneamente hasta averiguar qué configuración debemos aplicarle

Activamos e iniciamos el servicio.

![](img/7-minion-sv.png)

Y comprobamos que no tenemos Apache2 instalado:
![](img/8-noapache.png)

### 4.2 Aceptación desde el Máster
Vemos que Máster ha recibido la petición de Minion.

![](img/9-salt.png)

Así que la aceptamos y comprobamos.

![](img/10-accept.png)

### 4.3. Comprobamos la conectividad

![](img/11-test.png)

## 5. Salt States
### 5.1 Preparar el directorio para los estados
Creamos los directorios `/srv/salt/base` y `/srv/salt/devel`

![](img/12-mkdir.png)

Ahora, crearemos el archivo "roots.conf" con el contenido siguiente. Y posteriormente reiniciamos el servicio "máster".

![](img/13-roots.png)

![](img/14-restart.png)

>Hemos creado los directorios para:
>- base = para guardar nuestros estados.
>- devel = para desarrollo o para hacer pruebas.

### 5.2 Crear un nuevo estado

Creamos el fichero "sls" siguiente: `/srv/salt/base/apache/init.sls`

![](img/15-init.png)

### 5.3 Asociar Minions a estados

Crear `/srv/salt/base/top.sls` donde asociamos a todos los Minions con el estado que hemos definido. El contenido es el siguiente:

![](img/16-top.png)

### 5.4 Comprobar: estados definidos

![](img/17-try.png)

### 5.5 Aplicar el nuevo estado
Primero, probamos que no haya errores en las definiciones:

![](img/18.png)

![](img/19.png)

Una vez hecho esto, aplicamos el nuevo estado en todos los minions.

![](img/20.png)

![](img/21.png)

![](img/22.png)

Comprobamos en el minion si se instaló:

![](img/23.png)

## 6. Crear más estados
### 6.1 Crear estado "users"



![](img/)

![](img/)

### 6.2 Crear estado "directories"

## 7. Añadir Minion de otro SO
