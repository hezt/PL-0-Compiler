%{
	#include <stdio.h>
	#include "lex.yy.c"
%}
%union {
	int type_int;
	char * type_char;
}
%token <type_int> integer
%token <type_char> identifier
%token const_k var_k procedure_k begin_k end_k odd_k if_k then_k call_k
%token while_k do_k read_k write_k
%token point_s comma_s semicolon_s assign_s
%token plus_s minus_s multiple_s divide_s
%token eq_s neq_s
%token gtr_s gtr_eq_s less_s less_eq_s
%token l_bracket_s r_bracket_s
%start prog
%%
prog : b_prog point_s
	;
b_prog : sentence
	| const_dclr var_dclr proc_dclr sentence
	| const_dclr var_dclr sentence
	| var_dclr proc_dclr sentence
	| const_dclr proc_dclr sentence
	| const_dclr sentence
	| var_dclr sentence
	| proc_dclr sentence
	;
const_dclr : const_k mul_const_def semicolon_s
	;
mul_const_def : const_def
	| const_def comma_s mul_const_def
	;
const_def : identifier eq_s integer
	;

var_dclr : var_k mul_var_dclr semicolon_s
	;
mul_var_dclr : identifier
	| identifier comma_s mul_var_dclr
	;
proc_dclr : proc_header b_prog mul_proc_dclr
	;
mul_proc_dclr : semicolon_s
	| semicolon_s proc_dclr mul_proc_dclr
	;
proc_header : procedure_k identifier semicolon_s
	;
sentence : assign_sen
	| condition_sen
	| while_sen
	| proccall_sen
	| read_sen
	| write_sen
	| mul_sen
	| empty_sen
	;
assign_sen : identifier assign_s expression
	;
mul_sen : begin_k mul_mul_sen end_k
	;
mul_mul_sen : sentence
	| sentence semicolon_s mul_mul_sen
	;
empty_sen :
	;
condition : expression relation_op expression
	| odd_k expression
	;
expression : p_m_op mul_expression
	| mul_expression
	;
mul_expression : item
	| item p_m_op mul_expression
	;
item : mul_item
	;
mul_item : factor
	| factor m_d_op mul_item
	;
factor : identifier
	| integer
	| l_bracket_s expression r_bracket_s
	;
p_m_op : plus_s
	| minus_s
	;

m_d_op : multiple_s
	| divide_s
	;
relation_op : eq_s 
	| neq_s 
	| gtr_s 
	| gtr_eq_s
	| less_s 
	| less_eq_s
	;
condition_sen : if_k condition then_k sentence
	;
proccall_sen : call_k identifier
	;
while_sen : while_k condition do_k sentence
	;
read_sen : read_k l_bracket_s mul_read_sen r_bracket_s
	;
mul_read_sen : identifier
	| identifier comma_s mul_read_sen
	;
write_sen : write_k l_bracket_s mul_write_sen r_bracket_s
	;
mul_write_sen : expression
	| expression comma_s mul_write_sen
	;
%%