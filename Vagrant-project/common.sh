#!/bin/bash
# common.sh 

# Definiciones globales para el dominio IPA

DOMINIO='admon.lab'
DOMINIO_KERBEROS='ADMON.LAB'

PASSWD_ADMIN='Virtual2016'

function isinstalled {
  if yum list installed "$@" >/dev/null 2>&1; then
    true
  else
    false
  fi
}




