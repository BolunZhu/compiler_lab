extern int yylineno;
extern char *yytext;
extern FILE *yyin;
void yyerror(const char * fmt,...);
int yylex();

struct  ast
{
    int nodetype;
    struct ast *l;
    struct ast *r;
};

struct numval
{
    int nodetype;
    union Number
    {
        int i;
        double d;
    } number;
};

// 构建抽象语法树
struct ast *newast(int nodetype,struct ast * l ,struct ast * r);
struct ast * newnum(double d);
struct ast * newnum(int i);
// 计算抽象语法树
double eval(struct ast*);

// 释放抽象语法树
void treefree(struct ast *);