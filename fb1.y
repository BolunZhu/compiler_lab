%{
#include <stdio.h>
#include <stdlib.h>
#include "fb1.h"
// extern char *yytext;
// extern FILE *yyin;
// void yyerror(const char * fmt,...);
// int yylex();
%}

%union {
    struct ast *a;
    double d;
    int i;
}
// ”≈œ»º∂
%left '+' '-'
%left '*' '/'
%right UMINUS
// declare token

%token <d> DOUBLE
%token <i> INT
%token EOL
%type <a> exp
%type <a> NUMBER
%%
exp: exp '+' exp {$$ = newast('+',$1,$3);}
    |exp '-' exp {$$ = newast('-',$1,$3);}
    |exp '*' exp {$$ = newast('*',$1,$3);}
    |exp '/' exp {$$ = newast('/',$1,$3);}
    |'-' exp %prec UMINUS {$$ = newast('M',$2,NULL);}
    |NUMBER {$$ = $1;}
    |exp EOL {//printf(" = %d\n",$1);}
    }
;
NUMBER: INT {$$ = newnum($1);}
    |DOUBLE {$$ = newnum($1);}
;
%%
int main(int argc, char *argv[]){
	yyin=fopen(argv[1],"r");
	if (!yyin) return 0;
	yyparse();
	return 0;
}
	
void yyerror(const char *s,...){
   printf("%s   %s \n",s,yytext);
   
 }
