import java_cup.runtime.Symbol;
%%

%class Lexer
%unicode
%cup

WHITESPACE = [ \t\n\r]+
DIGIT = [0-9]+
LETTER = [a-zA-Z_]
IDENTIFIER = {LETTER}({LETTER}|{DIGIT})*

%%

<YYINITIAL> {
    {WHITESPACE}  { /* Ignorar espaços em branco */ }

    /* Palavras-chave */
    "se"                { return new Symbol(sym.SE); }
    "senao"             { return new Symbol(sym.SENAO); }
    "enquanto"          { return new Symbol(sym.ENQUANTO); }
    "retorne"           { return new Symbol(sym.RETORNE); }

    /* Identificadores */
    {IDENTIFIER}        { return new Symbol(sym.IDENTIFIER, yytext()); }

    /* Constantes numéricas */
    {DIGIT}+            { return new Symbol(sym.INT_CONST, Integer.parseInt(yytext())); }
    {DIGIT}+"."{DIGIT}+ { return new Symbol(sym.FLOAT_CONST, Float.parseFloat(yytext())); }

    /* 
        Operadores
        Tem que adicionar maior e menor
    */

    "+"           { return new Symbol(sym.PLUS); }
    "-"           { return new Symbol(sym.MINUS); }
    "*"           { return new Symbol(sym.TIMES); }
    "/"           { return new Symbol(sym.DIV); }
    "=="          { return new Symbol(sym.EQ); }
    "="           { return new Symbol(sym.ATT); }
    "!="          { return new Symbol(sym.NEQ); }

    /* Delimitadores */
    ";"           { return new Symbol(sym.SEMICOLON); }
    ","           { return new Symbol(sym.COMMA); }
    "("           { return new Symbol(sym.LPAREN); }
    ")"           { return new Symbol(sym.RPAREN); }
    "{"           { return new Symbol(sym.LBRACE); }
    "}"           { return new Symbol(sym.RBRACE); }

    /* Comentários */
    "//".*        { /* Ignorar comentários de linha única */ }
    "/*" .* "*/"  { /* Ignorar comentários de múltiplas linhas */ }

    /* Caracteres não reconhecidos */
    .             { System.err.println("Caractere inválido: " + yytext()); }
}
