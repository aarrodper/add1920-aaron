# DOCKER

## 1. Contenedores con Docker

### 1.1. Introducción

>Es muy común que nos encontremos desarrollando una aplicación, y llegue el momento que decidamos tomar todos sus archivos y migrarlos, ya sea al ambiente de producción, de prueba, o simplemente probar su comportamiento en diferentes plataformas y servicios.

>Para situaciones de este estilo existen herramientas que, entre otras cosas, nos facilitan el embalaje y despliegue de la aplicación, es aquí donde entra en juego Docker.

>Esta herramienta nos permite crear lo que ellos denominan contenedores, lo cual son aplicaciones empaquetadas auto-suficientes, muy livianas, que son capaces de funcionar en prácticamente cualquier ambiente, ya que tiene su propio sistema de archivos, librerías, terminal, etc.

>Docker es una tecnología contenedor de aplicaciones construida sobre LXC.

## 2. Instalación y primeras pruebas

### 2.1. Habilitar el acceso a la red externa a los contenedores
- Para que el contenedor tenga acceso a la red exterior, debemos activar la opción `IP_FORWARD` (`net.ipv4.ip_forward`)

![](img/1-ipforward.png)
- Reiniciar para que se apliquen los cambios.

### 2.2. Instalación
- Ejecutar los siguientes comandos como superusuario:

```
zypper in docker        # Instala docker
systemctl start docker  # Inicia el servicio (El comando "docker daemon" hace el mismo efecto)
docker version          # Información de las versiones cliente y servidor
```

![](img/2-in.png)

![](img/2-in2.png)


- Salir de la sesión y volver a entrar con nuestro usuario



### 2.3. Primera prueba
- Ejecutar con nuestro usuario para comprobar que funciona:

```
docker images           # Muestra las imágenes descargadas hasta ahora
                        # No debe haber ninguna
docker ps -a            # Muestra todos los contenedores creados
                        # No debe haber ninguno
```
Nos da error de permisos.

![](img/error1.png)

Así que usaremos "sudo".

![](img/3.png)

- Primera prueba:

```
docker run hello-world  # Descarga y ejecuta un contenedor
                        # con la imagen "hello-world"
                        # Sólo muestra un mensaje en pantalla.
docker images           # Vemos la nueva imagen
docker ps -a            # El contenedor está estado 'Exited'
```


![](img/4.png)

![](img/5.png)

### 2.4. Teoría
Tabla de referencia para no perderse:

| Software   | Base   | Sirve para crear   | Aplicaciones |
| ---------- | ------ | ------------------ | ------------ |
| VirtualBox | ISO    | Máquinas virtuales | N |
| Vagrant    | Box    | Máquinas virtuales | N |
| Docker     | Imagen | Contenedores       | 1 |


Información sobre otros comandos útiles:

| Comando                     | Descripción |
| --------------------------- | ------------------- |
| `docker stop CONTAINERID`   | parar un contenedor |
| `docker start CONTAINERID`  | iniciar un contenedor |
| `docker attach CONTAINERID` | conectar el terminal actual con el interior de contenedor |
| `docker ps`                 | mostrar los contenedores en ejecución |
| `docker ps -a`              | mostrar todos los contenedores (en ejecución o no) |
| `docker rm CONTAINERID`     | eliminar un contenedor |
| `docker rmi IMAGENAME`      | eliminar una imagen |

---
## 3. Creación manual

### 3.1. Crear una imagen manualmente

```
docker images        # Vemos las imágenes disponibles localmente
docker search debian # Buscamos en los repositorios de Docker Hub
                     # contenedores con la etiqueta `debian`
docker pull debian:9 # Descargamos una imagen `debian:9` en local
docker images
docker ps -a         # Vemos todos los contenedores
docker ps            # Vemos sólo los contenedores en ejecución
```

![](img/6.png)

![](img/7.png)

![](img/8.png)

- Crear un contenedor de nombre "con_debian" a partir de la imagen "debian:9" y ejecutar `/bin/bash`

![](img/9.png)

### 3.2. Personalizar el contenedor
```
root@IDContenedor:/# cat /etc/motd            # Comprobamos que estamos en Debian
root@IDContenedor:/# apt-get update
root@IDContenedor:/# apt-get install -y nginx # Instalamos nginx en el contenedor
root@IDContenedor:/# /usr/sbin/nginx          # Iniciamos el servicio nginx
root@IDContenedor:/# ps -ef          
```

![](img/10.png)

![](img/11.png)

![](img/12.png)

![](img/13.png)

> Hemos tenido que instalar "ps" con el comando `apt-get install procps`

![](img/14.png)

- Creamos un fichero `holamundo.html`

![](img/15.png)

- Creamos un script con el contenido siguiente:

![](img/back1.png)

- No olvidar darle permisos:

![](img/back2.png)

### 3.3. Crear una imagen a partir del contenedor

- Abrimos otra ventana del terminal

- ![](img/21.png)

- Comprobamos ![](img/22.png)

## 4. Crear contenedor a partir de nuestra imagen

### 4.1. Crear contenedor con Nginx

Iniciamos el contenedor a partir de la imagen anterior, indicando su puerto y que ejecute el script.

![](img/24.png)

### 4.2. Buscar los puertos de salida

Vemos a qué puerto está redireccionado el puerto 80 del contenedor. Vemos que es el primero.

![](img/38.png)

Abrimos un navegador y ponemos "0.0.0.0:PUERTO", en mi caso:

![](img/39-2.png)

Y comprobamos el acceso a "holamundo.html"

![](img/39.png)

Parar el contenedor `con_nginx1` y lo borramos

![](img/40.png)

### 4.3. Migrar la imagen a otra máquina

Exportamos la imagen docker a un fichero tar

![](img/41.png)

Intercambiamos nuestra imagen con la de un compañero.

![](img/42.png)

Importamos la imagen Docker del compañero.

![](img/43.png)

## 5. Dockerfile

### 5.1. Preparar ficheros

- Crear  directorio /home/aaron/docker20a, entrar y meter ahí "holamundo.html" y "server.sh".

- ![](img/44.png)


- Además, crearemos "Dockerfile" con el contenido de la captura siguiente.

- ![](img/46.png)

- ![](img/47.png)


### 5.2. Crear imagen a partir del Dockerfile
En el directorio "docker20a" construimos una nueva imagen a partir del Dockerfile

![](img/48.png)

Aquí nos aparece :+1:

![](img/49.png)
### 5.3. Crear contenedor y comprobar

Creamos el contenedor a partir de la imagen...

![](img/50.png)

Comprobamos desde otra terminal qué puerto escucha...

![](img/51.png)

Y vía navegador web, comprobamos

![](img/52.png)

![](img/53.png)

### 5.4. Usar imágenes ya creadas

Crear el directorio "docker20b" y entrar en él.

![](img/55.png)

Ahora, crear el siguiente Dockerfile...

![](img/56.png)

## 6. Limpiar contenedores e imágenes
