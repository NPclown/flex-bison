%{
    #include "fb1-5.tab.h"
%}

%%
"(" { printf("OP Token Detect\n"); return OP;}
")" { printf("CP Token Detect\n"); return CP;}
"//".* { /* ignore whitespace */ }
"+" { printf("ADD Token Detect\n"); return ADD; }
"-" { printf("SUB Token Detect\n"); return SUB; }
"*" { printf("MUL Token Detect\n"); return MUL; }
"/" { printf("DIV Token Detect\n"); return DIV; }
"|" { printf("ABS Token Detect\n"); return ABS; }
[0-9]+ { yylval = atoi(yytext); printf("NUM Token Detect\n"); return NUMBER; }
\n { return EOL; }
[ \t] { /* ignore whitespace */ }
. { printf("Mystery character %c\n", *yytext); }

%%
