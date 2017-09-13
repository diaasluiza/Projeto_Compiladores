lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}


LCURLY : '{';
RCURLY : '}';
IF: 'if';
NUMBER: (NUM)+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|'\\\\'|'a'..'z' | 'A'..'Z'| '0'..'9') '\'';

HEXA : '0x'[a-fA-F0-9]+;

STRING : '"' (ESC|ID|NUM|' '|','|'?'|'.'|':'|'!'|'\\'|',' ~('"'))* '"';


ID  :  ('a'..'z' | 'A'..'Z' | '_' |NUM)+;

OP : ('-'|'+'|'*'|'<='|'<'|'!='|'&&');

fragment
ESC :  '\\' ('n'|'t'|'\''|'"');
fragment
NUM : ('0'..'9');
