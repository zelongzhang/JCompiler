#pragma once
#include <string.h>
#include <vector>
#include <iostream>
#include "stab.hpp"
#include "ast.hpp"
#include "token.hpp"

/*
Decorates the AST with symbol table entries linking all identifiers.
*/
void decorate_ast(AST* root);

/*
Builds the symbol table by traversing the AST.
*/
void build_stab(AST* root);

/*
Type checks by comparing nodes with symbol table entries.
*/
void check_type(AST* root);

/*
Traverses in post order starting from node with callback function post_cb.
*/
void post_traverse(AST* node, void(*post_cb)(AST*));

/*
Traverses in pre order starting from node with callback function pre_cb.
*/
void pre_traverse(AST* node, void(*pre_cb)(AST*));

/*
Traverses in pre-post order starting from node with callback function pre_post_cb.
i.e does something at the node, travels and does something at the node after traversing.
*/
void pre_post_traverse(AST* node, void(*pre_post_cb)(AST*));

/*
Opens a new scope in the scope stack. Represents start of a function.
*/
void open_stack(std::stack<Stab*>* stack, Stab* stab);

/*
Closes the top scope in the scope stack. Represents end of a function .
*/
void close_stack(std::stack<Stab*>* stack);

/*
Callback to find and link global vars and functions to symbol table entries.
*/
void cb_find_glob(AST* node);

/*
Callback to find and link all identifiers to symbol table entries.
*/
void cb_link_id(AST* node);

/*
Helper function to find a symbol table entry in a map of entries.
Returns pointer to entry if found. Null otherwise.
*/
StabEntry* find_entry(std::map<std::string, StabEntry*>* entries, std::string entry_name);

/*
Helper function to find a symbol table entry in a symbol table.
Returns pointer to entry if found. Null otherwise.
*/
StabEntry* find_entry_in_stab(Stab* stab, std::string entry_name);

/*
Helper function to find a symbol table entry in a stack of symbol tables.
Returns pointer to entry if found. Null otherwise.
*/
StabEntry* find_entry_in_stack(std::stack<Stab*>* stack, std::string entry_name);