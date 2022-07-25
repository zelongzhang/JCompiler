#pragma once
#include <string.h>
#include <vector>
#include <iostream>
#include <queue>
#include "ast.hpp"
#include "stab.hpp"
#include "checker.hpp"

/*
Generate code by traversing through AST tree.
*/
void code_gen(AST* root);

/*
Emits assembly instruction to output stream.
*/
void emit(std::string instructions);

/*
Allocates an available register from $t and $s registers.
In this application, assuming all $t and $s are temporary.
*/
std::string alloc_reg();

/*
Frees a used register.
*/
void free_reg(std::string reg);

/*
Initializes register data structures.
*/
void init_regs();

/*
Resets register data structures.
*/
void reset_regs();

/*
Generates predefined functions and globals.
Includes halt, getchar, all print functions and run time error messages.
*/
void gen_predef();

/*
Generates global variable code.
Also assigns labels for all declared functions.
*/
void gen_globals(AST* root);

/*
Generates error code for runtime errors.
*/
void gen_error();

/*
Generates code for a function.
Root should be the FuncDecl node.
*/
void gen_func(AST* root);

/*
Generates code for an expression recursively.
Returns name of register holding the result of expression.
*/
std::string gen_exp(AST* exp_node);

/*
Loads an expression node into a register.
Returns the register holding the expression result.
*/
std::string load_exp_node(AST* node);

/*
Loads an unary node into a register.
Returns the register holding the unary value.
*/
std::string load_una_node(AST* node);

/*
Loads an ID node into a register.
Returns the register holding the ID value.
*/
std::string load_id_node(AST* node);

/*
Loads a literal node into a register.
Returns the register holding the literal value.
*/
std::string load_literal_node(AST* node);

/*
Generates code for a statement recursively since statment could also be a block.
*/
void gen_statement(AST* call_node);

/*
Generates code for a if or if else.
*/
void gen_if(AST* if_node);

/*
Generates code for a while loop with or without breaks.
*/
void gen_while(AST* while_node);

/*
Generates code for an assignment statement recursively.
*/
void gen_assign(AST* assign_node);

/*
Generates code for a return statement.
*/
void gen_return(AST* ret_node);

/*
Generates code for a function call including predefined ones.
*/
void gen_call(AST* call_node);

/*
Saves $a argument registers before calling a function since they are volatile.
*/
void save_args();

/*
Loads $a argument registers back after returning from a function call.
*/
void load_args();

/*
Emits prologue to save $ra and all $a registers at start of functions.
*/
void emit_prologue();

/*
Emits epilogue to load $ra and all $a registers at end of functions.
*/
void emit_epilogue();

/*
Emits error jump instruction if a run time error is possible.
*/
void emit_error(std::string error_msg_label, std::string error_len_label);