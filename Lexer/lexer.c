#include <stdio.h>
#include "lexer.h"

extern char *yytext;
extern int yyleng;
extern int yylineno;

int main()
{
	int token;
	token = yylex();
	while(token)
	{
		printf("%s is a token with id %d and length %d\n",yytext,token,yyleng);
		token = yylex();
	} 	
	return 0;
}