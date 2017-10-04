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


field_decl: type id|type id LCOLCHETE int_literal RCOLCHETE+PTVIRGULA;
method_decl: type|VOID id LPARENTS(type id)* RPARENTS block;

block: LCURLY var_decl* RCURLY;
var_decl: type id+ PTVIRGULA;
id: ID;
type: INT|BOOLEAN;
int_literal: NUMBER|HEXA;

