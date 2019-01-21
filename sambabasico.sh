#!/bin/sh
clear
echo "             "
echo "                                             "
echo "         Servidor Samba Configuracion Basica y Rapida"
echo "                                              "
echo "                                                  "
echo "                     "
echo "        1-Crear Servidor  "
echo "        2-Añadir Usuarios "

MENSAJE=0
USUA=$USER

read option

#opcion 1
if [ ${option} -eq 1 ]
then
echo "  Nombre de Carpeta compartida:"
read name
if [ ${#name} -lt 2 ]; then echo "Nombre demasiado corto";exit
fi

echo " "
echo "                   Tomate un Momento mientras se ejecuta el script"
echo "   "
echo "  Loading  ...."
MENSAJE=$option
echo " "
echo "        elige un usuario ##escribe bien"
echo " ------------ "
ls /home
echo "---------"
echo " "
read usuario
if [ ${#usuario} -lt 2 ]; then echo "Corto";exit
fi
#echo "esto es nuevo $MENSAJE"
sudo echo "[$name]" >> /etc/samba/smb.conf
sudo echo "comment = samba" >> /etc/samba/smb.conf
echo "    Loading ...."
sudo echo "path = /home/$usuario" >> /etc/samba/smb.conf
sudo echo "guest ok = no" >> /etc/samba/smb.conf
sudo echo "writeable = yes" >> /etc/samba/smb.conf
sudo echo "browseable = yes" >> /etc/samba/smb.conf
sudo echo "create mask = 0755" >> /etc/samba/smb.conf
echo "      Loading ...."
sudo echo "directory mask = 0755" >> /etc/samba/smb.conf

echo "      "
echo "          "
echo "   añade una contraseña "
echo "     "

sudo smbpasswd -a $usuario 

sudo service smbd restart
echo "       "

clear
echo "Directorio Compartido /home/$usuario"
echo "Usuario con acceso $usuario"
exit
# aqui esta la opcion 2
elif [ ${option} -eq 2 ]
then 

echo " --------------      "
ls /home

echo " ---------  "
echo "escoge al usuario"
echo "   "
read user

if [ ${#user} -lt 2 ]; then echo "Corto";exit
fi


sudo smbpasswd -a $user 


sudo service smbd restart

exit
else
exit
fi