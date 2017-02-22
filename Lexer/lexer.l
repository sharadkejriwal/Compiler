%{
	#include <stdio.h>
	#include "lexer.h"
%}

letter			[a-zA-Z]
digit			[0-9]

%%

return 			return RET;
exit			return EXIT;

char 			return CH;
int 			return INT;
float			return FL;

for				return FOR;
while			return WHILE;
goto  			return GOTO;
break			return BREAK;
continue		return CONTINUE;

if 				return IF;
else			return ELSE;

print 			return PRINT;

{letter}({letter}|{digit})*							return ID;

({digit}+("."{digit}+)?([eE][-+]?{digit}+)?)		return NUM;


"="				return ASSIGNMENT;

"{"				return LCB;
"}"				return RCB;
"["				return LB;
"]"				return RB;
"("				return LSB;
")"				return RSB;
";"				return STEND;

"++"			return INCR;
"--"			return DECR;

"+="			return ADDASSGN;
"-="			return SUBASSGN;
"*="			return MULASSGN;
"/="			return DIVASSGN;
"%="			return MODASSGN;


"+"				return ADDOP;
"-"				return SUBOP;
"/"				return DIVOP;
"*"				return MULOP;
"%"				return MODOP;



"&"				return ANDBINOP;
"|"				return ORBINOP;



"<"				return LRELOP;
">"				return GRELOP;
"<="				return LERELOP;
">="				return GERELOP;
"!="				return NERELOP;
"=="				return ASSRELOP;

","				return COMMA;

[ \t\n]			;



.				{printf("Lexical Error\n");}

%%

int yywrap(void)
{
	yywrap();
	return 0;
}
		





