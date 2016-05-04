%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
extern int yyparse();
extern int yyerror(char* e);
extern FILE *yyin;

%}

%token var
%token num
%token op_p_m
%token op_mul
%token op_div_mod
%token equ
%token inc
%token dec
%token semico
%token equ_equ

%%
S:var equ EQU semico     {printf("\n\nValid Syntax!!\n\n");exit(0);}

EQU : var OPERATION var|var OPERATION num|var INC_DEC|INC_DEC var

OPERATION:op_p_m | op_mul | op_div_mod;

INC_DEC:inc | dec;

%%

int main(){
	yyin= fopen("arith_input.txt","r");
	printf("\n\n");
	system("cat arith_input.txt");
	if(yyin==NULL){
		printf("file contains no  data");
	}
	else{
		yyparse();
	}

}

extern int yyerror(char* e){
	printf("Syntax Error:::\n\n");
}
