#include "token.hpp"

Token::Token(Name name, int line_num, std::string lexeme)
{
    this->name = name;
    this->line_number = line_num;
    this->setLexeme(lexeme); // Default value of "" represents tokens without lexemes
}

Token::Name Token::getName()
{
    return this->name;
}

std::string Token::getLexeme()
{
    return this->lexeme;
}

void Token::setLexeme(std::string lexeme)
{
    // Only these tokens should have lexemes, do not allow other tokens to set lexeme
    if(this->name != Name::T_ID && this->name != Name::T_NUMBER && this->name != Name::T_STRING)
        return;
    else
        this->lexeme = lexeme;
}

int Token::getLine()
{
    return this->line_number;
}

void Token::setName(Name name)
{
    this->name = name;
}

void Token::setLine(int line_number)
{
    this->line_number = line_number;
}