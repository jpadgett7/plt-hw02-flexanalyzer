# Lexical Analyzer in Flex
Like Homework 1, this project is a lexical analyzer. Rather than `C++`, this project is written in `flex`, a lexical analysis generation program. The lexical analyzer accepts a text file, parses each lexeme, and outputs the lexem and its token type.

## Token Types
The lexical analyzer regognizes the following tokens:

* **Integer** (INTCONST) Non-empty sequence of digits optionally preceded with '+' or '-'
* **Decimal** (DECCONST) Integer followed by a '.' then followed by a non-empty sequence of digits
* **Scientific** (SCICONST) Decimal followed by character 'E' then followed by a non-zero integer
* **Hexadecimal** (HEXCONST) Non-empty sequence of digits or characters 'A' through 'F' followed by character 'H'
* **Binary** (BINCONST) Non-empty sequence of digits '1' or '0' followed by character 'B'
* **Keyword** (KEYWORD) Specific strings `while`, `else`, `end`, and `print`
* **Identifier** (IDENT) String that consists of a letter followed by zero or more letters, digits, or the underscore that are **not** hexadecimal type
* **String Constant** (STRCONST) String consisting of `"` followed by zero or more letters, digits, or spaces followed by another `"`
* **Operator** (OPERATOR) Symbols `+ - * / < > &`

## Comments
The analyzer identifies and ignores comments, which start with `%` and runs to the end of the line.
