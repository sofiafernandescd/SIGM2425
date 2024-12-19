::________________________
:: Paulo Trigo Silva (PTS)
::________________________



:: [PTS: AJUSTAR]
set lucenePath="C:\Users\ptrigo\Documents\CSI_SIGM_2017_18\Aula08_sistemaLucene\_sistemaCompleto"


set dataPath=%lucenePath%\z_coleccao_demo

set core=%lucenePath%\lucene-core-7.1.0.jar
set demo=%lucenePath%\lucene-demo-7.1.0.jar
set queryparser=%lucenePath%\lucene-queryparser-7.1.0.jar
::set analyzers=%lucenePath%\lucene-analyzers-common-7.1.0.jar

java -classpath %core%;%demo%;%analyzers%;%queryparser% org.apache.lucene.demo.SearchFiles -index %dataPath%\z02_coleccao_indexada

