/* simplest version of calculator */
%{
#include <stdio.h>
%}

/* declare tokens */
%token OP CP
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%
calclist: /* nothing */ {}
 | calclist exp EOL { printf("규칙4 (calclist exp EOL => calclist): = %d\n", $2); }
 ;
exp: factor  {printf ("규칙3 (factor => exp) : %d\n", $1);}
 | exp ADD factor { printf("규칙3 (exp ADD factor => exp) : %d + %d \n", $1, $3); $$ = $1 + $3; }
 | exp SUB factor { printf("규칙3 (exp SUB factor => exp) : %d - %d \n", $1, $3); $$ = $1 - $3; }
 ;
factor: term {printf ("규칙2 (term => factor) : %d\n", $1);}
 | factor MUL term { printf("규칙2 (factor MUL term => factor) : %d * %d \n", $1, $3); $$ = $1 * $3; }
 | factor DIV term { printf("규칙2 (factor DIV term => factor) : %d / %d \n", $1, $3); $$ = $1 / $3; }
 ;
term: NUMBER { printf("규칙1 (NUMBER => term) : %d \n", $1); }
 | ABS term { printf("규칙1 (ABS term => term)  : %d \n", $2); $$ = $2 >= 0? $2 : - $2; }
 | OP exp CP { $$ = $2; }
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