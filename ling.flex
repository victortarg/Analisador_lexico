import java_cup.runtime.*;

%%
%class scanner
%unicode
%cup

WHITESPACE = [ \t\n\r]+
DIGIT = [0-9]+
ID = [a-zA-Z_][a-zA-Z0-9_]*
COMMENT = "/*" [^*]* "*/" | "//".*

%%

<YYINITIAL> {
    {WHITESPACE}      { /* ignora espaços */ }
    "se"              { return new Symbol(sym.SE); }
    "retornar"        { return new Symbol(sym.RETORNAR); }
    "escrever"        { return new Symbol(sym.ESCREVER); }


    "="               { return new Symbol(sym.ASSIGN); }
    "=="              { return new Symbol(sym.COMP); }
    ";"               { return new Symbol(sym.SEMI); }
    "+"               { return new Symbol(sym.PLUS); }
    "-"               { return new Symbol(sym.MINUS); }
    "*"               { return new Symbol(sym.TIMES); }
    "("               { return new Symbol(sym.LPAREN); }
    ")"               { return new Symbol(sym.RPAREN); }
    "{"               { return new Symbol(sym.LBRACE); }
    "}"               { return new Symbol(sym.RBRACE); }
    {DIGIT}           { return new Symbol(sym.NUMBER, Integer.parseInt(yytext())); }
    {ID}              { return new Symbol(sym.ID, yytext()); }
    {COMMENT}         { /* ignora comentários */ }
    .                 { System.err.println("Caractere ilegal: " + yytext()); }
}
