#include "lexer.hpp"
#include "token.hpp"
#include "parser.hpp"
#include "checker.hpp"
#include "codegen.hpp"
#include <cstring>
#include <iostream>
#include <iomanip>
#include <fstream>

/*
Main method for the lexer.
Usage: main file_path
Standard input is not allowed.
Creates a Lexer instance and calls lex() continuously on the input file 
content until eof is reached.
Prints each of the returned Tokens in a human readable manner.
Returns EXIT_SUCCESS if no errors occur in execution and no illegal tokens are found.
Returns EXIT_FAILURE otherwise.
This method was referenced from Shankar's pure C++ example.
*/
int main(int argc, char** argv){
    std::ifstream file;
    int line_width = 6;
    int token_width = 12;
    if (argc == 3) 
    {
        file.open(argv[2]);
        if (!file.is_open()) 
        {
            std::cerr << "Error: could not open file at " << argv[1] << std::endl;
            std::cerr << std::strerror(errno) << std::endl;
            return EXIT_FAILURE;
        }

        Lexer lexer(&file);
        if(strcmp(argv[1], "-scanner") == 0)
        {
            Token tok = lexer.lex();
            // Print table header
            std::cout << std::setw(line_width) << std::left << "Line"
            << std::setw(token_width) << "Token" << "Lexeme"<<std::endl;

            // Continuous call to lex until eof
            while (tok.getName() != Token::Name::T_EOF) 
            {
                // Print token information
                std::cout << std::setw(line_width) << lexer.getLineNum()
                << std::setw(token_width) << lexer.name_to_str(tok.getName());
                if(tok.getLexeme() == "")
                    std::cout << std::endl;
                else
                    std::cout << tok.getLexeme() << std::endl;
                tok = lexer.lex();
            }
            // Return EXIT_FAILURE if any of the lex() calls returned an error message to cerr
            if(lexer.getError())
                return EXIT_FAILURE;           
        }
        else if(strcmp(argv[1], "-parse") == 0)
        {
            Parser par = Parser(&lexer);
            par.parse();
            decorate_ast(par.root);
            par.print_ast();
        }
        else if(strcmp(argv[1], "-code") == 0)
        {
            Parser par = Parser(&lexer);
            par.parse();
            decorate_ast(par.root);
            code_gen(par.root);
        }
    }
    return EXIT_SUCCESS;
}