%option noyywrap nodefault yylineno
%{
    #include "fb1.tab.h"
    // int yylval;

%}

%%
"+" {printf("ADD\n");return ADD;}
"-" {printf("SUB\n");return SUB;}
"*" {printf("TIMES\n");return MUL;}
"/" {printf("DIVIDE\n");return DIV;}

[0-9]+ {printf("NUMBER %s\n",yytext);yylval = atoi(yytext);return NUMBER;}
\n { printf("NEWLINE\n");return EOL;}
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