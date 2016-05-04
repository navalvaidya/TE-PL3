%{

#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
extern int yyparse();
extern int yyerror(char *e);
extern FILE *yyin;

%}

%token while1
%token var
%token num
%token cb1
%token cb2
%token rb1
%token rb2
%token inc
%token dec 
%token less
%token gt
%token equ
%token semico
%token op_p_m
%token op_mul
%token op_dev_mod
%token print
%token quote
%token true1
%token false1
%token equ_equ
%token ne
%%

S : while1 rb1 CONDITION rb2 cb1 STATEMENT | while1 rb1 CONDITION rb2 cb1 S cb2 {printf("\n valid syntax !!\n\n");exit(0);}

CONDITION:var less num |var less var| var gt num |var gt var| var less equ num|var less equ var | var gt equ num|var gt equ var|true1|false1|var equ_equ var|var equ_equ num|var ne equ num;

INC_DEC: inc var | var inc | dec var | var dec;

STATEMENT:STATEMENT var equ var OPERATION num semico |var equ var OPERATION num semico|var OPERATION equ num semico |STATEMENT PRINTF | PRINTF |var equ num semico ;

OPERATION:op_p_m | op_mul | op_dev_mod;

PRINTF:print rb1 quote PRINT_DATA quote rb2 semico;

PRINT_DATA:var |num |var num | num var;


%%

int main()
{
yyin=fopen("for_input.txt","r");

printf("\n\n");
system("cat for_input.txt");

if(yyin==NULL)
{
	printf("\n no data in file");
}
else
{
	yyparse();
}
}

extern int yyerror(char *e)
{
printf("syntax error:::\n");
}

