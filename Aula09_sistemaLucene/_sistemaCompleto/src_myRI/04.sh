#!/bin/bash

# Definir Caminho para "lucene"
lucenePath="/Users/sofiafernandes/Documents/Repos/SIGM2425/Aula09_sistemaLucene/_sistemaCompleto"
export lucenePath 

core="$lucenePath/lucene-core-7.1.0.jar"
demo="$lucenePath/lucene-demo-7.1.0.jar"
analyzers="$lucenePath/lucene-analyzers-common-7.1.0.jar"
queryparser="$lucenePath/lucene-queryparser-7.1.0.jar"

java -classpath "$core:$demo:$analyzers:$queryparser:./bin" MeuInterrogador