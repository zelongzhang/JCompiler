#pragma once
#include <fstream>
#include <string>
#include "token.hpp"

/*
The Lexer class is used to translate input files content into J-- tokens for parse usage.
Usage: call lex() to return next J-- Token.
This lexer is designed for the J-- specifications found at:
https://pages.cpsc.ucalgary.ca/~aycock/411/ms1.html
This class was referenced from Shankar's pure C++ example.
*/
class Lexer {

    Token* unlex_token;

    public:

    // Constructor, expects a valid input file stream
    Lexer(std::ifstream *in);

    // Default destructor
    ~Lexer() = default;

    /* 
    Main lex method, returns the next legal Token in the input file
    If EOF is reached, returns a EOF token
    If illegal input is found, an error message will be sent to cerr
    */
    Token lex();

    // Puts last read character back into stream. Only works for 1 character put back. Consequtive calls will cause issues.
    void unlex(Token tok);

    /* 
    Checks if the incoming character is a special character.
    Special characters includes all singleton, possible pairs and pair token names.
    */
    bool is_special(char c);

    /* 
    Sets name to match a singleton token name depending on the incoming character.
    Returns true if matched, false if not.
    */
    bool match_singleton(char c, Token::Name *name);

    /* 
    Sets name to match a possible pair token name depending on the incoming character/s.
    Returns true if matched, false if not.
    */
    bool match_possible_pairs(char c, Token::Name *name);

    /* 
    Sets name to match a pair token name depending on the incoming characters
    Returns true if matched, false if not
    */
    bool match_pairs(char c, Token::Name *name);

    /* 
    Sets name to match a reserved token name depending on string s.
    Returns true if matched, false if not.
    */
    bool match_reserved(std::string s, Token::Name *name);

    /* 
    Attempts to find and return the lexeme of the identifier token.
    If the string turns out to be a reserved keyword, "" is returned.
    Identifiers are allowed to start with '_' (i.e _abc, _, _123 , __1_a_ are all valid)
    No checks for if identifier exceeds maximum length allowed (65535 chars).
    https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.11
    */
    std::string match_identifier(Token::Name *name);

    /*
    Finds and returns the lexeme of the next number as a string.
    Only positive decimal based numbers are legal, decimal numbers, negative numbers are illegal.
    Leading zeros are not truncated in the lexeme.
    As the lexeme is a string, there is no check for maximum.
    */
    std::string match_number();
    
    /* 
    Finds and returns the lexeme of the incoming string.
    If not a valid string, throws error message.
    No checks for if string exceeds maximum length allowed (65535 chars).
    https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.11
    */
    std::string match_string();

    // Consumes the comment line, it is useless for the parser
    void burn_comment();

    // Converts a Token name to a string for printing
    std::string name_to_str(Token::Name name);

    // Getters/setters for private members
    void setLineNum(int line);
    int getLineNum();
    void setInput(std::ifstream *input);
    std::ifstream * getInput();
    void setError(bool e);
    bool getError();

    private:

    std::ifstream *in;
    int line_number;
    bool error;
};