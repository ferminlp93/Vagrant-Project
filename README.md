# Vagrant-Project
Virtualization project of an IPA server with several clients made with VAGRANT 

Ejecutar "vagrant up" para crear un dominio IPA. Por defecto, este dominio se generará con 1 servidor y 1 cliente.

Para crear N clientes se puede hacer uso del parámetro MaxClientes.
Este parámetro puede pasarse en la instrucción "vagrant up" del siguiente modo:
$> MaxClientes=2 vagrant up

NOTA: Cada cliente se crea con 512MB de memoria RAM, por lo que hay que tener en cuenta las especificaciones del sistema para determinar el valor de MaxClientes.


