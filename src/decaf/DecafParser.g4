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


field: type id|type id LCOLCHETE int_literal RCOLCHETE;


field_decl: field (VIRGULA field)* PTVIRGULA;

decl: VIRGULA type id;
method_decl: (type|VOID) id LPARENTS (type id)? (type id decl)* RPARENTS block;

block: LCURLY var_decl* statement* RCURLY;

var: type id;
var_decl: var (VIRGULA var)* PTVIRGULA;

type: INT|BOOLEAN;	


statement: location assign_op expr PTVIRGULA
	| method_call PTVIRGULA
	|IF LPARENTS expr RPARENTS block (ELSE block)*
	|FOR id assign_op expr VIRGULA expr block
	| RETURN (expr)* PTVIRGULA
	|BREAK PTVIRGULA;

assign_op: ATRIBUICAO|DECREMENTO|INCREMENTO;

call: VIRGULA expr;
method_call: method_name LPARENTS expr* (expr call)* RPARENTS
	|CALLOUT LPARENTS string_literal (VIRGULA callout_arg)* RPARENTS;

method_name: id;

location: id|id LCOLCHETE expr RCOLCHETE;

expr: location 
	|method_call 
	|literal 
	|MENOS expr 
	|expr (bin_op|MENOS) expr
	|FOR expr (VIRGULA id)*
	|LPARENTS expr RPARENTS;

callout_arg: expr|string_literal;

bin_op: ARITH
	|RELACAO
	|IGUALDADE
	|CONDICAO;


literal:int_literal
	|char_literal
	|bool_literal;

id: ID;

int_literal:NUMBER|HEXA;

callout: string_literal (VIRGULA callout)*;

char_literal: CHAR;

string_literal: STRING;

bool_literal:TRUE|FALSE;




