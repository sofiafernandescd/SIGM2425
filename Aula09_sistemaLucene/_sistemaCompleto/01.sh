#!/bin/bash

# lucenePath="C:\Users\ptrigo\Documents\CSI_SIGM_2017_18\Aula08_sistemaLucene\_sistemaCompleto"
lucenePath="/Users/sofiafernandes/Documents/Repos/SIGM2425/Aula09_sistemaLucene/_sistemaCompleto"
export lucenePath 

dataPath="$lucenePath/z_coleccao_demo"
export dataPath

core="$lucenePath/lucene-core-7.1.0.jar"
export core
demo="$lucenePath/lucene-demo-7.1.0.jar"
export demo
#queryparser="$lucenePath/lucene-queryparser-7.1.0.jar"
#export queryparser
#analyzers="$lucenePath/lucene-analyzers-common-7.1.0.jar"
#export analyzers

#java -classpath "$core:$demo:$analyzers:$queryparser" org.apache.lucene.demo.IndexFiles -docs "$dataPath/z01_coleccao_paraIndexar" -index "$dataPath/z02_coleccao_indexada"
# -update

java -classpath "$core:$demo:$analyzers:$queryparser" org.apache.lucene.demo.IndexFiles -docs "$dataPath/z01_coleccao_paraIndexar" -index "$dataPath/z02_coleccao_indexada" -update 