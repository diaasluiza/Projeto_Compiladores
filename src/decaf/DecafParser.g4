parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_CLASS LCURLY field_decl RCURLY EOF;

field_decl: {type id| type id LCOLCHETE int_literal RCOLCHETE}+,';' 
type: TYPE';'
id: ID';'
int_literal: digito|hexa';'
digito: NUMBER';'
hexa: HEXA';'

