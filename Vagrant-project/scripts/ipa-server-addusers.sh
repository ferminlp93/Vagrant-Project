#!/bin/bash
# ipa-server-addusers.sh

source /vagrant/scripts/common.sh

#
# NOTA PREVIA GENERAL:
# 
#       En este script se han omitido expresamente algunas comprobaciones
#       previas a cada acción, y en general todas las comprobaciones de error.
#       Se deja al alumno que las implemente como desee, así como algunas acciones
#       que se comentan pero no se resuelven.
#

# DATOS DE ENTRADA (desde Vagrantfile):
#
# - fich_usuarios (fichero): nombre de fichero CSV que contiene los 
#                            usuarios a crear.
#                            Parámetro obligatorio.
#
#       En el fichero, hay una línea por cada usuario, y sus datos son los
#       siguientes, en orden y separados por comas:
#
#       login_name,contraseña,Nombre,Apellidos
#



fich_usuarios=$1
# 0) Comprobación previa de parámetros de entrada obligatorios
if [[ $fich_usuarios == "" ]]; then
	echo "Error: falta el nombre del fichero de usuarios"
    	exit 1
fi

# 1) Comprobamos la existencia del fichero de usuarios (relativo al directorio
#    actual "./scripts/") y en caso contrario salimos con error.

#revisar, en bash funciona... lanzandolo desde vagrant no encuentra el archivo


folder="/vagrant/scripts/"
file=$folder$fich_usuarios

if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
    	exit 1
fi
# 2) Comprobamos la existencia del dominio IPA (solicitando un tique Kerberos
#    para admin@ADMON.LAB) y en caso contrario salimos con error.

echo ${PASSWD_ADMIN} | kinit "admin@${DOMINIO_KERBEROS}" 2>/dev/null 1>/dev/null

if [[ "$?" == "0" ]]
then
	echo 'The domain exists'
else
	echo 'The domain does not exist'
	exit 1
fi

# 3) Procesamos el fichero CSV:
#
oldIFS=$IFS
IFS=','
while read f1 f2 f3 f4; do
    echo "$f1 $f2 $f3 $f4"
	sudo ipa user-show $f1
	if [[ "$?" != "0" ]]
	then
	echo $f2 | sudo ipa user-add $f1 --first=$f3 --last=$f4 --password
	fi
done < $file

IFS=$oldIFS

# Para cada línea:
#  Comprobamos si el usuario ya existe, mediante la orden
#     ipa user-show ${login_name} 
#  y en caso contradio lo creamos, mediante la orden
#     ipa user-add ${login_name} --first ${Nombre} --last $ {Apellidos} --password
#
#







