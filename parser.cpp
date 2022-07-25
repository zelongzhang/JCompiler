#include "parser.hpp"
#include <iostream>
#include <typeinfo>
#include <vector>

Parser::Parser(Lexer * lexer)
{
    this->lexer = lexer;
}

void Parser::parse()
{
    Token tok = this->lexer->lex();
    this->root = new Prog();
    start(tok, this->root);
    root->assign_indents(root, 1);
    // print_ast();
}


//start -> /* empty */ | globaldeclarations
AST * Parser::start(Token tok, AST * node)
{
    //std::cout<<"start() "<<lexer->name_to_str(tok.getName())<<std::endl;
    if(tok.getName() == Token::T_EOF)
    {
        return node;
    }
    else
    {
        std::vector<AST*> glob_decls = globaldeclarations(tok);
        //std::cout<<"Got return from globaldeclarations"<<std::endl;
        for(auto g_d : glob_decls)
        {
            //std::cout<<"Start"<<std::endl;
            node->add_child(g_d);
        }
    }
    return node;
}

// globaldeclarations -> globaldeclaration globaldeclarations_p
std::vector<AST*> Parser::globaldeclarations(Token tok)
{
    //std::cout<<"globaldeclarations()"<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<AST*> glob_decls;
    AST* glob_decl = globaldeclaration(tok);
    if(glob_decl == NULL)
    {
        // no global declarations, return
        return glob_decls;
    }
    glob_decls.push_back(glob_decl);
    tok = this->lexer->lex();
    std::vector<AST*> prime_decls = globaldeclarations_p(tok);
    //std::cout<<"Got return from globaldeclarations_p"<<std::endl;
    glob_decls.insert(glob_decls.end(), prime_decls.begin(), prime_decls.end());
    return glob_decls;
}

//globaldeclarations_p -> globaldeclaration globaldeclarations_p | /* empty */
std::vector<AST*> Parser::globaldeclarations_p(Token tok)
{
    //std::cout<<"globaldeclarations_p()"<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<AST*> glob_decls;
    if(tok.getName() == Token::T_EOF)
    {
        return glob_decls;
    }
    AST* glob_decl = globaldeclaration(tok);
    if(glob_decl == NULL)
    {
        // no more global decls, return
        return glob_decls;
    }
    glob_decls.push_back(glob_decl);
    tok = this->lexer->lex();
    std::vector<AST*> prime_decls = globaldeclarations_p(tok);
    if(prime_decls.empty())
    {
        return glob_decls;
    }
    else
    {
        glob_decls.insert(glob_decls.end(), prime_decls.begin(), prime_decls.end());
    }
    return glob_decls;
}

/*
Substitute variabledeclaration, functiondeclaration, mainfunctiondeclaration
globaldeclaration -> variabledeclaration | functiondeclaration | mainfunctiondeclaration
globaldeclaration -> 
          type identifier ';' 
        | type identifier '(' functiondeclarator_p block
        | VOID identifier '(' functiondeclarator_p block
        | identifier '(' ')' block
globaldeclaration -> 
          type identifier globaldeclaration_p 
        | VOID identifier '(' functiondeclarator_p block
        | identifier '(' ')' block
globaldeclaration_p -> ';' | '(' functiondeclarator_p block
*/
AST* Parser::globaldeclaration(Token tok)
{
    //std::cout<<"globaldeclaration() "<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<AST*> glob_decls;

    if(tok.getName() == Token::T_ID)
    {
        //this must be a main function declaratoration
        //identifier '(' ')' block
        std::string id = tok.getLexeme();
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_LBRACKET)
        {
            std::cerr<<"error in main declaration, expected '(' after identifier around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_RBRACKET)
        {
            std::cerr<<"error in main declaration, expected ')' after '(' around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        tok = this->lexer->lex();
        Block* block_node = block(tok);
        //create main_decl node, add formals, id , type and block nodes to children.
        ID* id_node = new ID(id);
        FuncDecl* main_decl = new FuncDecl(Token::T_VOID, id_node, std::vector<Formal*>(), block_node, true);
        return main_decl;
    }
    else if(tok.getName() == Token::T_VOID)
    {
        //this msut be a function declarations
        //VOID identifier '(' functiondeclarator_p block
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_ID)
        {
            std::cerr<<"error in function declaration, expected identifier after void around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        std::string id = tok.getLexeme();
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_LBRACKET)
        {
            std::cerr<<"error in function declaration, expected '(' after void identifier around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        tok = this->lexer->lex();
        std::vector<Formal*> formals = functiondeclarator_p(tok);
        tok = this->lexer->lex();
        Block* block_node = block(tok);
        //create func_decl node, add formals, id , type and block nodes to children.
        ID* id_node = new ID(id);
        FuncDecl* func_decl = new FuncDecl(Token::T_VOID, id_node, formals, block_node, false);
        return func_decl;
    }
    else if(tok.getName() == Token::T_INT || tok.getName() == Token::T_BOOL)
    {
        //this could be a function or var declaration
        Token::Name type = tok.getName();
        tok = this->lexer->lex();
        if(tok.getName() == Token::T_ID)
        {
            std::string id = tok.getLexeme();
            tok = this->lexer->lex();
            return globaldeclaration_p(type, id, tok);
        }
        else
        {
            std::cerr<<"error in global declaration, expected an identifier after type around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
    }
    return NULL;
}

//globaldeclaration_p -> ';' | '(' functiondeclarator_p block
AST* Parser::globaldeclaration_p(Token::Name type, std::string id, Token tok)
{
    //std::cout<<"globaldeclaration_p(), type="<<lexer->name_to_str(type)<<", id="<<id<<" "<<lexer->name_to_str(tok.getName())<<std::endl;
    if(tok.getName() == Token::T_SEMICOL)
    {
        //this is a var declaration
        // std::cout<<"Var found "<<id<<std::endl;
        ID* id_node = new ID(id);
        VarDecl* var_decl = new VarDecl(type, id_node, true);
        return var_decl;
    }
    else if(tok.getName() == Token::T_LBRACKET)
    {
        //this is a func declaration
        //type identifier '(' functiondeclarator_p block
        tok = this->lexer->lex();
        std::vector<Formal*> formals = functiondeclarator_p(tok);
        tok = this->lexer->lex();
        Block* block_node = block(tok);
        // create and return func_decl node here with type, id, formal and block children.
        ID* id_node = new ID(id);
        FuncDecl* func_decl = new FuncDecl(type, id_node, formals, block_node, false);
        return func_decl;
    }
    else
    {
        std::cerr<<"error in declaration, expected either a ';' or '(' after type identifier around line "<<tok.getLine()<<std::endl;
        exit(1);
    }
}


//functiondeclarator_p -> formalparameterlist ')' | ')'
std::vector<Formal*> Parser::functiondeclarator_p(Token tok)
{
    //std::cout<<"functiondeclarator_p() "<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<Formal*> formals;
    if(tok.getName() == Token::T_RBRACKET)
        return formals;
    else
    {
        formals = formalparameterlist(tok);
        return formals;
    }
}

//formalparameterlist -> formalparameter formalparameterlist_p
std::vector<Formal*> Parser::formalparameterlist(Token tok)
{
    //std::cout<<"formalparameterlist() "<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<Formal*> formal_list;
    Formal* formal_node = formalparameter(tok);
    if(formal_node == NULL)
    {
        //no formals
        return formal_list;
    }
    formal_list.push_back(formal_node);
    tok = this->lexer->lex();
    std::vector<Formal*> formal_p_list = formalparameterlist_p(tok);
    formal_list.insert(formal_list.end(), formal_p_list.begin(), formal_p_list.end());
    return formal_list;
}

//formalparameterlist_p -> ',' formalparameter formalparameterlist_p | /* empty */
std::vector<Formal*> Parser::formalparameterlist_p(Token tok)
{
    //std::cout<<"formalparameterlist_p() "<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<Formal*> formal_list;
    if(tok.getName() == Token::T_EOF)
    {
        return formal_list;
    }
    else if(tok.getName() == Token::T_COMMA)
    {
        tok = this->lexer->lex();
        Formal* formal_node = formalparameter(tok);
        if(formal_node == NULL)
        {
            //not allowed to end formal list with comma
            std::cerr<<"Error in parameter list: Cannot end parameter list with ',' around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        formal_list.push_back(formal_node);
        tok = this->lexer->lex();
        std::vector<Formal*> formal_p_list = formalparameterlist_p(tok);
        formal_list.insert(formal_list.end(), formal_p_list.begin(), formal_p_list.end());
        return formal_list;
    }
    else if(tok.getName() == Token::T_RBRACKET)
    {
        //reached end of param list
        return formal_list;
    }
    else
    {
        //Got something that's not a comma or empty string, error
        std::cerr<<"Error in parameter list: expected a parameter, got "
            <<lexer->name_to_str(tok.getName())<<" around line "<<tok.getLine()<<std::endl;
        exit(1);
    }
    return formal_list;
}

//formalparameter -> type identifier
Formal* Parser::formalparameter(Token tok)
{
    //std::cout<<"formalparameter() "<<lexer->name_to_str(tok.getName())<<std::endl;
    if(tok.getName() == Token::T_INT || tok.getName() == Token::T_BOOL)
    {
        Token::Name type = tok.getName();
        tok = this->lexer->lex();
        if(tok.getName() == Token::T_ID)
        {
            std::string id = tok.getLexeme();
            ID* id_node = new ID(id);
            Formal* formal_node = new Formal(type, id_node);
            //std::cout<<"Creating new formal: "<<id<<std::endl;
            return formal_node;
        }
        else
        {
            std::cerr<<"Error in parameter definition: expected an identifier after type, got "
                <<lexer->name_to_str(tok.getName())<<" around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
    }
    else
    {
        std::cerr<<"Error in parameter definition: expected a type, got "
            <<lexer->name_to_str(tok.getName())<<" around line "<<tok.getLine()<<std::endl;
        exit(1);
    }
}

/*
block -> '{' blockp
*/
Block* Parser::block(Token tok)
{
    //std::cout<<"block() "<<lexer->name_to_str(tok.getName())<<std::endl;
    if(tok.getName() == Token::T_LBRACE)
    {
        tok = this->lexer->lex();
        std::vector<AST*> block_stmts = block_p(tok);
        // create block from block_stmts
        tok = this->lexer->lex();
        //std::cout<<"Before creating block, next token is "<<this->lexer->name_to_str(tok.getName())<<std::endl;
        this->lexer->unlex(tok);
        Block* block_node = new Block(block_stmts);
        return block_node;
    }
    else
    {
        std::cerr<<"Error in block, expected '{' at the start of block around line "<<tok.getLine()<<std::endl;
        exit(1);
    }
}

//block_p -> blockstatements '}' | '}'
std::vector<AST*> Parser::block_p(Token tok)
{
    //std::cout<<"block_p() "<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<AST*> block_stmts;
    if(tok.getName() == Token::T_RBRACE)
    {
        return block_stmts;
    }
    block_stmts = blockstatements(tok);
    //std::cout<<"Got return from blockstatements"<<std::endl;
    tok = this->lexer->lex();
    if(tok.getName() != Token::T_RBRACE)
    {
        std::cerr<<"Error in block, expected '}' at the end of block around line "<<tok.getLine()<<std::endl;
        exit(1);
    }
    else
    {
        //std::cout<<"} found in block_p, consuming"<<std::endl;
    }
    // tok = this->lexer->lex();
    return block_stmts;
}

//blockstatements -> blockstatement blockstatements_p
std::vector<AST*> Parser::blockstatements(Token tok)
{
    //std::cout<<"blockstatements() "<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<AST*> block_stmts;
    AST* block_stmt = blockstatement(tok);
    block_stmts.push_back(block_stmt);
    tok = this->lexer->lex();
    if(tok.getName() == Token::T_RBRACE)
    {
        //std::cout<<"reached end of block, encountered } in blockstatements() "<<std::endl;
        this->lexer->unlex(tok);
        return block_stmts;
    }
    std::vector<AST*> block_p_stmts = blockstatements_p(tok);
    if(!block_p_stmts.empty())
        block_stmts.insert(block_stmts.end(), block_p_stmts.begin(), block_p_stmts.end());
    return block_stmts;
}   

//blockstatements_p -> blockstatement blockstatements_p | /* empty */
std::vector<AST*> Parser::blockstatements_p(Token tok)
{
    //std::cout<<"blockstatements_p() "<<lexer->name_to_str(tok.getName())<<std::endl;
    std::vector<AST*> block_stmts;
    if(tok.getName() == Token::T_EOF)
    {
        return block_stmts;
    }
    if(tok.getName() == Token::T_RBRACE)
    {
        //std::cout<<"encountered } in blockstatements_p() "<<std::endl;
        this->lexer->unlex(tok);
        return block_stmts;
    }
    AST* block_stmt = blockstatement(tok);
    block_stmts.push_back(block_stmt);
    tok = this->lexer->lex();
    std::vector<AST*> block_p_stmts = blockstatements_p(tok);
    if(!block_p_stmts.empty())
        block_stmts.insert(block_stmts.end(), block_p_stmts.begin(), block_p_stmts.end());
    return block_stmts;
}

//blockstatement -> variabledeclaration | statement
AST* Parser::blockstatement(Token tok)
{
    //std::cout<<"blockstatement() "<<lexer->name_to_str(tok.getName())<<std::endl;

    if(tok.getName() == Token::T_INT || tok.getName() == Token::T_BOOL)
    {
        //var_decl-> type identifier ';'
        Token::Name type = tok.getName();
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_ID)
        {
            std::cerr<<"Error in variable declaration, expected identifier after type around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        std::string id = tok.getLexeme();
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_SEMICOL)
        {
            std::cerr<<"Error in variable declaration, expected ';' after identifier type around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        //std::cout<<"Creating var "<<id<<std::endl;
        ID* id_node = new ID(id);
        VarDecl* var_decl = new VarDecl(type, id_node, false);
        return (AST*)(var_decl);
    }
    else
    {
        return statement(tok);
    }
}

/*
statement -> block 
            | ';' 
            | statementexpression ';' 
            | BREAK ';' 
            | RETURN statementret 
            | IF '(' expression ')' statement statementif 
            | WHILE '(' expression ')' statement
statementret -> expression ';' | ';'
statementif -> empty  | ELSE statement

No factoring needed after some expansion
statement -> '{' blockstatements '}' | '{' '}'
            | ';' 
            | identifier '=' assignmentexpression ';' | identifier '(' argumentlist ')' ';' | identifier '(' ')' ';'
            | BREAK ';' 
            | RETURN statementret 
            | IF '(' expression ')' statement statementif 
            | WHILE '(' expression ')' statement
*/
AST* Parser::statement(Token tok)
{
    //std::cout<<"statement() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_LBRACE:
        {
            //inner block
            AST* block_node = block(tok);
            return (AST*)(block_node);
        }
        case Token::T_SEMICOL:
        {
            //';' create NullStmt
            NullStmt* null_node = new NullStmt();
            return (AST*)(null_node);
        }
        case Token::T_BREAK:
        {
            //BREAK ';' 
            //match ';' create break node
            tok = this->lexer->lex();
            if(tok.getName() != Token::T_SEMICOL)
            {
                std::cerr<<"Error in statement: Expected ';' after break around line "<<tok.getLine()<<std::endl;
            }
            BreakStmt* break_node = new BreakStmt();
            return (AST*)(break_node);
        }
        case Token::T_RETURN:
        {
            tok = this->lexer->lex();
            return statementret(tok);
        }
        case Token::T_IF:
        {
            tok = this->lexer->lex();
            // match '('
            if(tok.getName() != Token::T_LBRACKET)
            {
                std::cerr<<"Expected '(' after if around line "<<tok.getLine()<<std::endl;
                exit(1);
            }
            // get expression
            tok = this->lexer->lex();
            AST* exp = expression(tok);
            tok = this->lexer->lex();
            // match ')'
            if(tok.getName() != Token::T_RBRACKET)
            {
                std::cerr<<"Expected ')' at end of if around line "<<tok.getLine()<<std::endl;
                exit(1);
            }
            // get statement
            tok = this->lexer->lex();
            AST* stmt = statement(tok);
            // return statementif
            tok = this->lexer->lex();
            return statementif(tok, exp, stmt);
        }
        case Token::T_WHILE:
        {
            //WHILE '(' expression ')' statement
            tok = this->lexer->lex();
            if(tok.getName() != Token::T_LBRACKET)
            {
                std::cerr<<"Expected '(' after while around line "<<tok.getLine()<<std::endl;
                exit(1);
            }
            // call expression
            tok = this->lexer->lex();
            AST* exp_node = expression(tok);
            // match ")"
            tok = this->lexer->lex();
            if(tok.getName() != Token::T_RBRACKET)
            {
                std::cerr<<"Expected ')' after while condition around line "<<tok.getLine()<<std::endl;
                exit(1);
            }
            // call statement
            tok = this->lexer->lex();
            AST* stmt_node = statement(tok);
            // TODO: create and return WhileStmt Node.
            AST* while_node = new WhileStmt(exp_node, stmt_node);
            return while_node;
        }
        case Token::T_ID:
        {
            AST* id_node = new ID(tok.getLexeme());
            tok = this->lexer->lex();
            if(tok.getName() == Token::T_EQ)
            {
                tok = this->lexer->lex();
                AST* assn_node = assignment(tok, id_node);
                tok = this->lexer->lex();
                if(tok.getName() != Token::T_SEMICOL)
                {
                    std::cerr<<"Expected ';' at end of assignment at around line "<<tok.getLine()<<std::endl;
                    exit(1);
                }
                return assn_node;
            }
            if(tok.getName() == Token::T_LBRACKET)
            {
                tok = this->lexer->lex();
                AST* funcall_node = functioninvocation_p(tok, id_node);
                tok = this->lexer->lex();
                if(tok.getName() != Token::T_SEMICOL)
                {
                    std::cerr<<"Expected ';' at end of assignment at around line "<<tok.getLine()<<std::endl;
                    exit(1);
                }
                return funcall_node;
            }
            else
            {
                std::cerr<<"Expected either '=' for assignment or '(' for function call after identifier at around line "<<tok.getLine()<<std::endl;
                exit(1);
            }
            break;
        }
        default:
        {
            return NULL;
        }
    }
    return NULL;
}

// statementret -> expression ';' | ';'
AST* Parser::statementret(Token tok)
{
    //std::cout<<"statementret() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    if(tok.getName() == Token::T_SEMICOL)
    {
        AST* ret_node = new RetStmt();
        return ret_node;
    }
    else
    {
        AST* exp_node = expression(tok);
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_SEMICOL)
        {
            std::cerr<<this->lexer->name_to_str(tok.getName())<<std::endl;
            std::cerr<<"Expected ';' at end of return statement around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        RetStmt* ret_node = new RetStmt(exp_node);
        return (AST*)(ret_node);
    }
}

// statementif -> empty  | ELSE statement
AST* Parser::statementif(Token tok, AST* exp, AST* if_stmt)
{
    //std::cout<<"statementif() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    if(tok.getName() == Token::T_ELSE)
    {
        tok = this->lexer->lex();
        AST* else_stmt = statement(tok);
        IfElseStmt* if_else_node = new IfElseStmt(exp, if_stmt, else_stmt);
        return (AST*)(if_else_node);
    }
    else
    {
        this->lexer->unlex(tok);
        IfStmt* if_node = new IfStmt(exp, if_stmt);
        return (AST*)(if_node);
    }
    return NULL;
}

/*
expression -> assignmentexpression

assignmentexpression -> conditionalorexpression | assignment

Full Expansion to find cases:
assignmentexpression -> 
'-' unaryexpression multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| '!' unaryexpression multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| NUMBER multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| STRING multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| TRUE multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| FALSE multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| '(' expression ')' multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| identifier '(' functioninvocationp multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
| identifier multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p
| identifier '=' assignmentexpression

Factor out identifier:
assignmentexpression -> 
'-' unaryexpression assignmentexpression_helper
| '!' unaryexpression assignmentexpression_helper
| NUMBER assignmentexpression_helper
| STRING assignmentexpression_helper
| TRUE assignmentexpression_helper
| FALSE assignmentexpression_helper
| '(' expression ')' assignmentexpression_helper 
| identifier assignmentexpression_p

assignmentexpression_p -> 
|'(' functioninvocationp assignmentexpression_helper
| assignmentexpression_helper
| '=' assignmentexpression

assignmentexpression_helper -> multiplicativeexpression_p additiveexpression_p relationalexpression_p equalityexpression_p conditionalandexpression_p conditionalorexpression_p 

multiplicativeexpression_p -> 
'*' unaryexpression multiplicativeexpression_p 
| '/' unaryexpression multiplicativeexpression_p 
| '%' unaryexpression multiplicativeexpression_p 
| empty 

additiveexpression_p -> 
'+' multiplicativeexpression additiveexpression_p 
| '-' multiplicativeexpression additiveexpression_p 
| empty 

relationalexpression_p -> 
'<' additiveexpression relationalexpression_p
| '>' additiveexpression relationalexpression_p
| LE additiveexpression relationalexpression_p
| GE additiveexpression relationalexpression_p
| empty 

equalityexpression_p -> 
EQ relationalexpression equalityexpression_p 
| NE relationalexpression equalityexpression_p
| empty

conditionalandexpression_p -> 
AND equalityexpression conditionalandexpression_p 
| empty 

conditionalorexpression_p -> 
OR conditionalandexpression conditionalorexpression_p 
| empty 
*/
AST* Parser::expression(Token tok)
{
    //std::cout<<"expression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    return assignmentexpression(tok);
}

/* 
assignmentexpression -> 
'-' unaryexpression assignmentexpression_helper
| '!' unaryexpression assignmentexpression_helper
| NUMBER assignmentexpression_helper
| STRING assignmentexpression_helper
| TRUE assignmentexpression_helper
| FALSE assignmentexpression_helper
| '(' expression ')' assignmentexpression_helper 
| identifier assignmentexpression_p
*/
AST* Parser::assignmentexpression(Token tok)
{
    //std::cout<<"assignmentexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_SUB:
        {
            tok = this->lexer->lex();
            AST* una_node = new UnaryExp(AST::SUB, unaryexpression(tok));
            tok = this->lexer->lex(); 
            return assignmentexpression_helper(tok, una_node);
        }
        case Token::T_NOT:
        {
            tok = this->lexer->lex();
            AST* una_node = new UnaryExp(AST::NOT, unaryexpression(tok));
            tok = this->lexer->lex(); 
            return assignmentexpression_helper(tok, una_node);
        }
        case Token::T_NUMBER:
        {
            AST* num_node = new Literal(AST::NUMBER, tok.getLexeme());
            tok = this->lexer->lex(); 
            return assignmentexpression_helper(tok, num_node);
        }
        case Token::T_STRING:
        {
            AST* str_node = new Literal(AST::STRING, tok.getLexeme());
            tok = this->lexer->lex(); 
            return assignmentexpression_helper(tok, str_node);
        }
        case Token::T_TRUE:
        {
            AST* true_node = new Literal(AST::TRUE, tok.getLexeme());
            tok = this->lexer->lex(); 
            return assignmentexpression_helper(tok, true_node);
        }
        case Token::T_FALSE:
        {
            AST* false_node = new Literal(AST::FALSE, tok.getLexeme());
            tok = this->lexer->lex(); 
            return assignmentexpression_helper(tok, false_node);
        }
        case Token::T_LBRACKET:
        {
            tok = this->lexer->lex();
            AST* exp_node = expression(tok);
            tok = this->lexer->lex();
            if(tok.getName() != Token::T_RBRACKET)
            {
                std::cerr<<"Expected ')' after expression near line "<<tok.getLine()<<std::endl;
                exit(1);
            }
            tok = this->lexer->lex();
            return assignmentexpression_helper(tok, exp_node);
        }
        case Token::T_ID:
        {
            AST* id_node = new ID(tok.getLexeme());
            tok = this->lexer->lex();
            return assignmentexpression_p(tok, id_node);
        }
        default:
        {
            std::cerr<<"Expected valid expression near line "<<tok.getLine()<<std::endl;
            exit(1);
            return NULL;
        }
    }
}

/* assignmentexpression_helper -> 
multiplicativeexpression_p additiveexpression_p relationalexpression_p 
equalityexpression_p conditionalandexpression_p conditionalorexpression_p 
*/
AST* Parser::assignmentexpression_helper(Token tok, AST* first_node)
{
    //std::cout<<"assignmentexpression_helper() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    if(tok.getName() == Token::T_EOF)
        return first_node;
    AST* mult_node = multiplicativeexpression_p(tok, first_node);
    tok = this->lexer->lex();
    AST* add_node = additiveexpression_p(tok, mult_node);
    tok = this->lexer->lex();
    AST* rel_node = relationalexpression_p(tok, add_node);
    tok = this->lexer->lex();
    AST* eq_node = equalityexpression_p(tok, rel_node);
    tok = this->lexer->lex();
    AST* and_node = conditionalandexpression_p(tok, eq_node);
    tok = this->lexer->lex();
    AST* or_node = conditionalorexpression_p(tok, and_node);
    return or_node;
}

/*
assignmentexpression_p -> 
|'(' functioninvocation_p assignmentexpression_helper
| assignmentexpression_helper
| '=' assignmentexpression
*/
AST* Parser::assignmentexpression_p(Token tok, AST* id_node)
{
    //std::cout<<"assignmentexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    if(tok.getName() == Token::T_LBRACKET)
    {
        tok = this->lexer->lex();
        AST* funcall_node = functioninvocation_p(tok, id_node);
        tok = this->lexer->lex();
        return assignmentexpression_helper(tok, funcall_node);
    }
    else if(tok.getName() == Token::T_EQ)
    {
        tok = this->lexer->lex();
        return assignment(tok, id_node);
    }
    else
    {
        return assignmentexpression_helper(tok, id_node);
    }
}

// assignment -> identifier '=' assignmentexpression
AST* Parser::assignment(Token tok, AST* id_node)
{
    //std::cout<<"assignment() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    AST* assn_exp = assignmentexpression(tok);
    AST* assn_stmt = new AssnStmt(id_node, assn_exp);
    return assn_stmt;
}

/*
multiplicativeexpression -> unaryexpression multiplicativeexpression_p
*/
AST* Parser::multiplicativeexpression(Token tok)
{
    //std::cout<<"multiplicativeexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    AST* una_node = unaryexpression(tok);
    tok = this->lexer->lex();
    return multiplicativeexpression_p(tok, una_node);
}

/*
multiplicativeexpression_p -> 
'*' unaryexpression multiplicativeexpression_p 
| '/' unaryexpression multiplicativeexpression_p 
| '%' unaryexpression multiplicativeexpression_p 
| empty 
*/
AST* Parser::multiplicativeexpression_p(Token tok, AST* prev_node)
{
    //std::cout<<"multiplicativeexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_EOF:
        {
            return prev_node;
        }
        case Token::T_MULT:
        {
            tok = this->lexer->lex();
            AST* una_node = unaryexpression(tok);
            AST* ar_node = new ArExp(AST::MULT, prev_node, una_node);
            tok = this->lexer->lex();
            return multiplicativeexpression_p(tok, ar_node);
        }
        case Token::T_DIV:
        {
            tok = this->lexer->lex();
            AST* una_node = unaryexpression(tok);
            AST* ar_node = new ArExp(AST::DIV, prev_node, una_node);
            tok = this->lexer->lex();
            return multiplicativeexpression_p(tok, ar_node);
        }
        case Token::T_MOD:
        {
            tok = this->lexer->lex();
            AST* una_node = unaryexpression(tok);
            AST* ar_node = new ArExp(AST::MOD, prev_node, una_node);
            tok = this->lexer->lex();
            return multiplicativeexpression_p(tok, ar_node);
        }
        default:
        {
            this->lexer->unlex(tok);
            return prev_node;
        }
    }
}

// additiveexpression -> multiplicativeexpression additiveexpression_p
AST* Parser::additiveexpression(Token tok)
{
    //std::cout<<"additiveexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    AST* mult_node = multiplicativeexpression(tok);
    tok = this->lexer->lex();
    return additiveexpression_p(tok, mult_node);
}

/*
additiveexpression_p -> 
'+' multiplicativeexpression additiveexpression_p 
| '-' multiplicativeexpression additiveexpression_p 
| empty 
*/
AST* Parser::additiveexpression_p(Token tok, AST* prev_node)
{
    //std::cout<<"additiveexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_EOF:
        {
            return prev_node;
        }
        case Token::T_ADD:
        {
            tok = this->lexer->lex();
            AST* mult_node = multiplicativeexpression(tok);
            AST* ar_node = new ArExp(AST::ADD, prev_node, mult_node);
            tok = this->lexer->lex();
            return additiveexpression_p(tok, ar_node);
        }
        case Token::T_SUB:
        {
            tok = this->lexer->lex();
            AST* mult_node = multiplicativeexpression(tok);
            AST* ar_node = new ArExp(AST::SUB, prev_node, mult_node);
            tok = this->lexer->lex();
            return additiveexpression_p(tok, ar_node);
        }
        default:
        {
            this->lexer->unlex(tok);
            return prev_node;
        }
    }
}

// relationalexpression -> additiveexpression relationalexpression_p
AST* Parser::relationalexpression(Token tok)
{
    //std::cout<<"relationalexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    AST* add_node = additiveexpression(tok);
    tok = this->lexer->lex();
    return relationalexpression_p(tok, add_node);
}

/*
relationalexpression_p -> 
'<' additiveexpression relationalexpression_p
| '>' additiveexpression relationalexpression_p
| LE additiveexpression relationalexpression_p
| GE additiveexpression relationalexpression_p
| empty 
*/
AST* Parser::relationalexpression_p(Token tok, AST* prev_node)
{
    //std::cout<<"relationalexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_EOF:
        {
            return prev_node;
        }
        case Token::T_LT:
        {
            tok = this->lexer->lex();
            AST* add_node = additiveexpression(tok);
            AST* rel_node = new CmpExp(AST::LT, prev_node, add_node);
            tok = this->lexer->lex();
            return relationalexpression_p(tok, rel_node);
        }
        case Token::T_LTE:
        {
            tok = this->lexer->lex();
            AST* add_node = additiveexpression(tok);
            AST* rel_node = new CmpExp(AST::LTE, prev_node, add_node);
            tok = this->lexer->lex();
            return relationalexpression_p(tok, rel_node);
        }
        case Token::T_GT:
        {
            tok = this->lexer->lex();
            AST* add_node = additiveexpression(tok);
            AST* rel_node = new CmpExp(AST::GT, prev_node, add_node);
            tok = this->lexer->lex();
            return relationalexpression_p(tok, rel_node);
        }
        case Token::T_GTE:
        {
            tok = this->lexer->lex();
            AST* add_node = additiveexpression(tok);
            AST* rel_node = new CmpExp(AST::GTE, prev_node, add_node);
            tok = this->lexer->lex();
            return relationalexpression_p(tok, rel_node);
        }
        default:
        {
            this->lexer->unlex(tok);
            return prev_node;
        }
    }
}

// equalityexpression -> relationalexpression equalityexpression_p
AST* Parser::equalityexpression(Token tok)
{
    //std::cout<<"equalityexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    AST* rel_node = relationalexpression(tok);
    tok = this->lexer->lex();
    return equalityexpression_p(tok, rel_node);
}

/*
equalityexpression_p -> 
EQ relationalexpression equalityexpression_p 
| NE relationalexpression equalityexpression_p
| empty
*/
AST* Parser::equalityexpression_p(Token tok, AST* prev_node)
{
    //std::cout<<"equalityexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_EOF:
        {
            return prev_node;
        }
        case Token::T_EQEQ:
        {
            tok = this->lexer->lex();
            AST* rel_node = relationalexpression(tok);
            AST* eq_node = new CmpExp(AST::EQEQ, prev_node, rel_node);
            tok = this->lexer->lex();
            return equalityexpression_p(tok, eq_node);
        }
        case Token::T_NOTEQ:
        {
            tok = this->lexer->lex();
            AST* rel_node = relationalexpression(tok);
            AST* eq_node = new CmpExp(AST::NOTEQ, prev_node, rel_node);
            tok = this->lexer->lex();
            return equalityexpression_p(tok, eq_node);
        }
        default:
        {
            this->lexer->unlex(tok);
            return prev_node;
        }
    }
}

// conditionalandexpression -> equalityexpression conditionalandexpression_p
AST* Parser::conditionalandexpression(Token tok)
{
    //std::cout<<"conditionalandexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    AST* eq_node = equalityexpression(tok);
    tok = this->lexer->lex();
    return conditionalandexpression_p(tok, eq_node);
}

/*
conditionalandexpression_p -> 
AND equalityexpression conditionalandexpression_p 
| empty 
*/
AST* Parser::conditionalandexpression_p(Token tok, AST* prev_node)
{
    //std::cout<<"conditionalandexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_EOF:
        {
            return prev_node;
        }
        case Token::T_AND:
        {
            tok = this->lexer->lex();
            AST* eq_node = equalityexpression(tok);
            AST* and_node = new CondExp(AST::AND, prev_node, eq_node);
            tok = this->lexer->lex();
            return conditionalandexpression_p(tok, and_node);
        }
        default:
        {
            this->lexer->unlex(tok);
            return prev_node;
        }
    }
}

// conditionalorexpression -> conditionalandexpression conditionalorexpression_p
AST* Parser::conditionalorexpression(Token tok)
{
    //std::cout<<"conditionalorexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    AST* and_node = conditionalandexpression(tok);
    tok = this->lexer->lex();
    return conditionalorexpression_p(tok, and_node);
}

/*
conditionalorexpression_p -> 
OR conditionalandexpression conditionalorexpression_p 
| empty 
*/
AST* Parser::conditionalorexpression_p(Token tok, AST* prev_node)
{
    //std::cout<<"conditionalorexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_EOF:
        {
            return prev_node;
        }
        case Token::T_OR:
        {
            tok = this->lexer->lex();
            AST* and_node = conditionalandexpression(tok);
            AST* or_node = new CondExp(AST::OR, prev_node, and_node);
            tok = this->lexer->lex();
            return conditionalorexpression_p(tok, or_node);
        }
        default:
        {
            this->lexer->unlex(tok);
            return prev_node;
        }
    }    
}

/* 
unaryexpression -> 
'-' unaryexpression 
| '!' unaryexpression
| literal (NUM, STRING, TRUE, FALSE)
| '(' expression ')'
| identifier unaryexpression_p
*/
AST* Parser::unaryexpression(Token tok)
{
    //std::cout<<"unaryexpression() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    switch(tok.getName())
    {
        case Token::T_SUB:
        {
            tok = this->lexer->lex();
            AST* una_node = unaryexpression(tok);
            AST* neg_node = new UnaryExp(AST::SUB, una_node);
            return neg_node;
        }
        case Token::T_NOT:
        {
            tok = this->lexer->lex();
            AST* una_node = unaryexpression(tok);
            AST* not_node = new UnaryExp(AST::NOT, una_node);
            return not_node;
        }
        case Token::T_NUMBER:
        {
            AST* lit = new Literal(AST::NUMBER, tok.getLexeme());
            return lit;
        }   
        case Token::T_STRING:
        {
            AST* lit = new Literal(AST::STRING, tok.getLexeme());
            return lit;
        }
        case Token::T_TRUE:
        {
            AST* lit = new Literal(AST::TRUE, tok.getLexeme());
            return lit;
        }
        case Token::T_FALSE:
        {
            AST* lit = new Literal(AST::FALSE, tok.getLexeme());
            return lit;
        }
        case Token::T_LBRACKET:
        {
            tok = this->lexer->lex();
            AST* exp_node = expression(tok);
            tok = this->lexer->lex();
            if(tok.getName() != Token::T_RBRACKET)
            {
                std::cerr<<"Expected ')' after '(' at around line "<<tok.getLine()<<std::endl;
                exit(1);
            }
            return exp_node;
        }
        case Token::T_ID:
        {
            AST* id_node = new ID(tok.getLexeme());
            tok = this->lexer->lex();
            return unaryexpression_p(tok, id_node);
        }
        default:
        {
            this->lexer->unlex(tok);
            return NULL;
        }
    }
    return NULL;
}

// unaryexpression_p -> empty | '(' functioninvocation_p
AST* Parser::unaryexpression_p(Token tok, AST* id_node)
{
    //std::cout<<"unaryexpression_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    if(tok.getName() == Token::T_EOF)
    {
        return id_node;
    }
    else if(tok.getName() == Token::T_LBRACKET)
    {
        tok = this->lexer->lex();
        return functioninvocation_p(tok, id_node);
    }
    else
    {
        this->lexer->unlex(tok);
        return id_node;
    }
    return NULL;
}

// functioninvocation -> identifier '(' functioninvocation_p
AST* Parser::functioninvocation(Token tok)
{
    //std::cout<<"functioninvocation() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    if(tok.getName() != Token::T_ID)
    {
        std::cerr<<"Expected identifier for function call at around line "<<tok.getLine()<<std::endl;
        exit(1);
    }
    AST* id_node = new ID(tok.getLexeme());
    tok = this->lexer->lex();
    if(tok.getName() != Token::T_LBRACKET)
    {
        std::cerr<<"Expected '(' after function name at round line "<<tok.getLine()<<std::endl;
        exit(1);
    }
    tok = this->lexer->lex();
    return functioninvocation_p(tok, id_node);
}

//functioninvocationp -> argumentlist ')' | ')'
AST* Parser::functioninvocation_p(Token tok, AST* id_node)
{
    //std::cout<<"functioninvocation_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    if(tok.getName() == Token::T_RBRACKET)
    {
        AST* actuals = new Actuals();
        AST* funcall_node = new FuncCall(id_node, actuals);
        return funcall_node;
    }
    else
    {
        std::vector<AST*> arg_list = argumentlist(tok);
        AST* actuals = new Actuals(arg_list);
        AST* funcall_node = new FuncCall(id_node, actuals);
        tok = this->lexer->lex();
        if(tok.getName() != Token::T_RBRACKET)
        {
            std::cerr<<"Expected ')' after function actuals around line "<<tok.getLine()<<std::endl;
            exit(1);
        }
        return funcall_node;
    }
    return NULL;
}

// argumentlist -> expression argumentlist_p
std::vector<AST*> Parser::argumentlist(Token tok)
{
    //std::cout<<"argumentlist() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    std::vector<AST*> arg_list;
    AST* arg = expression(tok);
    arg_list.push_back(arg);
    tok = this->lexer->lex();
    std::vector<AST*> arg_p_list = argumentlist_p(tok);
    arg_list.insert(arg_list.end(), arg_p_list.begin(), arg_p_list.end());
    return arg_list;
}

// argumentlist_p -> ',' expression argumentlist_p | empty 
std::vector<AST*> Parser::argumentlist_p(Token tok)
{
    //std::cout<<"argumentlist_p() "<<lexer->name_to_str(tok.getName())<<" "<<tok.getLexeme()<<std::endl;
    std::vector<AST*> arg_list;
    if(tok.getName() == Token::T_EOF)
    {
        return arg_list;
    }
    else if(tok.getName() == Token::T_COMMA)
    {
        tok = this->lexer->lex();
        AST* arg_node = expression(tok);
        arg_list.push_back(arg_node);
        tok = this->lexer->lex();
        std::vector<AST*> arg_p_list = argumentlist_p(tok);
        arg_list.insert(arg_list.end(), arg_p_list.begin(), arg_p_list.end());
        return arg_list;
    }
    else
    {
        this->lexer->unlex(tok);
        return arg_list;
    }
    return arg_list;
}

void Parser::print_ast()
{
    std::cout<<"printing ast..."<<std::endl;
    this->root->print();
}
