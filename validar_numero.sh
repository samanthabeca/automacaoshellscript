#!/bin/bash

numero=$1

if [ $numero -gt 10 ]; then
    echo "Nome do script: $0"
    echo "PID de execução: $$"
else
    echo "O número não é maior que 10."
fi
