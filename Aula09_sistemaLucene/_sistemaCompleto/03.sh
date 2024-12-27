#!/bin/bash

# Definir Caminho para "javac" e "jar"
#javaBinPath="/usr/lib/jvm/java-11-openjdk-amd64/bin" 
javaBinPath="/usr/local/Cellar/openjdk@11/11.0.23/libexec/openjdk.jdk/Contents/Home/bin"

# Definir Caminho para "lucene"
#lucenePath="/path/to/your/lucene/directory" 
lucenePath="/Users/sofiafernandes/Documents/Repos/SIGM2425/Aula09_sistemaLucene/_sistemaCompleto"
core="$lucenePath/lucene-core-7.1.0.jar"
demo="$lucenePath/lucene-demo-7.1.0.jar"
queryparser="$lucenePath/lucene-queryparser-7.1.0.jar"
#analyzers="$lucenePath/lucene-analyzers-common-7.1.0.jar"

# Definir Caminho para "o código fonte das demo"
mySourcePath="$lucenePath/src_luceneDemo/org/apache/lucene/demo"

# Registar directorio corrente
CURR_DIR=$(pwd)

# Compilar
cd "$mySourcePath"
"$javaBinPath/javac" -classpath "$core:$demo:$analyzers:$queryparser" *.java -Xlint:deprecation
cd "$CURR_DIR"

# Copiar Biblioteca de Demo Original (opcional)
# cp -p "$demo" "$demo.ORI" 

# Criar Nova Biblioteca
cd "$lucenePath/src_luceneDemo"
"$javaBinPath/jar" cvf "$lucenePath/lucene-demo-7.1.0.jar" org/apache/lucene/demo/*.class
cd "$CURR_DIR"

# Eliminar *.class (opcional)
# rm -rf "$mySourcePath"/*.class