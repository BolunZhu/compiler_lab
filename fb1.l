%option noyywrap nodefault yylineno
%{
    #include "fb1.tab.h"
    // int yylval;

%}
id   [A-Za-z][A-Za-z0-9]*  
int    "-"?[0-9]+
double  "-"?([0-9]*\.[0-9]+)|([0-9]+\.)
char   \'.{1,1}\'
%%
{int}        {printf("INT %s\n",yytext);yylval.i=atoi(yytext); return INT;}
{double}      {printf("DOUBLE %s\n",yytext);yylval.d=atof(yytext); return DOUBLE;}
{char} {printf("CHAR %s\n",yytext);yylval.c=yytext[1]; return CHAR;}
"int"        {strcpy(yylval.id,  yytext);return TYPE;}
"float"      {strcpy(yylval.id,  yytext);return TYPE;}
{id}       {strcpy(yylval.id,  yytext); return ID;}

">" |
"<" |
"+" |
"-" |
"*" |
"/"  {return yytext[0];}
"==" {return EQ;}
"!=" {return NEQ;}
">=" {return GEQ;}
"<=" {return LEQ;}
\n { printf("NEWLINE\n");return EOL;}
"//".*
[ \t] { }
. { printf("Undifined character %s\n",yytext);}
%% 