# **U7 - P2: Salt-stack**
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
- El **objetivo** es crear dos usuarios y un grupo (al que pertencerán)

>No olvidemos que tenemos que añadir este nuevo estado a "top.sls".
![](img/28.png)

>Y, antes de aplicar, comprobar con
```
    salt '*' state.show_lowstate
    salt '*' state.show_highstate
```

![](img/24-users.png)

Y aplicarlo.

![](img/25.png)

![](img/26.png)

Comprobamos en el cliente (Minion) si se han creado los usuarios y el grupo.

![](img/27-bien.png)

¡Perfecto! :+1:
### 6.2 Crear estado "directories"

- El **objetivo** es crear las carpetas private (700), public (755) y group (750) en el home del usuario koji20.

Lo haremos de esta manera:

![](img/29.png)

Lo añadimos a "top.sls" y aplicamos.

![](img/30.png)

![](img/31.png)

Por último, comprobamos.

![](img/32.png)

¡Bien! :+1:

## 7. Añadir Minion de otro SO (W7)
>Añadir a /etc/hosts
![](img/33.png)
Y en Windows también
![](img/34.png)

Instalamos "salt-minion"

![](img/35.png)

Aceptamos al minion en el máster, como hicimos anteriormente en OpenSUSE.

![](img/36.png)

![](img/37.png)

¡Y ya estaría! :smile: 
