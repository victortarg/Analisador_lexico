@echo off
call cleanup.bat
cls

REM Caminhos dos JARs
set flex=lib\jflex-full-1.9.1.jar
set cup=lib\java-cup-11b.jar
set libs=.;lib\java-cup-11b.jar;lib\java-cup-11b-runtime.jar

REM Gerar analisador léxico (scanner.java)
java -jar "%flex%" ling.flex

REM Gerar analisador sintático (parser.java) e símbolos (sym.java)
java -jar "%cup%" -parser parser -symbols sym -expect 1 ling.cup

REM Compilar todos os arquivos Java gerados
javac -cp "%libs%" *.java

REM Executar o analisador
java -cp "%libs%" Main
