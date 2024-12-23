#!/bin/bash

# Definir Caminho para "lucene"
lucenePath="/Users/sofiafernandes/Documents/Repos/SIGM2425/Aula09_sistemaLucene/_sistemaCompleto"
export lucenePath 

core="$lucenePath/lucene-core-7.1.0.jar"
demo="$lucenePath/lucene-demo-7.1.0.jar"
analyzers="$lucenePath/lucene-analyzers-common-7.1.0.jar"
queryparser="$lucenePath/lucene-queryparser-7.1.0.jar"

# Verificar e remover o diretório "_osMeusIndices" se existir
if [ -d "_osMeusIndices" ]; then
  echo "Removendo diretório '_osMeusIndices'..."
  rm -rf "_osMeusIndices"
fi

# Executar a aplicação
java -classpath "$core:$demo:$analyzers:$queryparser:./bin" MeuIndexadorVectorial

# ATENÇÃO: Após executar o script será criado um diretório "_osMeusIndices" (no diretório onde iniciou o script) que contém os índices criados.