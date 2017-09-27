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
VIRGULA: ',';
PTVIRGULA: ';';
LPARENTS: '(';
RPARENTS: ')';
LCOLCHETE: '[';
RCOLCHETE: ']';
LCURLY : '{';
RCURLY : '}';
IF: 'if';
BOOLEAN: 'boolean';
CALLOUT: 'callout';
CLASS: 'class';
ELSE: 'else';
FALSE: 'false';
INT: 'int';
RETURN: 'return';
TRUE: 'true';
FOR: 'for';
VOID: 'void';
BREAK: 'break';
CONTINUE: 'continue'; 
NUMBER: (NUM)+;

TK_CLASS: 'class Program';
METODO: (TYPE|VOID);
TYPE: (INT|BOOLEAN);

WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|'\\\\'|'a'..'z' | 'A'..'Z'| '0'..'9') '\'';

HEXA : '0x'[a-fA-F0-9]+;

STRING : '"' (ESC|ID|NUM|' '|','|'?'|'.'|':'|'!'|'\\'|',' ~('"'))* '"';

HEX_CEPTION: '0x';

ID  :  ('a'..'z' | 'A'..'Z' | '_' |NUM)+;

OP : ('-'|'+'|'*'|'<='|'<'|'!='|'&&'|'>='|'!='|'=='|'||'|'>'|'=');

fragment
ESC :  '\\' ('n'|'t'|'\''|'"');
fragment
NUM : ('0'..'9');

