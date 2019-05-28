%option noyywrap nodefault yylineno
%{
    #include "fb1.tab.h"
    #define YYSTYPE YYLVAL
    typedef union{
    int type_int;
    double type_double;
    struct ast * ptr;} YYLVAL;
%}

%%
"+" |
"-" |
"*" |
"/" |
"(" |
")" {return yytext[0];}
[0-9]+ { yylval.type_int = atoi(yytext);return INT;}
([0-9]*\.[0-9]+)|([0-9]+\.) {yylval.type_double = atof(yytext);return DOUBLE;}
"//".*
[ \t] { }
\n {return EOL;}
. { printf("Undifined character %s\n",yytext);}
%%