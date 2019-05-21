fb1: fb1.l fb1.y
	bison -d fb1.y
	flex fb1.l
	gcc -o $@ fb1.tab.c lex.yy.c -ll
	./$@ test.c