%{
	#include <stdio.h>
	#include <string>

%}

%start program

%token BEGIN END
%token IF ELSE 
%token BREAK CONTINUE
%token PRINT
%token FOR DO WHILE
%token ID NUM
%token INT FLOAT 
%token LEOP GEOP DEOP NEOP

%union
{
	int intval;
	double val;
	string id;
}

%%

program 		: 	BEGIN stmt_list END

stmt_list       :   stmt_list stmt
				|   stmt
				;

stmt 		    :	declaration
				|   assignment
				|	cond_stmt
				|	loop
				|	jmp_stmt
				|	print 
				|	';'
				;
				
declaration 	:   data_type id variables
				|   data_type id '=' exp variables 
				;
				
variables 		:   comma id variables
				|	comma id '=' exp variables
				|	';'
				;

assignment		:   id equal_sign exp semi
				;

cond_stmt		:   IF left_paren condition right_paren left_br stmt_list right_br else_stmt
				;

else_stmt 		:   ELSE left_br stmt_list right_br
				|   
				;
				
loop			:   for_loop
				|   while_loop
				|   do_while_loop
				;
				
jmp_stmt		:   BREAK  semi
				|	CONTINUE   semi
				;

print 			:   PRINT exp semi
				;
				
for_loop		:   FOR left_paren loop_assignment semi condition semi loop_assignment right_paren left_br stmt_list right_br
				;
		
while_loop		:	WHILE left_paren condition	right_paren left_br stmt_list right_br
				;
			
do_while_loop	: 	DO  left_br stmt_list right_br WHILE left_paren condition right_paren semi
				;
				
loop_assignment :	assignment
				|
				;
				 
condition 		:	exp relop exp
				;
				

exp				:  exp '+' exp2
				|  exp '-' exp2
				|  exp2
				;
			
exp2 			:  exp2 '*' exp3
				|  exp2 '/' exp3
				|  exp2 '%' exp3
				|  exp3
				;
			
exp3      		:  left_paren exp right_paren 
				|  term
				;


				
term 			:  ID
				|  NUM
				;
				
				
id				:  ID
				;
			
data_type		:  INT
				|  FLOAT
				;

		
semi 			:  ';'
				|	error							{printf("Missing ';' at line no. %d\n",lineno);}
				;
	

equal_sign 		:	'='
				| 	error							{printf("Missing '=' at line no. %d\n",lineno);}
				;
				
comma 			:   ','
				|	error							{printf("Missing ',' at line no. %d\n",lineno);}
				;
				
left_paren 		: 	'('
				|	error							{printf("Missing '(' at line no. %d\n",lineno);}
				;
				
right_paren		:	')'
				|	error							{printf("Missing ')' at line no. %d\n",lineno);}
				;
				
left_br 		:  	'{'
				| 	error							{printf("Missing '{' at line no. %d\n",lineno);}
				;
				
right_br 		:  	'}'								
				|	error							{printf("Missing '}' at line no. %d\n",lineno);}
				;
				
relop			:   '<'		
				| 	'>'
				|	LEOP
				|	GEOP
				|	DEOP
				| 	NEOP
				|	error							{printf("Missing operator at line no %d\n",lineno);}
				;
				


