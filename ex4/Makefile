CC = gcc

calc : lex.yy.c
	gcc -o calc lex.yy.c -lfl

lex.yy.c : fb1-4.l
	flex fb1-4.l

clean :
	rm lex.yy.c calc