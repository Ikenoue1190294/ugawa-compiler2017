// antlr4 -package parser -o antlr-generated  -no-listener parser/TinyPiS.g4
grammar TinyPiS;

prog: varDecls stmt
    ;

varDecls: ('var' IDENTIFIER ';')*
    ;

stmt: '{' stmt* '}'			# compoundStmt
    | IDENTIFIER '=' expr ';'		# assignStmt
    | 'if' '(' expr ')' stmt 'else' stmt  # ifStmt
    | 'while' '(' expr ')' stmt	    	# whileStmt
    ;

expr: addExpr
      ;

addExpr: addExpr ADDOP mulExpr
	| mulExpr
	;

mulExpr: mulExpr MULOP unaryExpr
	| unaryExpr
	;

unaryExpr: VALUE			# literalExpr
	| IDENTIFIER			# varExpr
	| '(' expr ')'			# parenExpr
	;

ADDOP: '+'|'-';
MULOP: '*'|'/';
IDENTIFIER: [a-zA-Z_][a-zA-Z_0-9]*;
VALUE: [0-9]+;
WS: [ \t\r\n] -> skip;
