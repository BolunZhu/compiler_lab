#include <stdio.h>
#include <stdlib.h>
extern char *yytext;
extern FILE *yyin;
void yyerror(const char * fmt,...);
int yylex();
// struct ast
// {
//     int nodetype;

// };
