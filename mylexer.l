/*
Name: John Padgett
Class: CS3500 - Programming Languages & Translators
Assignment 2 - Lexical Analyzer Using Flex
March 25, 2016
*/

%{
#include <iostream>
using namespace std;

int line_count = 0;
int lex_count = 0;
%}

%option noyywrap
DIGIT	[0-9]
BINAR	[01]
ALPHA	[A-Za-z]
HEX	[0-9A-F]
KEYWORD	("while"|"if"|"else"|"func"|"let"|"print")
OPRTOR  (\+|\-|\*|\/|\<|\>|\&)
INVALID_OP [^(\+|\-|\*|\/|\<|\>|\&| )]
INVALID_AP [^[A-Za-z]]
INVALID_IN [^[0-9]]

%%

\t								;
"%"(.|[ ])*							;
\n 								{ line_count++; }
("+"|"-")?{DIGIT}+						{ cout <<"#"<<lex_count<<": TOKEN: INTCONST  LEXEME: "<<yytext <<endl; lex_count++; }
("+"|"-")?{DIGIT}+"."{DIGIT}+					{ cout <<"#"<<lex_count<<": TOKEN: DECCONST  LEXEME: "<<yytext <<endl; lex_count++; }
("+"|"-")?{DIGIT}+"."{DIGIT}+"E"("+"|"-")?{DIGIT}+		{ cout <<"#"<<lex_count<<": TOKEN: SCICONST  LEXEME: "<<yytext <<endl; lex_count++; }
{HEX}+"H"							{ cout <<"#"<<lex_count<<": TOKEN: HEXCONST  LEXEME: "<<yytext <<endl; lex_count++; }
{BINAR}+"B"							{ cout <<"#"<<lex_count<<": TOKEN: BINCONST  LEXEME: "<<yytext <<endl; lex_count++; }
{KEYWORD}							{ cout <<"#"<<lex_count<<": TOKEN: KEYWORD   LEXEME: "<<yytext <<endl; lex_count++; }
{ALPHA}({ALPHA}|{DIGIT})*					{ cout <<"#"<<lex_count<<": TOKEN: IDENT     LEXEME: "<<yytext <<endl; lex_count++; }
\"({ALPHA}|{DIGIT}|[ ])*\"					{ cout <<"#"<<lex_count<<": TOKEN: STRCONST  LEXEME: "<<yytext <<endl; lex_count++; }
{OPRTOR}							{ cout <<"#"<<lex_count<<": TOKEN: OPERATOR  LEXEME: "<<yytext <<endl; lex_count++; }
{INVALID_OP}|{INVALID_AP}|{INVALID_IN}				{ cout <<"#"<<lex_count<<": TOKEN: ?         LEXEME: "<<yytext <<endl; lex_count++; }
.|\n								{ }

%%

int main()
{
	yylex();
	cout << line_count <<" lines processed." << endl;
	return 0;
}
