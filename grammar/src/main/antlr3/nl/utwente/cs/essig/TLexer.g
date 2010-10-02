lexer grammar TLexer;

options {

   language=Java;  // Default

   // Tell ANTLR to make the generated lexer class extend the
   // the named class, which is where any supporting code and 
   // variables will be placed.
   //
   superClass = AbstractTLexer;
}

// What package should the generated source exist in?
//
@header {

    package nl.utwente.cs.essig;
}

// Lexer
//
REGISTERS	:	'registers';
PARAMETERS	:	'parameters';

// Parameters
RAM		:	'ram';
GPRS		:	'gprs';

IDENTIFIER		:	LETTER (LETTER | DIGIT)*;

NUMBER			:	DIGIT+;

WHITESPACE		:	( '\t' | ' ' | '\r' | '\n'| '\u000C' )+ 	{ $channel = HIDDEN; } ;

COMMENT
			:	'//' ~('\n'|'\r')* '\r'? '\n' {skip();}
			|	'/*' ( options {greedy=false;} : . )* '*/' {skip();}
			;

fragment DIGIT		:	'0'..'9';

fragment LETTER		:	('a'..'z'|'A'..'Z');

LBRACK		:	'{';
RBRACK		:	'}';
ASSIGN		:	'=';
LINE_SEPERATOR	:	';';
ARG_SEPERATOR	:	',';

// Logical operators
NOT		:	'!';
AND		:	'&';
OR		:	'|';
XOR		:	'^';
ADD		:	'+';