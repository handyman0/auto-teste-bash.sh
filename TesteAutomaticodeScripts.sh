#!/bin/bash

# Exemplo de loop "while" em Bash
echo "qual arquivo em bash testar em loop:"
echo "por exemplo ./nomedoseuaquivo"
read ARQUIVO
contador=1

while [ $contador -le 5 ]
do
  clear
  echo "Realizando o teste do $ARQUIVO:"
  echo "-------------------------------"
  echo ""
  $ARQUIVO
  sleep 2
  clear
done

