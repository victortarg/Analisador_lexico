# Compilador em Java com JFlex e CUP

Este projeto é um compilador simples desenvolvido em Java, utilizando:

- **JFlex** para análise léxica
- **CUP** para análise sintática

O compilador suporta:

- Atribuições de variáveis, Estruturas condicionais (`se`), Escrita de valores (`escrever`), Estrutura de repetição (`enquanto`), Retorno de valores (`retornar`) e Declaração e execução de funções (`definir`)

---

## Estrutura do Projeto

```
/lib
 ├── jflex.jar                 # Biblioteca do analisador léxico
 ├── java-cup-11b.jar          # Gerador do parser
 └── java-cup-11b-runtime.jar  # Runtime necessário do CUP

scanner.flex       # Definições léxicas (JFlex)
parser.cup         # Definições sintáticas (CUP)
Main.java          # Classe principal
input.txt          # Arquivo de entrada
run.bat            # Script de compilação e execução
cleanup.bat        # Script para limpar arquivos gerados
```

---

## Como Usar

1. **Abra o terminal (Prompt de Comando) na pasta do projeto.**

2. **Execute o script para compilar e rodar:**
   run.bat
   ```

   Isso irá:
   - Gerar `scanner.java` com JFlex
   - Gerar `parser.java` e `sym.java` com CUP
   - Compilar os arquivos `.java`
   - Executar o analisador com o conteúdo de `input.txt`

3. **Para limpar os arquivos gerados:**
   cleanup.bat

---

## Exemplo de Código (`input.txt`)

```
a = 10;
b = 15;

se (x == y) {
    retornar x;
} senao {
   x = x + 1;
   retornar x;
}

definir soma (){
   retornar a + b;
}

soma();

enquanto (a > b){
   escrever(b);
}```


## Requisitos
- **Java JDK** instalado e configurado no PATH.
- Nenhuma outra instalação adicional é necessária.
- Os arquivos `.jar` do JFlex e CUP já estão incluídos na pasta `lib/`.

---

## Observações

- A saída da execução será exibida no terminal.
