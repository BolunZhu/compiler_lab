%{
    // enum yytokentype{
    //     NUMBER = 258,
    //     ADD = 259,
    //     SUB = 260,
    //     MUL = 261,
    //     DIV = 262,
    //     EOL = 263
    // };
    // int yylval;
    #include "fb1.tab.h"
%}

%%
"+" {printf("ADD\n");}
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