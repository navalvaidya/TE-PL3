%{

#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>

extern int yylval;
extern int yyerror(char *e);

%}

%%

"if" 		 {return if1;}
"else"		{return else1;}
"printf"	 {return print;}
"true"	 {return true1;}
"false"	 {return false1;}
[a-zA-Z]+	 {return var;}
[0-9]+		 {return num;}
[+-] 		 {return op_p_m;}
[*] 		 {return op_mul;}
[/%]		 {return op_dev_mod;}
"++" 		 {return inc;}
"--" 	       	 {return dec;}	
"=="		{return equ_equ;}
[<] 		 {return less;}
[>] 		 {return gt;}
[=] 		 {return equ;}
[(] 		 {return rb1;}
[)] 		 {return rb2;}
[;] 		 {return semico;}
[{] 	  	 {return cb1;}
[}]		 {return cb2;}
["]		 {return quote;}
. 		;

%%

extern int yywrap(void)

{return 1;}

