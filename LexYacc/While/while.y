%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
extern int yyparse();
extern int yyerror(char* e);
extern FILE * yyin;
%}


%token while1 
%token var
%token num
%token rb1
%token rb2
%token cb1
%token cb2
%token equ
%token equ_equ
%token lt
%token gt
%token ne
%token true1
%token false1
%token print
%token semico
%token inc
%token dec
%token op_p_m
%token op_mul
%token op_mod_div
%token quote

%%

S : while1 rb1 CONDITION rb2 cb1 STATEMENT cb2 | while1 rb1 CONDITION rb2 cb1 S cb2 {printf("valid syntax!!\n\n");exit(0);}

CONDITION : var equ num |var ne equ num| var equ var|var ne equ var|var lt num |var gt num|var lt var|var gt var|var lt equ num|var lt equ var|var gt equ num|var gt equ var| true1 | ne false1;

STATEMENT: STATEMENT var equ var OPERATION num semico | var equ var OPERATION num semico|var OPERATION equ num semico| STATEMENT PRINTF|PRINTF |var equ num semico;

OPERATION: op_p_m | op_mul |op_mod_div;

PRINTF: print rb1 quote PRINT_DATA quote rb2 semico; 

PRINT_DATA: num | var | var num | num var;

%%

int main(){
	yyin = fopen("while_input.txt","r");
	printf("\n\n");

	system("cat while_input.txt" );

	if(yyin==NULL){
		printf("No data in file");
	}
	else{
		yyparse();
	}
	
}

extern int yyerror(char* e){
	printf("Syntax error:::\n");
}





