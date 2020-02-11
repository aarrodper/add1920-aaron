# DOCKER

## 1. Contenedores con Docker

### 1.1. Introducción

Es muy común que nos encontremos desarrollando una aplicación, y llegue el momento que decidamos tomar todos sus archivos y migrarlos, ya sea al ambiente de producción, de prueba, o simplemente probar su comportamiento en diferentes plataformas y servicios.

Para situaciones de este estilo existen herramientas que, entre otras cosas, nos facilitan el embalaje y despliegue de la aplicación, es aquí donde entra en juego Docker.

Esta herramienta nos permite crear lo que ellos denominan contenedores, lo cual son aplicaciones empaquetadas auto-suficientes, muy livianas, que son capaces de funcionar en prácticamente cualquier ambiente, ya que tiene su propio sistema de archivos, librerías, terminal, etc.

Docker es una tecnología contenedor de aplicaciones construida sobre LXC.

### 1.2. Requisitos
- OpenSUSE.
- Kernel 3.10 o superior.

### 1.3. Habilitar el acceso a la red externa a los contenedores

## 2. Instalación y primer pruebas

### 2.1. Instalación

### 2.2. Primera prueba

### 2.3. Teoría
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

### 3.2. Personalizar el contenedor

### 3.3. Crear una imagen a partir del contenedor

## 4. Crear contenedor a partir de nuestra imagen

### 4.1. Crear contenedor con Nginx

### 4.2. Buscar los puertos de salida

## 5. Crear un contenedor a partir de un Dockerfile

### 5.1. Comprobaciones iniciales

### 5.2. Preparar ficheros

### 5.3. Crear imagen a partir del Dockerfile

### 5.4. Crear contenedor y comprobar

## 6. Migrar las imágenes de docker a otro servidor


### 6.1. Exportar

### 6.2. Importar

## 7. Limpiar
