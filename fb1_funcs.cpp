#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "fb1.h"

struct ast *
newast(int nodetype,struct ast * l, struct ast * r)
{
    struct ast* a = malloc(sizeof(struct ast));
    if(!a){
        yyerror("newast:out of space");
        exit(0);
    }    
    a->nodetype = nodetype;
    a->l = l;
    a->r = r;
    return a;
}

struct ast *
newnum(double d)
{
    struct numval * a = malloc(sizeof(struct numval));
    if(!a){
        yyerror("newnum:out of space");
        exit(0);
    }    
    a->nodetype = 'd';
    a->number.d=d;
    return (struct ast*) a;
}
struct ast *
newnum(int i)
{
    struct numval * a = malloc(sizeof(struct numval));
    if(!a){
        yyerror("newnum:out of space");
        exit(0);
    }    
    a->nodetype = 'i';
    a->number.i=i;
    return (struct ast*) a;
}

double eval(struct ast * a)
{
    double v;//result of the tree
    switch(a->nodetype){
        //number
        case 'd' : v=((struct numval *)a)->number.d;break;
        case 'i' : v=((struct numval *)a)->number.i;break;
        //op
        case '+': v= eval(a->l) + eval(a->r);break;
        case '-': v= eval(a->l) - eval(a->r);break;
        case '*': v= eval(a->l) * eval(a->r);break;
        case '/': v= eval(a->l) / eval(a->r);break;
        case 'M': v= -eval(a->l); break;
        default: printf("eval error: bad node %c \n",a->nodetype);
    }
    return v;
}

void treefree(struct ast *a)
{
    switch(a->nodetype){
        // 两颗子树
        case '+':
        case '-':
        case '*':
        case '/':
            treefree(a->r);
        // 一颗
        case 'M':
            treefree(a->l);
        // 没有
        case 'd':
        case 'i':
        free(a);
        break;
        default: printf("treefree error: free bad node %c\n",a->nodetype);

    }
}
void
yyerror(char *s,...)
{
    va_list ap;
    va_start(ap,s);
    fprintf(stderr,"%d: error: ",yylineno);
    vfprintf(stderr,s,ap);
    fprintf(stderr,"\n");
}

int
main()
{
    printf("> ");
    return yyparse();
}