%{

#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>

extern int yylval;
extern int yyerror(char *e);

%}

%%

"for" 		 {return for1;}
"printf"	 {return print;}
[a-zA-Z]+	 {return var;}
[0-9]+		 {return num;}
[+-] 		 {return op_p_m;}
[*] 		 {return op_mul;}
[/%]		 {return op_dev_mod;}
"++" 		 {return inc;}
"--" 	       	 {return dec;}
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

