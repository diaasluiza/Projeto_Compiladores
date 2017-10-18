parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_CLASS LCURLY field_decl* method_decl* RCURLY;


field: (type id|type id LCOLCHETE int_literal RCOLCHETE)PTVIRGULA;

field_decl: field (VIRGULA field)* PTVIRGULA;

method_decl: type
	|VOID id LPARENTS (type id)* RPARENTS block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type id+ PTVIRGULA;

id: ID;

type: INT|BOOLEAN;

int_literal:(NUMBER|HEXA)+;

statement: location assign_op expr PTVIRGULA
	|method_call PTVIRGULA
	|IF LPARENTS expr RPARENTS block (ELSE block) 
	|FOR LPARENTS id ATRIBUICAO expr PTVIRGULA expr PTVIRGULA block RPARENTS 
	|RETURN(expr)PTVIRGULA
	|BREAK PTVIRGULA;

location: id
	| id LCOLCHETE expr RCOLCHETE;

expr: location
	|method_call
	|literal
	|expr bin_op expr
	|MENOS expr
	|EXCLA expr
	|LPARENTS expr RPARENTS;

method_call: method_name(expr)*
	|CALLOUT(string_literal (VIRGULA callout_arg));

method_name: id;

callout_arg: expr
	|callout;
callout: string_literal (VIRGULA callout)*;

literal:int_literal
	|char_literal
	|bool_literal;

char_literal: CHAR;

string_literal: STRING;

bool_literal:TRUE|FALSE;

bin_op: arith_op
	|rel_op
	|eq_op
	|cond_op;

eq_op:IGUALDADE;
arith_op: ARITIMETICOS;
cond_op: CONDICAO;
rel_op: RELACAO;
assign_op: OP;

