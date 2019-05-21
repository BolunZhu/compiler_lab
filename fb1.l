%option noyywrap nodefault yylineno
%{
    #include "fb1.tab.h"
%}

%%
"+" {printf("ADD;}
"-" {printf("SUB\n");}
"*" {printf("TIMES\n");}
"/" {printf("DIVIDE\n");}

[0-9]+ {printf("NUMBER %s\n",yytext);}
\n { printf("NEWLINE\n");}
[ \t] { }
. { printf("Undifined character %s\n",yytext);}
%%

// int main(int argc , char ** argv){
//     int tok;
//     while((tok = yylex())){
//         printf("%d",tok);
//         if(tok == NUMBER) printf(" = %d\n",yylval);
//         else printf("\n");
//     }
// }