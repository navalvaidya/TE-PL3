%{

#include<stdlib.h>
#include<stdio.h>
#include<math.h>
#include "y.tab.h"

extern int yylex();
extern int yyparse();
extern int yyerror(char *e);
extern FILE *yyin;

%}

%token var
%token num
%token inc
%token dec
%token op_p_m
%token op_mul
%token op_div_mod
%token shift_l
%token shift_r
%token semico 
%token equ
%token equ_equ

%%

S:var equ EQU semico 			{printf("\n\nvalid syntax !!");exit(0);}

EQU:var OP var|var OP num | var INC_DEC |INC_DEC var;

OP:op_p_m | op_mul | op_div_mod;

INC_DEC:inc | dec;





%%

int main()
{
yyin=fopen("equ.txt","r");

printf("\n\n");
system("cat equ.txt");

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
