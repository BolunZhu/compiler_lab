%{
#include <stdio.h>
#include <stdlib.h>
extern char *yytext;
extern FILE *yyin;
void yyerror(const char * fmt,...);
int yylex();
%}

// declare token
%token NUMBER
%token ADD SUB MUL DIV
%token EOL

%%
exp:
    |exp result EOL {printf(" = %d\n",$2);}
;
result: factor {$$ =$1;}
|result ADD factor {$$ = $1+$3;}
|result SUB factor {$$ = $1-$3;}
;
factor: num  {$$ = $1}
|factor MUL num {$$ = $1 * $3;}
|factor DIV num {$$ = $1/$3;}
;
num: NUMBER  {$$ = $1;}
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
