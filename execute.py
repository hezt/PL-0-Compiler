import os
print('>>>>>>>>>Start Flex<<<<<<<<<')
os.system("flex lexical.l")
# os.system("gcc lex.yy.c -o word_check.out")
# os.system("./word_check.out example.txt")
print('>>>>>>>>>>>>Start Bison<<<<<<<<<<<<<')
os.system("bison -d -v syntax.y")
print('>>>>>>>>>>>>GCC Compile<<<<<<<<<<<<<')
os.system("gcc main.c syntax.tab.c -ly -o parser.o")
print('>>>>>>>>>>>>Lexical & Syntax check<<<<<<<<<<<<<')
os.system("./parser.o example.txt")