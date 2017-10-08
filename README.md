# Vagrant-Project
Virtualization project of an IPA server with several clients made with VAGRANT 

Ejecutar "vagrant up" para crear un dominio IPA. Por defecto, este dominio se generará con 1 servidor y 1 cliente.

Para crear N clientes se puede hacer uso de la variable MaxClientes, al principio del vagrant file.

Al principio del programa se hará una comprobación de si la ram necesaria para la ejecución del proyecto es mayor que
la que tienes en el propietario. Si se intenta ejecutar con una ram mayor que la que disponemos se abortará el programa,
con un mensaje de error explicando el motivo.





