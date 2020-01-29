
## 3.3. Comprobar proyecto 1
![vagrant up 1](img/proyecto1b.png)

![vagrant ssh 1](img/proyecto1c.png)

## 5.2. Comprobar proyecto 2

![vagrant port](img/proyecto2d.png)

![apache](img/proyecto2e.png)

## 6.1. Suministro Shell Script

Tras crear el directorio, creamos un proyecto Vagrant y un script `install_apache.sh`

![](img/proyecto3a.png)

Su contenido es el siguiente:

![](img/proyecto33b.png)

Entonces, debemos indicarle al Vagrantfile que ejecute el script anterior:

![](img/proyecto3c.png)

Creamos la MV:

![](img/proyecto3d.png)

Verificamos:

![](img/proyecto33.png)

## 6.2. Suministro Puppet

En el Vagrantfile... (debemos instalar Puppet o no funcionará, por esto usaremos `installpuppet.sh`)
![](img/proyecto4a.png)

![](img/proyecto4b.png)

En el `default.pp` añadimos los paquetes que queramos instalar, en mi caso elegí "geany".

![](img/proyecto4c.png)

Creamos la máquina con `vagrant up` y comprobamos si se ha instalado el geany o no. Para ello, nos conectamos con `vagrant ssh` y comprobamos si está instalado el paquete con `dpkg -s geany`

![](img/proyecto4d.png)

Ha funcionado :+1:

## 7.2. Crear Box Vagrant

![](img/proyecto5redo.png)

![](img/proyecto5redo2.png)

![](img/proyecto5redo3.png)

![](img/proyecto5redo4.png)

Y comprobamos conectándonos por ssh

![](img/proyecto5redo5.png)
