#!/bin/bash

echo "Checking if logged user is root."

if [ "$EUID" -ne 0 ]
	then echo "Please use root user."
	exit
fi

echo "Beginning"

echo "Changing directory to /"

cd /

echo "Creating directories..."

mkdir publico
mkdir adm
mkdir ven
mkdir sec

echo "Creating groups..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Creating users with a common password and forcing them to change after..."

useradd carlos -c "Carlos Silva" -g GRP_ADM -m -s /bin/bash -p $(openssl passwd -1 server123)
useradd maria -c "Maria Silva" -g GRP_ADM -m -s /bin/bash -p $(openssl passwd -1 server123)
useradd joao -c "João Silva" -g GRP_ADM -m -s /bin/bash -p $(openssl passwd -1 server123)

useradd debora -c "Débora Silva" -g GRP_VEN -m -s /bin/bash -p $(openssl passwd -1 server123)
useradd sebastiana -c "Sebastiana Silva" -g GRP_VEN -m -s /bin/bash -p $(openssl passwd -1 server123)
useradd roberto -c "Roberto Silva" -g GRP_VEN -m -s /bin/bash -p $(openssl passwd -1 server123)

useradd josefina -c "Josefina Silva" -g GRP_SEC -m -s /bin/bash -p $(openssl passwd -1 server123)
useradd amanda -c "Amanda Silva" -g GRP_SEC -m -s /bin/bash -p $(openssl passwd -1 server123)
useradd rogerio -c "Rogério Silva" -g GRP_SEC -m -s /bin/bash -p $(openssl passwd -1 server123)

passwd carlos -e
passwd maria -e
passwd joao -e
passwd debora -e
passwd sebastiana -e
passwd roberto -e
passwd josefina -e
passwd amanda -e
passwd rogerio -e

echo "Changing permissions..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "DOne."

