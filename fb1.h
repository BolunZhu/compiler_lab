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

// ���������﷨��
struct ast *newast(int nodetype,struct ast * l ,struct ast * r);
struct ast * newnum(double d);
struct ast * newnum(int i);
// ��������﷨��
double eval(struct ast*);

// �ͷų����﷨��
void treefree(struct ast *);