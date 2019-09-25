# Actividad 2: SSH

>Antes de comenzar, ponemos los nombres de host e IP's que se nos piden en nuestras máquinas, por ejemplo en GNU/Linux:
>![hosts,ips](img/1hostnameeip.png)

>Tampoco podemos olvidarnos de añadir en el servidor ssh a los clientes en el archivo */etc/hosts* .
>![hosts](img/2clientesanadiralhosts.png)

>Realizamos algunas comprobaciones:
>![comandos1](img/4comandoparte1.png)
>![comandos2](img/4comandosparte2.png)
>![comandos3](img/4comandosparte3.png)

>Y para acabar con esta parte, creamos 4 usuarios:

>![apell](img/3usuariosenserver.png)

## (2.2) Primera conexión SSH GNU/Linux
Cuando hayamos realizado los pasos anteriores, a parte de otros que hemos obviado, realizamos la comprobación.

Vamos al cliente (*ssh-client20g*) y hacemos ping al servidor (*ssh-server20g*).

![pingserver](img/6pingaserver.png)

Comprobamos que el puerto 22 está abierto, para ello hacemos uso del "nmap".

![nmap](img/7comprobacionnmap.png)

Y ahora nos iremos conectando con nuestros usuarios desde el cliente:

![usuarios1](img/8sshrodriguez12.png)

![usuarios2](img/8sshrodriguez34.png)

Y seguidamente comprobaremos el fichero ./ssh/known_hosts:

![knownhosts](img/9hostconocidos.png)
>### Anexo: Windows
>También lo probamos en Windows haciendo uso de PuTTY
> ![windows](img/10putty.png)
> ![windows2](img/11putyfuncionando.png)

## (3.2) Comprobar cambio de clave del servidor SSH
![nokey](img/12nokey.png)

![nokey](img/12nokey2.png)

Lo hemos arreglado gracias al propio mensaje de advertencia:

![fix](img/13arr.png)
## (5) Autenticación mediante clave pública
Desde la máquina GNU/Linux cliente, **sin usar root**, creamos un nuevo par de claves para el usuario.
```
ssh-keygen -t rsa

sh-copy-id rodriguez4@ssh-server20g
```

Comprobamos que, efectivamente, desde el cliente Linux no pide password, pero sí la pide desde Windows.

![noclave](img/14nopideclavedesdelinux.png)

![siclave](img/14sipidewin.png)

## (6) Uso de SSH como túnel para X


## (8.1) Restricción sobre un usuario


## (9) Servidor SSH en Windows
