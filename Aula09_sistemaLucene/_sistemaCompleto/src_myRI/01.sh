#!/bin/bash

# Definir Caminho para "javac" e "jar"
#javaBinPath="/usr/lib/jvm/java-11-openjdk-amd64/bin" 
javaBinPath="/usr/local/Cellar/openjdk@11/11.0.23/libexec/openjdk.jdk/Contents/Home/bin"
export javaBinPath

# Definir Caminho para "lucene"
#lucenePath="/path/to/your/lucene/directory" 
lucenePath="/Users/sofiafernandes/Documents/Repos/SIGM2425/Aula09_sistemaLucene/_sistemaCompleto"
export lucenePath 

core="$lucenePath/lucene-core-7.1.0.jar"
demo="$lucenePath/lucene-demo-7.1.0.jar"
analyzers="$lucenePath/lucene-analyzers-common-7.1.0.jar"
queryparser="$lucenePath/lucene-queryparser-7.1.0.jar"

# Definir Caminho para "o MEU c�digo fonte"
mySourcePath="$lucenePath/src_myRI/src"

# Registar directorio corrente
CURR_DIR=$(pwd)

# Compilar
cd "$mySourcePath"
"$javaBinPath/javac" -classpath "$core:$demo:$analyzers:$queryparser" *.java -Xlint:deprecation
cd "$CURR_DIR"

# Copiar .class para directoria .\bin
mkdir -p "./bin"
mv "$mySourcePath"/*.class "./bin"