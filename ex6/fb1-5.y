/* simplest version of calculator */
%{
#include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%
calclist: /* nothing */ {printf("noting\n");}
 | calclist exp EOL { printf("= %d\n", $2); }
 ;
exp: factor  {printf ("Factor => Exp : %d\n", $1);}
 | exp ADD factor { printf("ADD : %d + %d \n", $1, $3); $$ = $1 + $3; }
 | exp SUB factor { printf("SUB : %d - %d \n", $1, $3); $$ = $1 - $3; }
 ;
factor: term {printf ("Term => Factor: %d\n", $1);}
 | factor MUL term { printf("MUL : %d * %d \n", $1, $3); $$ = $1 * $3; }
 | factor DIV term { printf("DIV : %d / %d \n", $1, $3); $$ = $1 / $3; }
 ;
term: NUMBER { printf("NUM => Term: %d \n", $1); }
 | ABS term { printf("ABS : %d \n", $2); $$ = $2 >= 0? $2 : - $2; }
 ;
%%
main(int argc, char **argv)
{
 yyparse();
}
yyerror(char *s)
{
 fprintf(stderr, "error: %s\n", s);
}