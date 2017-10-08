# Vagrant-Project
Proyecto de virtualización de un servidor IPA con VAGRANT 

Ejecutar "vagrant up" para crear un dominio IPA. Por defecto, este dominio se generará con 1 servidor y 2 clientes.

Para crear N clientes se puede hacer uso de la variable MaxClientes, al principio del vagrant file.

Al principio del programa se hará una comprobación de si la ram necesaria para la ejecución del proyecto es mayor que
la que tienes en el propietario. Si se intenta ejecutar con una ram mayor que la que disponemos se abortará el programa,
con un mensaje de error explicando el motivo.





