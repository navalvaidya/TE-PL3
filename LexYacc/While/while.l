%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>


extern int yylval;
extern int yyerror (char *e);

%}

%%

"while"		{return while1;}
"printf"	{return print;}
"true"		{return true1;}
"false"		{return false1;}
[+-]		{return op_p_m;}
[*]		{return op_mul;}
[/%]		{return op_mod_div;}		
[(]		{return rb1;}
[)]		{return rb2;}
[{]		{return cb1;}
[}]		{return cb2;}
[0-9]+		{return num;}
[a-zA-Z]+	{return var;}
[=]		{return equ;}
"=="		{return equ_equ;}
"++"		{return inc;}
"--"		{return dec;}
[;]		{return semico;}
[<]		{return lt;}
[>]		{return gt;}
[!]		{return ne;}
["]		{return quote;}
.		;
%%

extern int yywrap(void){
return 1;
}
