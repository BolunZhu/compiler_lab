fb1: fb1.l fb1.y fb1.h
	bison -d fb1.y
	flex fb1.l
	g++ -o $@ fb1.tab.c lex.yy.c fb1_funcs.cpp -ll
	./$@ test.c