#include "lexer.hpp"
#include <iostream>

Lexer::Lexer(std::ifstream *in)
{
    this->setInput(in);
    this->setLineNum(1);
    this->setError(false);
}

Token Lexer::lex()
{
    // std::cout<<"LEX"<<std::endl;
    std::ifstream * input = this->getInput();
    Token::Name name; 

    if(this->unlex_token != NULL)
    {
        Token tok(this->unlex_token->getName(), this->unlex_token->getLine(), this->unlex_token->getLexeme());
        this->unlex_token = NULL;
        return tok;
    }
    while(!input->eof())
    {
        char c = input->peek();
        if(c == '\n')
        {
            // new line, increment line number
            this->setLineNum(this->getLineNum() + 1);
            input->get();
        }
        else if(isspace(c))
        {
            // white space ignored
            input->get();
        }
        else if((isalpha(c) || c == '_'))
        {
            // c is a letter or _, could be a identifier or a reserved word
            std::string id_lexeme = match_identifier(&name);
            if(id_lexeme != "")
            {
                // identifier found with a lexeme
                Token tok(name, this->getLineNum(), id_lexeme);
                return tok;
            }
            else
            {
                // reserved found with no lexeme
                Token tok(name, this->getLineNum());
                return tok;
            }
        }
        else if(isdigit(c))
        {
            // If c is a digit, will always be a number token
            std::string num_lexeme = match_number();
            Token tok(Token::Name::T_NUMBER, this->getLineNum(), num_lexeme);
            return tok;
        }
        else if(is_special(c))
        {
            // c can be a singleton, possible pair or pair, check all
            if( match_singleton(c, &name) ||
                match_possible_pairs(c, &name) ||
                match_pairs(c, &name))
            {
                Token tok(name, this->getLineNum());
                return tok;
            }
        }
        else if(c == '"')
        {
            // Starting string '"' found, try to match
            std::string str_lexeme = match_string();
            if(str_lexeme != "")
            {
                Token tok(Token::Name::T_STRING, this->getLineNum(), str_lexeme);
                return tok;
            }
        }
        else if(input->eof())
        {
            // EOF reached, return eof token
            Token tok(Token::Name::T_EOF, this->getLineNum());
            return tok;
        }
        else
        {
            // Illegal character found, throw error and set error to true
            std::cerr << "Error: Illegal character " << (char)input->get() << " at line " 
            << this->getLineNum() << std::endl;
            this->setError(true);
        }
    }
    Token eof_tok(Token::Name::T_EOF, this->getLineNum());
    return eof_tok;
}

void Lexer::unlex(Token tok)
{
    Token* new_tok = new Token(tok.getName(), tok.getLine(), tok.getLexeme());
    this->unlex_token = new_tok;

    // std::cout<<"UNLEX: ";
    // switch(tok.getName())
    // {
    //     case Token::T_NOTEQ: 
    //     case Token::T_EQEQ: 
    //     case Token::T_LTE: 
    //     case Token::T_GTE: 
    //     case Token::T_AND: 
    //     case Token::T_OR: 
    //     case Token::T_IF: 
    //     {
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         std::cout<<"2";
    //         break;
    //     }
    //     case Token::T_INT:
    //     {
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         std::cout<<"3";
    //         break;
    //     }
    //     case Token::T_TRUE: 
    //     case Token::T_BOOL: 
    //     case Token::T_VOID: 
    //     case Token::T_ELSE:
    //     {
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         std::cout<<"4";
    //         break;
    //     }
    //     case Token::T_FALSE: 
    //     case Token::T_WHILE: 
    //     case Token::T_BREAK:
    //     {
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         std::cout<<"5";
    //         break;
    //     }
    //     case Token::T_RETURN:
    //     {
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         this->getInput()->unget();
    //         std::cout<<"6";
    //         break;
    //     }
    //     case Token::T_ID: 
    //     case Token::T_NUMBER:
    //     {
    //         for(int i=0; i<(int)(tok.getLexeme().length()); i++)
    //         {
    //             this->getInput()->unget();
    //         }
    //         std::cout<<(int)(tok.getLexeme().length());
    //         break;
    //     }
    //     case Token::T_STRING:
    //     {
    //         for(int i=0; i<(int)(tok.getLexeme().length())+2; i++)
    //         {
    //             this->getInput()->unget();
    //         }
    //         std::cout<<(int)(tok.getLexeme().length())+2;
    //         break;
    //     }
    //     default:
    //     {
    //         this->getInput()->unget();
    //         std::cout<<"1";
    //         break;
    //     }
    // }
    // std::cout<<std::endl;
}

bool Lexer::is_special(char c)
{
    switch(c)
    {
    case '+':
    case '-':
    case '*':
    case '/':
    case '%':
    case '(':
    case ')':
    case '{':
    case '}':
    case ';':
    case ',':
    case '!':
    case '=':
    case '<':
    case '>':
    case '&':
    case '|':
        return true;
    default:
        return false;
    }
}

bool Lexer::match_singleton(char c, Token::Name *name)
{
    switch(c)
    {
    case '+': 
        *name = Token::Name::T_ADD;
        break;
    case '-': 
        *name = Token::Name::T_SUB; 
        break;
    case '*': 
        *name = Token::Name::T_MULT; 
        break;
    case '%': 
        *name = Token::Name::T_MOD; 
        break;
    case '(': 
        *name = Token::Name::T_LBRACKET; 
        break;
    case ')': 
        *name = Token::Name::T_RBRACKET; 
        break;
    case '{': 
        *name = Token::Name::T_LBRACE; 
        break;
    case '}': 
        *name = Token::Name::T_RBRACE; 
        break;
    case ';': 
        *name = Token::Name::T_SEMICOL; 
        break;
    case ',': 
        *name = Token::Name::T_COMMA; 
        break;
    default:
        return false;
    }
    this->getInput()->get();
    return true;
}

bool Lexer::match_possible_pairs(char c, Token::Name *name)
{
    switch(c)
    {
    case '!':
        this->getInput()->get();
        if(this->getInput()->peek() == '=')
        {
            this->getInput()->get();
            *name = Token::Name::T_NOTEQ;
        }
        else
        {
            *name = Token::Name::T_NOT;
        }
        break;
    case '=':
        this->getInput()->get();
        if(this->getInput()->peek() == '=')
        {
            this->getInput()->get();
            *name = Token::Name::T_EQEQ;
        }
        else
        {
            *name = Token::Name::T_EQ;
        }
        break;
    case '<':
        this->getInput()->get();
        if(this->getInput()->peek() == '=')
        {
            this->getInput()->get();
            *name = Token::Name::T_LTE;
        }
        else
        {
            *name = Token::Name::T_LT;
        }
        break;
    case '>':
        this->getInput()->get();
        if(this->getInput()->peek() == '=')
        {
            this->getInput()->get();
            *name = Token::Name::T_GTE;
        }
        else
        {
            *name = Token::Name::T_GT;
        }
        break;
    case '/': 
        this->getInput()->get();
        if(this->getInput()->peek() == '/')
        {
            // burn comment line and return false since there is no comment token
            burn_comment();
            return false;
        }
        else
        {
            *name = Token::Name::T_DIV; 
        }
        break;
    default:
        return false;
    }
    return true;
}

bool Lexer::match_pairs(char c, Token::Name *name)
{
    switch(c)
    {
    case '&':
        this->getInput()->get();
        if(this->getInput()->peek() == '&')
        {
            this->getInput()->get();
            *name = Token::Name::T_AND;
        }
        else
        {
            // Only a singular & found, throw error, return false
            std::cerr<<"Error: Expected & after & at line "<< this->getLineNum() 
            << ", did you mean &&"<<std::endl;
            this->setError(true);
            return false;
        }
        break;
    case '|':
        this->getInput()->get();
        if(this->getInput()->peek() == '|')
        {
            this->getInput()->get();
            *name = Token::Name::T_OR;
        }
        else
        {
            // Only a singular | found, throw error, return false
            std::cerr<<"Error: Expected | after | at line "<< this->getLineNum() 
            << ", did you mean ||"<<std::endl;
            this->setError(true);
            return false;
        }
        break;
    default: 
        return false;
    }
    return true;
}

std::string Lexer::match_identifier(Token::Name *name)
{
    std::string lexeme;
    char c = this->getInput()->peek();
    // Build lexeme until non-alphanumeric and not _
    while(isalnum(c) || c == '_')
    {
        lexeme.push_back(this->getInput()->get());
        c = this->getInput()->peek();
    }
    // Check if built lexeme is a reserved keyword
    if(!match_reserved(lexeme, name))
    {
        *name = Token::Name::T_ID;
        return lexeme;
    }
    return "";
}

bool Lexer::match_reserved(std::string s, Token::Name *name)
{
    if(s == "true")
    {
        *name = Token::Name::T_TRUE;
        return true;
    }
    else if(s == "false")
    {
        *name = Token::Name::T_FALSE;
        return true;
    }
    else if(s == "boolean")
    {
        *name = Token::Name::T_BOOL;
        return true;
    }
    else if(s == "int")
    {
        *name = Token::Name::T_INT;
        return true;
    }
    else if(s == "void")
    {
        *name = Token::Name::T_VOID;
        return true;
    }
    else if(s == "if")
    {
        *name = Token::Name::T_IF;
        return true;
    }
    else if(s == "else")
    {
        *name = Token::Name::T_ELSE;
        return true;
    }
    else if(s == "while")
    {
        *name = Token::Name::T_WHILE;
        return true;
    }
    else if(s == "break")
    {
        *name = Token::Name::T_BREAK;
        return true;
    }
    else if(s == "return")
    {
        *name = Token::Name::T_RETURN;
        return true;
    }
    else
    {
        return false;
    }
}

std::string Lexer::match_number()
{
    std::string lexeme;
    char c = this->getInput()->peek();
    while(isdigit(c))
    {
        lexeme.push_back(this->getInput()->get());
        c = this->getInput()->peek();
    }
    return lexeme;    
}

std::string Lexer::match_string()
{
    std::string lexeme;
    this->getInput()->get(); // This is the first '"'
    char c = this->getInput()->peek();

    // Keep building the lexeme until a terminating '"' or until an error occurs
    while(true)
    {
        if(c == '\n')
        {
            // J-- does not support multi-line strings
            std::cerr<<"Error: newline found before string terminating '\"' at line " 
            << this->getLineNum() << std::endl;
            this->setError(true);
            return "";
        }
        else if(this->getInput()->eof())
        {
            // EOF reached, missing terminating '"'
            std::cerr<<"Error: EOF found before string terminating '\"' at line " 
            << this->getLineNum() << std::endl;
            this->setError(true);
            return "";
        }
        else if(c == '"')
        {
            // Could be terminating, unless escaped
            // Count to count how many backslashes at the end
            int backslashes = 0;
            for(auto i = lexeme.length()-1; i >= 0; i--)
            {
                if(lexeme[i] == '\\')
                    backslashes++;
                else
                    break;
            }

            if(backslashes % 2 == 0 || lexeme.back() != '\\')
            {
                // if even number backslashes or last char is not a backslash, it is terminating
                this->getInput()->get(); // Consume terminating '"'
                return lexeme;
            }
        }
        lexeme.push_back(this->getInput()->get());
        c = this->getInput()->peek();
    }
}

void Lexer::burn_comment()
{
    // Consume until new line
    char c = this->getInput()->peek();
    while(c != '\n' && !this->getInput()->eof())
    {
        this->getInput()->get();
        c = this->getInput()->peek();
    }
}

std::string Lexer::name_to_str(Token::Name name)
{
    switch(name)
    {
        case Token::Name::T_ADD:        return "+";
        case Token::Name::T_SUB:        return "-";
        case Token::Name::T_MULT:       return "*";
        case Token::Name::T_DIV:        return "/";
        case Token::Name::T_MOD:        return "%";
        case Token::Name::T_LBRACKET:   return "(";
        case Token::Name::T_RBRACKET:   return ")";
        case Token::Name::T_LBRACE:     return "{";
        case Token::Name::T_RBRACE:     return "}";
        case Token::Name::T_SEMICOL:    return ";";
        case Token::Name::T_COMMA:      return ",";
        case Token::Name::T_NOT:        return "!";
        case Token::Name::T_NOTEQ:      return "!=";
        case Token::Name::T_EQ:         return "=";
        case Token::Name::T_EQEQ:       return "==";
        case Token::Name::T_LT:         return "<";
        case Token::Name::T_LTE:        return "<=";
        case Token::Name::T_GT:         return ">";
        case Token::Name::T_GTE:        return ">=";
        case Token::Name::T_AND:        return "&&";
        case Token::Name::T_OR:         return "||";
        case Token::Name::T_TRUE:       return "true";
        case Token::Name::T_FALSE:      return "false";
        case Token::Name::T_BOOL:       return "boolean";
        case Token::Name::T_INT:        return "int";
        case Token::Name::T_VOID:       return "void";
        case Token::Name::T_IF:         return "if";
        case Token::Name::T_ELSE:       return "else";
        case Token::Name::T_WHILE:      return "while";
        case Token::Name::T_BREAK:      return "break";
        case Token::Name::T_RETURN:     return "return";
        case Token::Name::T_EOF:        return "EOF";
        case Token::Name::T_ID:         return "Identifier";
        case Token::Name::T_NUMBER:     return "Number";
        case Token::Name::T_STRING:     return "String";
        default:                        return "";
    }
}

void Lexer::setInput(std::ifstream *in)
{
    this->in = in;
}

std::ifstream * Lexer::getInput()
{
    return this->in;
}

void Lexer::setLineNum(int line)
{
    if(line > 0)
        this->line_number = line;
}

int Lexer::getLineNum()
{
    return this->line_number;
}

void Lexer::setError(bool e)
{
    this->error = e;
}

bool Lexer::getError()
{
    return this->error;
}