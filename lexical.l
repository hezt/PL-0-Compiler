%option yylineno
%{
	#include <stdio.h>
	#include <string.h>
	#include "syntax.tab.h"
	int chars = 0;
	int words = 0;
	int lines = 0;
	int column = 1;
	/*
	#define YY_USER_ACTION
		yylloc.first_line = yylloc.last_line = yylineno; \
		yylloc.first_column = column; \
		yylloc.last_column = column + yyleng - 1;
	*/
%}
digit [0-9]
letter [a-zA-Z]

%%
"const" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return const_k;}
"var" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return var_k;}
"procedure" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return procedure_k;}
"begin" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return begin_k;}
"end" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return end_k;}
"odd" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return odd_k;}
"if" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return if_k;}
"then" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return then_k;}
"call" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return call_k;}
"while" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return while_k;}
"do" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return do_k;}
"read" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return read_k;}
"write" { printf("line: %d column: %d keyword: %s\n", yylineno, column, yytext); column += yyleng;  words++; return write_k;}
"+" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return plus_s;}
"-" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return minus_s;}
"*" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return multiple_s;}
"/" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return divide_s;}
"<" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return less_s;}
"<=" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return less_eq_s;}
">" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return gtr_s;}
">=" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return gtr_eq_s;}
"#" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return neq_s;}
"=" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return eq_s;}
":=" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return assign_s;}
"(" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return l_bracket_s;}
")" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return r_bracket_s;}
"," { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return comma_s;}
";" { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return semicolon_s;}
"." { printf("line: %d column: %d symbol: %s\n", yylineno, column, yytext); column += yyleng;  chars++; return point_s;}
{digit}+ { printf("line: %d column: %d integer value: %d\n", yylineno, column, atoi(yytext)); column += yyleng; yylval.type_int = atoi(yytext); return integer;}
{letter}[a-zA-Z0-9_]* { printf("line: %d column: %d word: %s\n", yylineno, column, yytext); column += yyleng; char *id_mem = (char *)malloc(yyleng + 1); strcpy(id_mem, yytext); yylval.type_char = id_mem; words++; return identifier;}

\n { chars++; lines++; column = 1; }
. { chars++; column += yyleng; }
%%

int yywrap()
{
	return 1;
}

