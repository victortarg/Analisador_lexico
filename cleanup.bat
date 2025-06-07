@echo off
if exist parser.java del parser.java
if exist scanner.java del scanner.java
if exist scanner.java~ del scanner.java~
if exist lexer.java del lexer.java
if exist sym.java del sym.java
for /r %%f in (*.class) do del "%%f"