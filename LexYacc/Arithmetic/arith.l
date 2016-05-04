%{
#include "y.tab.h"

#include <stdio.h>
#include <stdlib.h>

extern int yylval;
extern int yyerror(char* e);

%}

%%
[a-zA-z]+	{return var;}
[0-9]+		{return num;}
"++"		{return inc;}
"--"		{return dec;}
[+-]		{return op_p_m;}
[*]		{return op_mul;}
[/%]		{return op_div_mod;}
[=]		{return equ;}
[;]		{return semico;}
.		;
%%

extern int yywrap(void){
return 1;
}
