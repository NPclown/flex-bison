%{
    #include "fb1-5.tab.h"
%}

%%
"+" { printf("ADD Detect\n"); return ADD; }
"-" { printf("SUB Detect\n"); return SUB; }
"*" { printf("MUL Detect\n"); return MUL; }
"/" { printf("DIV Detect\n"); return DIV; }
"|" { printf("ABS Detect\n"); return ABS; }
[0-9]+ { yylval = atoi(yytext); printf("NUM Detect\n"); return NUMBER; }
\n { return EOL; }
[ \t] { /* ignore whitespace */ }
. { printf("Mystery character %c\n", *yytext); }

%%
