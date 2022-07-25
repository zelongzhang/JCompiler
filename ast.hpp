#pragma once
#include <string.h>
#include <vector>
#include <iostream>
#include "token.hpp"
#include "stab.hpp"

#define INDENT_CHAR ' '

class AST;
    class Prog;
    class Stmt;
        class Block;
        class IfStmt;
        class IfElseStmt;
        class AssnStmt;
        class NullStmt;
        class RetStmt;
        class BreakStmt;
        class WhileStmt;
    
    class Exp;
        class ID;
        class Literal;
        class Actuals;
        class ArExp;
        class CmpExp;
        class UnaryExp;
        class CondExp;
        class FuncCall;
    
    class Decl;
        class FuncDecl;
        class VarDecl;
        class Formal;

class AST
{
    public:    
    enum NodeType {
        N_PROG,
        N_BLOCK,
        N_IFSTMT,
        N_IFELSESTMT,
        N_ASSNSTMT,
        N_NULLSTMT,
        N_RETSTMT,
        N_BREAKSTMT,
        N_WHILESTMT,
        N_ID,
        N_LITERAL,
        N_ACTUALS,
        N_AREXP,
        N_CMPEXP,
        N_UNARYEXP,
        N_CONDEXP,
        N_FUNCCALL,
        N_FUNCDECL,
        N_VARDECL,
        N_FORMAL,
        N_FORMAL_EMPTY
    };
    
    enum Oper {
        ADD, SUB, MULT,
        DIV, MOD, LT,
        GT, LTE, GTE,
        EQEQ, NOTEQ, NOT,
        AND, OR, NONE
    };

    enum LiteralType
    {
        NUMBER, STRING, TRUE, FALSE
    };

    enum VarType
    {
        INT, BOOL, VOID
    };

    NodeType node_type;
    StabEntry* stab_entry = NULL;
    std::vector<AST*> children;

    int indent_level;

    void print_indents(int level)
    {
        for(int i = 0; i<level*4; i++)
            std::cout<<INDENT_CHAR;
    }
    std::string get_lit_type(LiteralType type)
    { 
        switch (type)
        {
            case NUMBER: {return "num";}
            case STRING: {return "str";}
            case TRUE: {return "tr";}
            case FALSE: {return "fal";}
        }
    }
    std::string get_op_string(Oper op)
    {    
        switch (op)
        {
            case ADD: {return "+";}
            case SUB: {return "-";}
            case MULT: {return "*";}
            case DIV: {return "/";}
            case MOD: {return "%";}
            case LT: {return "<";}
            case GT: {return ">";}
            case LTE: {return "<=";}
            case GTE: {return ">=";}
            case EQEQ: {return "==";}
            case NOTEQ: {return "!=";}
            case NOT: {return "!";}
            case AND: {return "&&";}
            case OR: {return "||";}
            case NONE: {return "None";} 
        }
        return "";
    }

    void print_type(Token::Name type)
    {
        if(type == Token::T_INT)
            std::cout<<"type=int"<<std::endl;
        else if(type == Token::T_BOOL)
            std::cout<<"type=boolean"<<std::endl;
        else if(type == Token::T_VOID)
            std::cout<<"type=void"<<std::endl;
    }

    void assign_indents(AST* node, int depth)
    {
        for(auto c : node->children)
        {
            c->indent_level = depth;
            assign_indents(c, depth + 1);
        }
    }

    AST() = default;
    virtual void add_child(AST * child) = 0;
    virtual ~AST()
    {
        for(auto c :children)
        {
            delete c;
        }
        children.clear();
    }

    virtual void print() = 0;
};

class Stmt : public AST
{
    public:
    Stmt() = default;
    void add_child(AST* child) override
    {
        this->children.push_back(child);
    }
    void print() override
    {
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class Exp : public AST
{
    public:
    Oper op;
    Exp(Oper op) : AST()
    {
        this->op = op;
    }
    void add_child(AST* child) override
    {
        this->children.push_back(child);
    }
    void print() override
    {
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class Prog : public AST
{
    public:
    // Prog(const char* const str);
    void add_child(AST* child) override
    {
        this->node_type = N_PROG;
        this->children.push_back(child);
    }
    Prog() = default;
    void print() override
    {
        std::cout<<"Program:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class ID : public Exp
{
    public:
    std::string id;
    ID(std::string id) : Exp(NONE)
    {
        //std::cout<<"Creating ID Node "<<id<<std::endl;
        this->node_type = N_ID;
        this->id = id;
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"id: "<<this->id<<" ";
        if(this->stab_entry != NULL)
        {
            this->stab_entry->print_entry();
        }
        else
        {
            std::cout<<std::endl;
        }

    }
};

class Decl : public AST
{
    public:
    Token::Name type;

    void add_child(AST* child) override
    {
        this->children.push_back(child);
    }

    Decl(Token::Name type, ID* id)
    {
        this->type = type;
        this->add_child(id);
    }

    Decl(){}

    void print() override
    {
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class VarDecl : public Decl
{
    public:
    bool global;
    VarDecl(Token::Name type, ID* id, bool global): Decl(type, id) 
    {
        //std::cout<<"Creating VarDecl Node "<<id<<std::endl;
        this->node_type = N_VARDECL;
        this->global = global;
    }
    void print() override
    {
        print_indents(this->indent_level);
        if(global)
            std::cout<<"global_var_decl:"<<std::endl;
        else
            std::cout<<"var_decl:"<<std::endl;
        if(this->stab_entry != NULL)
        {
            print_indents(this->indent_level);
            this->stab_entry->print_entry();
        }
        print_indents(this->indent_level + 1);
        print_type(this->type);
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class Formal : public Decl
{
    public:
    Formal(Token::Name type, ID* id): Decl(type, id) 
    {
        //std::cout<<"Creating Formal Node "<<id<<std::endl;
        this->node_type = N_FORMAL;
        //print();
    }

    Formal()
    {
        this->node_type = N_FORMAL_EMPTY;
    }

    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"formal:"<<std::endl;
        if(type == Token::T_INT)
        {
            print_indents(this->indent_level + 1);
            std::cout<<"type=int"<<std::endl;
        }
        else if(type == Token::T_BOOL)
        {
            print_indents(this->indent_level + 1);
            std::cout<<"type=boolean"<<std::endl;
        }
        else if(type == Token::T_VOID)
        {
            print_indents(this->indent_level + 1);
            std::cout<<"type=void"<<std::endl;
        }
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class FuncDecl : public Decl
{
    public:
    bool main;
    bool no_args;
    FuncDecl(Token::Name type, ID* id, std::vector<Formal*> formals, Block* block, bool main): Decl(type, id)
    {
        //std::cout<<"Creating FuncDecl Node "<<id<<std::endl;
        this->node_type = N_FUNCDECL;
        this->main = main;
        if(formals.empty())
        {
            this->no_args = true;
            AST* empty_formal = new Formal();
            this->add_child(empty_formal);
        }
        else
        {
            this->no_args = false;
            for(auto formal : formals)
            {
                this->add_child((AST*)(formal));
            }
        }
        this->add_child((AST*)(block));
    }
    void print() override
    {
        print_indents(this->indent_level);
        if(main)
            std::cout<<"main_decl:"<<std::endl;
        else
            std::cout<<"func_decl:"<<std::endl;
        if(this->stab_entry != NULL)
        {
            print_indents(this->indent_level);
            this->stab_entry->print_entry();
        }
        print_indents(this->indent_level+1);
        print_type(this->type);
        print_indents(this->indent_level+1);
        std::cout<<no_args<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class Block : public Stmt
{
    public:
    Block(std::vector<AST*> block_stmts) : Stmt()
    {
        //std::cout<<"Creating Block Node "<<std::endl;
        this->node_type = N_BLOCK;
        for(auto stmt : block_stmts)
        {
            this->add_child(stmt);
        }
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"block:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class NullStmt: public Stmt
{
    public:
    NullStmt() : Stmt() 
    {
        //std::cout<<"Creating NullStmt Node "<<std::endl;
        this->node_type = N_NULLSTMT;
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"nullStmt"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class BreakStmt: public Stmt
{
    public:
    BreakStmt() : Stmt() 
    {
        //std::cout<<"Creating BreakStmt Node "<<std::endl;
        this->node_type = N_BREAKSTMT;
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"break:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class RetStmt: public Stmt
{
    public:
    RetStmt() : Stmt() 
    {
        //std::cout<<"Creating empty return"<<std::endl;
        this->node_type = N_RETSTMT;
        //print();
    }
    RetStmt(AST* stmt) : Stmt() 
    {
        //std::cout<<"Creating RetStmt Node "<<std::endl;
        this->node_type = N_RETSTMT;
        if(stmt != NULL)
            this->add_child(stmt);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"return:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class IfStmt: public Stmt
{
    public:
    IfStmt(AST* exp, AST* stmt) : Stmt() 
    {
        //std::cout<<"Creating IfStmt Node "<<std::endl;
        this->node_type = N_IFSTMT;
        this->add_child(exp);
        this->add_child(stmt);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"if:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class WhileStmt: public Stmt
{
    public:
    WhileStmt(AST* exp, AST* stmt) : Stmt() 
    {
        //std::cout<<"Creating WhileStmt Node "<<std::endl;
        this->node_type = N_WHILESTMT;
        this->add_child(exp);
        this->add_child(stmt);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"While:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class IfElseStmt: public Stmt
{
    public:
    IfElseStmt(AST* exp, AST* if_stmt, AST* else_stmt) : Stmt() 
    {
        //std::cout<<"Creating IfElseStmt Node "<<std::endl;
        this->node_type = N_IFELSESTMT;
        this->add_child(exp);
        this->add_child(if_stmt);
        this->add_child(else_stmt);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"ifelse:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class AssnStmt: public Stmt
{
    public:
    AssnStmt(AST* id_node, AST* exp_node) : Stmt() 
    {
        //std::cout<<"Creating AssnStmt Node "<<std::endl;
        this->node_type = N_ASSNSTMT;
        this->add_child(id_node);
        this->add_child(exp_node);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"Assignment:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class Literal: public Exp
{
    public:
    LiteralType type;
    std::string val;
    Literal(LiteralType type, std::string lexeme) : Exp(NONE) 
    {
        //std::cout<<"Creating Literal Node "<<lexeme<<std::endl;
        this->node_type = N_LITERAL;
        this->type = type;
        this->val = lexeme;
    }
    void print() override
    {
        print_indents(this->indent_level);
        switch(this->type)
        {
            case NUMBER:
            {
                std::cout<<"Number: "<< val <<std::endl;
                break;
            }
            case STRING:
            {
                std::cout<<"String: \""<< val <<"\""<<std::endl;
                break;
            }
            case FALSE:
            {
                std::cout<<"False: false"<< val <<std::endl;
                break;
            }
            case TRUE:
            {
                std::cout<<"True: true "<< val <<std::endl;
                break;
            }
            default:
            {
                break;
            }
        }
    }
};

class ArExp: public Exp
{
    public:
    ArExp(Oper op, AST* node_1, AST* node_2) : Exp(op) 
    {
        //std::cout<<"Creating ArExp Node "<<std::endl;
        this->node_type = N_AREXP;
        this->add_child(node_1);
        this->add_child(node_2);
        //print();
    }

    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<get_op_string(this->op)<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class CmpExp: public Exp
{
    public:
    CmpExp(Oper op, AST* node_1, AST* node_2) : Exp(op) 
    {
        //std::cout<<"Creating CmpExp Node "<<std::endl;
        this->node_type = N_CMPEXP;
        this->add_child(node_1);
        this->add_child(node_2);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<get_op_string(this->op)<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class CondExp: public Exp
{
    public:
    CondExp(Oper op, AST* node_1, AST* node_2) : Exp(op) 
    {
        //std::cout<<"Creating CondExp Node "<<std::endl;
        this->node_type = N_CONDEXP;
        this->add_child(node_1);
        this->add_child(node_2);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<get_op_string(this->op)<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class UnaryExp: public Exp
{
    public:
    UnaryExp(Oper op, AST* child) : Exp(op) 
    {
        //std::cout<<"Creating UnaryExp Node "<<std::endl;
        this->node_type = N_UNARYEXP;
        if(child != NULL)
        {
            this->add_child(child);
        }
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        if(this->op == SUB)
        {
            std::cout<<"Negative"<<std::endl;
        }
        else if(this->op == NOT)
        {
            std::cout<<"Not"<<std::endl;
        }
        else
        {
            std::cout<<"Unary should not reach "<<get_op_string(this->op)<<std::endl;
        }
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class Actuals: public Exp
{
    public:
    Actuals(): Exp(NONE) {}
    Actuals(std::vector<AST*> arg_list) : Exp(NONE) 
    {
        //std::cout<<"Creating Actuals Node "<<std::endl;
        this->node_type = N_ACTUALS;
        for(auto arg: arg_list)
        {
            this->add_child(arg);
        }
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"Actuals: "<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};

class FuncCall: public Exp
{
    public:
    FuncCall(AST* id_node, AST* actuals) : Exp(NONE) 
    {
        //std::cout<<"Creating FuncCall Node "<<std::endl;
        this->node_type = N_FUNCCALL;
        this->add_child(id_node);
        this->add_child(actuals);
        //print();
    }
    void print() override
    {
        print_indents(this->indent_level);
        std::cout<<"Func Call:"<<std::endl;
        for(auto c : this->children)
        {
            c->print();
        }
    }
};