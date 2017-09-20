package decaf;

import java.io.*;
//import antlr.Token;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java6035.tools.CLI.*;

class Main {
    public static void main(String[] args) {
        try {
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();

		        			switch (token.getType())
		        			{
		        			case DecafLexer.VIRGULA:
							type = " ";
							break;
		        			case DecafLexer.PTVIRGULA:
							type = " ";
							break;
		        			case DecafLexer.LPARENTS:
							type = " ";
							break;
		        			case DecafLexer.RPARENTS:
							type = " ";
							break;
		        			case DecafLexer.LCOLCHETE:
							type = " ";
							break;
		        			case DecafLexer.RCOLCHETE:
							type = " ";
							break;
		        			case DecafLexer.LCURLY:
							type = " ";
							break;
		        			case DecafLexer.RCURLY:
							type = " ";
							break;
		        			case DecafLexer.BOOLEAN:
							type = "BOOLEAN";
							break;
						case DecafLexer.CALLOUT:
							type = "CALLOUT";
							break;
						case DecafLexer.CLASS:
							type = "CLASS";
							break;
						case DecafLexer.ELSE:
							type = "ELSE";
							break;
						case DecafLexer.FALSE:
							type = "BOOLEANLITERAL";
							break;
						case DecafLexer.INT:
							type = "INT";
							break;
						case DecafLexer.RETURN:
							type = "RETURN";
							break;
						case DecafLexer.TRUE:
							type = "BOOLEANLITERAL";
							break;
						case DecafLexer.VOID:
							type = "VOID";
							break;
						case DecafLexer.FOR:
							type = "FOR";
							break;
						case DecafLexer.BREAK:
							type = "BREAK";
							break;
						case DecafLexer.CONTINUE:
							type = "CONTINUE";
							break;
						case DecafLexer.IF:
		        				type = " RESERVADA";
		        				break;
						case DecafLexer.ID:
		        				type = " IDENTIFIER";
		        				break;
						case DecafLexer.CHAR:
							type = " CHARLITERAL";
							break;
						case DecafLexer.HEXA:
							type = " HEXALIT";
							break;
						case DecafLexer.NUMBER: 
							type = "INTLITERAL";
							break;
						case DecafLexer.STRING:
							type = "STRINGLITERAL";
							break;

		        			}
		        			System.out.println (token.getLine() + type + " " + text);
		        		}
		        		done = true;
        			} catch(Exception e) {
        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        }
        		}
        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);
                parser.program();
        	}
        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}

