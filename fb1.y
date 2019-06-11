%{
    #include "fb1.h"
%}

%union {
    int i;
    double d;
    char c;
    char id[32];
}
// declare token
%token <d> DOUBLE
%token <i> INT
%token <c> CHAR
%token <id> ID
%token <id> TYPE
%token GEQ LEQ EQ NEQ
%token EOL
%type <d>  exp NUMBER//nonterminal
%start calclist
%left LEQ GEQ EQ NEQ '>' '<'
%left '+' '-'
%left '*' '/'
%nonassoc  UMINUS
%%
calclist:
|calclist exp EOL {printf(" = %f\n",$2);}
|TYPE ID {}
exp:
exp '+' exp {$$ = $1+$3;}
|exp '-' exp {$$ = $1-$3;}
|exp '*' exp {$$ = $1 * $3;}
|exp '/' exp  {$$ = $1/$3;}
|exp GEQ exp{$$=$1>=$3;}
|exp LEQ exp{$$=$1<=$3;}
|exp '>' exp {$$ = $1>$3;}
|exp '<' exp {$$ = $1<$3;}
|exp EQ exp {$$=$1==$3;}
|exp NEQ exp {$$=$1!=$3;}
|'-' exp %prec UMINUS {$$=-$2;}
|NUMBER {$$ = $1;}
;
NUMBER: INT {$$ = $1;}
|DOUBLE {$$ = $1;}
|CHAR {$$ = $1;}
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
