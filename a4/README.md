# SAMBA - OpenSUSE

![0](img/0.png)

### (1.4 y 1.5) Fichero smb.conf 	

![C1](img/confi1.png)

![C2](img/confi2.png)

![C3](img/confi3.png)

### (2.1 y 2.2) Conexión SMB desde Windows

![S1](img/sambacarpetas.png)

Accedemos con el usuario "invitado" al recurso compartido
![S2](img/30-invitado.png)

Accedemos con "soldado"
![S3](img/31-soldado.png)

Accedemos con "pirata"
![S4](img/32-pirata.png)

Y en el servidor, comprobamos con el comando ```sudo smbstatus```:
![S5](img/33-smb.png)

Por comandos...

Vemos los recursos de esta máquina.
![S6](img/34.png)
Creamos un recurso compartido y lo montamos en S:.
![S7](img/35.png)

![S8](img/36.png)

![S9](img/37.png)

![S10](img/38.png)

### (3.1 y 3.2) Conexión SMB desde GNU/Linux 	
![S11](img/41.png)

![S12](img/42.png)

![S13](img/40.png)

Por comandos...

![](img/43.png)

![](img/44.png)

![](img/45.png)
```sudo smbstatus```
![](img/46.png)
```lsof -i```
![](img/47.png)

### (3.3) Montaje automático
