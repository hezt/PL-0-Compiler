/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     integer = 258,
     identifier = 259,
     const_k = 260,
     var_k = 261,
     procedure_k = 262,
     begin_k = 263,
     end_k = 264,
     odd_k = 265,
     if_k = 266,
     then_k = 267,
     call_k = 268,
     while_k = 269,
     do_k = 270,
     read_k = 271,
     write_k = 272,
     point_s = 273,
     comma_s = 274,
     semicolon_s = 275,
     assign_s = 276,
     plus_s = 277,
     minus_s = 278,
     multiple_s = 279,
     divide_s = 280,
     eq_s = 281,
     neq_s = 282,
     gtr_s = 283,
     gtr_eq_s = 284,
     less_s = 285,
     less_eq_s = 286,
     l_bracket_s = 287,
     r_bracket_s = 288
   };
#endif
/* Tokens.  */
#define integer 258
#define identifier 259
#define const_k 260
#define var_k 261
#define procedure_k 262
#define begin_k 263
#define end_k 264
#define odd_k 265
#define if_k 266
#define then_k 267
#define call_k 268
#define while_k 269
#define do_k 270
#define read_k 271
#define write_k 272
#define point_s 273
#define comma_s 274
#define semicolon_s 275
#define assign_s 276
#define plus_s 277
#define minus_s 278
#define multiple_s 279
#define divide_s 280
#define eq_s 281
#define neq_s 282
#define gtr_s 283
#define gtr_eq_s 284
#define less_s 285
#define less_eq_s 286
#define l_bracket_s 287
#define r_bracket_s 288




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 5 "syntax.y"
{
	int type_int;
	char * type_char;
}
/* Line 1529 of yacc.c.  */
#line 120 "syntax.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

