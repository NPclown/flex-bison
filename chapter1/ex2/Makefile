CC = gcc

convert : lex.yy.c
	gcc -o convert lex.yy.c -lfl

lex.yy.c : fb1-2.l
	flex fb1-2.l

clean :
	rm lex.yy.c convert