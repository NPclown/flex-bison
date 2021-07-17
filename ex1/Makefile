CC = gcc

wordcount : lex.yy.c
	gcc -o wordcount lex.yy.c -lfl

lex.yy.c : fb1-1.l
	flex fb1-1.l

clean :
	rm lex.yy.c wordcount