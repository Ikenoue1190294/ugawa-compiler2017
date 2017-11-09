// antlr4 -package parser -o antlr-generated  -no-listener parser/TinyPiE.g4
grammar TinyPiE;

expr: orExpr
      ;

orExpr: orExpr OROP andExpr
	| andExpr
	;
	
andExpr: andExpr ANDOP addExpr
	| addExpr
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
	| SUBOP unaryExpr		# subExpr
	;

ADDOP: '+';
SUBOP: '-'|'~';
MULOP: '*'|'/';
OROP: '|';
ANDOP: '&';

IDENTIFIER: 'x'|'y'|'z';
VALUE: [0-9]|[1-9][0-9]*;
WS: [ \t\r\n] -> skip;
