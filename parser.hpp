#pragma once
#include "lexer.hpp"
#include "token.hpp"
#include "ast.hpp"

class Parser
{
    public:
    Parser(Lexer * lexer);
    ~Parser() = default;
    Lexer* lexer;
    AST* root;
    AST* curr;

    /*
    Parses stream of scanner tokens and construct AST.
    */
    void parse();

    /*
    Prints constructed AST to std::cout.
    */
    void print_ast();

    /*
    Start symbol/grammer.
    All functions below are derived from grammar found in doc/grammar. 
    Additional derivations can be found on top of functions in the definition.
    */
    AST* start(Token tok, AST * node);

    std::vector<AST*> globaldeclarations(Token tok);
    std::vector<AST*> globaldeclarations_p(Token tok);
    AST* globaldeclaration(Token tok);
    AST* globaldeclaration_p(Token::Name type, std::string id, Token tok);
    
    std::vector<Formal*> functiondeclarator_p(Token tok);
    std::vector<Formal*> formalparameterlist(Token tok);
    std::vector<Formal*> formalparameterlist_p(Token tok);
    Formal* formalparameter(Token tok);

    Block* block(Token tok);
    std::vector<AST*> block_p(Token tok);
    std::vector<AST*> blockstatements(Token tok);
    std::vector<AST*> blockstatements_p(Token tok);
    AST* blockstatement(Token tok);

    AST* statement(Token tok);
    AST* statementret(Token tok);
    AST* statementif(Token tok, AST* exp, AST* if_stmt);

    AST* expression(Token tok);
    AST* assignmentexpression(Token tok);
    AST* assignmentexpression_helper(Token tok, AST* first_node);
    AST* assignmentexpression_p(Token tok, AST* id_node);
    AST* assignment(Token tok, AST* id_node);
    AST* multiplicativeexpression(Token toke);
    AST* multiplicativeexpression_p(Token tok, AST* prev_node);
    AST* additiveexpression(Token toke);
    AST* additiveexpression_p(Token tok, AST* prev_node);
    AST* relationalexpression(Token toke);
    AST* relationalexpression_p(Token tok, AST* prev_node);
    AST* equalityexpression(Token toke);
    AST* equalityexpression_p(Token tok, AST* prev_node);
    AST* conditionalandexpression(Token toke);
    AST* conditionalandexpression_p(Token tok, AST* prev_node);
    AST* conditionalorexpression(Token toke);
    AST* conditionalorexpression_p(Token tok, AST* prev_node);
    AST* unaryexpression(Token tok);
    AST* unaryexpression_p(Token tok, AST* id_node);

    AST* functioninvocation(Token tok);
    AST* functioninvocation_p(Token tok, AST* id_node);
    std::vector<AST*> argumentlist(Token tok);
    std::vector<AST*> argumentlist_p(Token tok);
};