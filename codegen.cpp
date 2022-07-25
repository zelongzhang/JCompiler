#include "codegen.hpp"

static int label_counter = 0;
static int global_counter = 0;
static int func_counter = 0;
static int str_counter = 0;
static int save_counter = 0;
static int error_counter = 0;
static std::stack<std::string> while_end_labels;
static std::string main_label;
static std::string no_ret_error_label;
static std::string no_ret_len_label;
static std::string div_zero_error_label;
static std::string div_zero_len_label;
static std::string divide_zero_error;
static std::queue<std::string> available_regs;
static std::map<std::string, bool> regs_occupied;

void code_gen(AST* root)
{
    init_regs();
    reset_regs();
    gen_predef();
    gen_globals(root);
    gen_func(root);
}

std::string gen_exp(AST* exp_node)
{
    // std::cout<<"gen_exp()"<<std::endl;
    std::string dest_reg = alloc_reg();
    switch(exp_node->node_type)
    {
        case AST::N_AREXP:
        {
            ArExp* ar_node = (ArExp*)exp_node;
            // load source nodes into registers, can be Literal, ID, UnaryExp, or ArExp, or FuncCall
            AST* left_node = ar_node->children[0];
            AST* right_node = ar_node->children[1];
            std::string left_reg = load_exp_node(left_node);
            std::string right_reg = load_exp_node(right_node);
            
            switch(ar_node->op)
            {
                case AST::ADD:
                {
                    emit("\taddu " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::SUB:
                {
                    emit("\tsubu " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::MULT:
                {
                    emit("\tmul " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::DIV:
                {
                    std::string skip_label = "L" + std::to_string(label_counter++);
                    emit("\tbne " + right_reg + ",$zero," + skip_label + "\n");
                    emit_error(div_zero_error_label, div_zero_len_label);
                    emit(skip_label + ":\n");
                    emit("\tdivu " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::MOD:
                {
                    emit("\tdiv " + left_reg + "," + right_reg + "\n");
                    emit("\tmfhi " + dest_reg + "\n");
                    break;
                }
                default:
                {
                    std::cerr<<"gen_exp got a ar exp with bad operator."<<std::endl;
                    exit(1);
                }
            }
            // free the source regs, 
            free_reg(left_reg);
            free_reg(right_reg);
            break;
        }
        case AST::N_CMPEXP:
        {
            // std::cout<<"cmpexp "<<std::endl;
            CmpExp* cmp_node = (CmpExp*)exp_node;
            // load source nodes into registers, can be Literal, ID, UnaryExp, or CmpExp
            AST* left_node = cmp_node->children[0];
            AST* right_node = cmp_node->children[1];
            // std::cout<<"processing left_node "<<std::endl;
            std::string left_reg = load_exp_node(left_node);
            // std::cout<<"left_reg "<<left_reg<<std::endl;
            std::string right_reg = load_exp_node(right_node);
            // std::cout<<"right_reg "<<right_reg<<std::endl;
            
            switch(cmp_node->op)
            {
                case AST::LT:
                {
                    emit("\tslt " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::LTE:
                {
                    emit("\tsle " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::GT:
                {
                    emit("\tsgt " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::GTE:
                {
                    emit("\tsge " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::EQEQ:
                {
                    emit("\tseq " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                case AST::NOTEQ:
                {
                    // std::cout<<"noteq "<<std::endl;
                    emit("\tsne " + dest_reg + "," + left_reg + "," + right_reg + "\n");
                    break;
                }
                default:
                {
                    std::cerr<<"gen_exp got a cmp exp with bad operator."<<std::endl;
                    exit(1);
                }
            }
            // free the source regs, 
            free_reg(left_reg);
            free_reg(right_reg);
            break;
        }
        case AST::N_CONDEXP:
        {
            // std::cout<<"CONDEXP: "<<std::endl;
            // exp_node->print();
            CondExp* cond_node = (CondExp*)exp_node;
            // load source nodes into registers, can be Literal, ID, UnaryExp, or CmpExp
            AST* left_node = cond_node->children[0];
            AST* right_node = cond_node->children[1];
            std::string left_reg = load_exp_node(left_node);
            std::string right_reg = load_exp_node(right_node);
            
            switch(cond_node->op)
            {
                case AST::AND:
                {
                    // std::cout<<"handling and: left="<<left_reg<<", right="<<right_reg<<", dest="<<dest_reg<<std::endl;
                    std::string temp_reg = alloc_reg();
                    emit("\tli " + temp_reg + ",2\n");
                    std::string temp_sum = alloc_reg();
                    emit("\taddu " + temp_sum + "," + left_reg + "," + right_reg + "\n");
                    emit("\tseq " + dest_reg + "," + temp_reg + "," + temp_sum + "\n");
                    free_reg(temp_reg);
                    free_reg(temp_sum);
                    break;
                }
                case AST::OR:
                {
                    // std::cout<<"handling or: left="<<left_reg<<", right="<<right_reg<<", dest="<<dest_reg<<std::endl;  
                    std::string temp_reg = alloc_reg();
                    emit("\tli " + temp_reg + ",1\n");
                    std::string temp_sum = alloc_reg();
                    emit("\taddu " + temp_sum + "," + left_reg + "," + right_reg + "\n");
                    emit("\tsge " + dest_reg + "," + temp_sum + "," + temp_reg + "\n");
                    free_reg(temp_reg);
                    free_reg(temp_sum);
                    break;
                }
                default:
                {
                    std::cerr<<"gen_exp got a cond exp with bad operator."<<std::endl;
                    exit(1);
                }
            }
            // free the source regs, 
            free_reg(left_reg);
            free_reg(right_reg);
            break;
        }
        case AST::N_UNARYEXP:
        {
            std::string una_reg = load_una_node(exp_node);
            emit("\tmove " + dest_reg + "," + una_reg + "\n");
            free_reg(una_reg);
            break;
        }
        case AST::N_FUNCCALL:
        {
            save_args();
            gen_call(exp_node);
            load_args();
            emit("\tmove " + dest_reg + ",$v0\n");
            // std::cout<<"gen_exp func call done"<<std::endl;
            break;
        }
        case AST::N_LITERAL:
        {
            std::string lit_reg = load_literal_node(exp_node);
            emit("\tmove " + dest_reg + "," + lit_reg + "\n");
            free_reg(lit_reg);
            break;
        }
        case AST::N_ID:
        {
            std::string id_reg = load_id_node(exp_node);
            emit("\tmove " + dest_reg + "," + id_reg + "\n");
            free_reg(id_reg);
            break;
        }
        default:
        {
            break;
        }
    }
    return dest_reg;
}

std::string load_exp_node(AST* node)
{
    // std::cout<<"load_exp_node()"<<std::endl;
    std::string reg;
    switch(node->node_type)
    {
        case AST::N_LITERAL:
        {
            reg = load_literal_node(node);
            break;
        }
        case AST::N_ID:
        {
            reg = load_id_node(node);
            break;
        }
        case AST::N_UNARYEXP:
        {
            reg = load_una_node(node);
            break;
        }
        case AST::N_AREXP:
        case AST::N_CMPEXP:
        case AST::N_CONDEXP:
        {
            reg = gen_exp(node);
            break;
        }
        case AST::N_FUNCCALL:
        {
            // std::cout<<"load_node func call start"<<std::endl;
            gen_call(node);
            reg = alloc_reg();
            emit("\tmove " + reg + ",$v0\n");
            // std::cout<<"load_node func call done"<<std::endl;
            break;
        }
        case AST::N_ASSNSTMT:
        {
            // std::cout<<"loading assignment"<<std::endl;
            gen_assign(node);
            reg = alloc_reg();
            std::string id_reg = node->children[0]->stab_entry->loc;
            emit("\tmove " + reg + "," + id_reg + "\n");
            break;
        }
        default:
        {
            break;
        }
    }
    return reg;
}

std::string load_literal_node(AST* node)
{
    // std::cout<<"load_literal_node()"<<std::endl;
    std::string reg;
    switch(((Literal*)node)->type)
    {
        case AST::NUMBER:
        {
            reg = alloc_reg();
            emit("\tli " + reg + "," + ((Literal*)node)->val + "\n");
            break;
        }
        case AST::TRUE:
        {
            reg = alloc_reg();
            emit("\tli " + reg + ",1\n");
            break;
        }
        case AST::FALSE:
        {
            reg = alloc_reg();
            emit("\tli " + reg + ",0\n");
            break;
        }
        case AST::STRING:
        {
            return "";
            break;
        }
    }
    return reg;
}

std::string load_id_node(AST* node)
{
    // std::cout<<"load_id_node()"<<std::endl;
    std::string reg;
    if((node->stab_entry->loc).compare("") == 0)
    {
            std::cerr<<"Code load_id(): ID was not in a reg."<<std::endl;
            // node->print();
            exit(1);
    }
    else
    {
        reg = alloc_reg();
        if(node->stab_entry->loc.at(0) == 'G')
        {
            emit("\tlw " + reg + "," + node->stab_entry->loc + "\n");
        }
        else if(node->stab_entry->loc.at(1) == 'a')
        {
            // std::cout<<"loading argument"<<std::endl;
            // std::cout<<"var is "<<node->stab_entry->name<<std::endl;
            // std::cout<<"save_counter = "<<save_counter<<std::endl;
            if(node->stab_entry->loc.compare("$a0") == 0)
            {
                // std::cout<<"loading $a0"<<std::endl;
                emit("\tlw "+ reg + ","+ std::to_string(4 + save_counter * 4) + "($sp)\n");
            }
            else if(node->stab_entry->loc.compare("$a1") == 0)
            {
                // std::cout<<"loading $a1"<<std::endl;
                emit("\tlw "+ reg + ","+ std::to_string(8 + save_counter * 4) + "($sp)\n");
            }
            else if(node->stab_entry->loc.compare("$a2") == 0)
            {
                // std::cout<<"loading $a2"<<std::endl;
                emit("\tlw "+ reg + ","+ std::to_string(12 + save_counter * 4) + "($sp)\n");
            }
            else if(node->stab_entry->loc.compare("$a3") == 0)
            {
                // std::cout<<"loading $a3"<<std::endl;
                emit("\tlw "+ reg + ","+ std::to_string(16 + save_counter * 4) + "($sp)\n");
            }
        }
        else
        {
            emit("\tmove " + reg + "," + node->stab_entry->loc + "\n");
        }
    }
    return reg;
}

std::string load_una_node(AST* node)
{
    // std::cout<<"load_una_node()"<<std::endl;
    std::string reg;
    // count how many '-' there are
    int una_counter = 1;
    AST* child_node = node->children[0];
    while(child_node->node_type == AST::N_UNARYEXP)
    {
        una_counter++;
        child_node = child_node->children[0];
    }
    // child node should be pointing to "value" node (literal, id, expression or func call)
    if(child_node->node_type == AST::N_LITERAL)
    {
        // std::cout<<"Value is literal "<<std::endl;
        // child_node->print();
        // std::cout<<"una_counter is "<<una_counter<<std::endl;
        reg = alloc_reg();
        std::string lit_reg = load_literal_node(child_node);
        emit("\tmove " + reg + "," + lit_reg + "\n");
        free_reg(lit_reg);
        if(((UnaryExp*)node)->op == AST::SUB && una_counter % 2 != 0)
        {
            emit("\tnegu " + reg + "," + reg + "\n");
        }
        else if(((UnaryExp*)node)->op == AST::NOT && una_counter % 2 != 0)
        {
            emit("\txori " + reg + "," + reg + "," + "1\n");
        }
    }
    else if(child_node->node_type == AST::N_ID)
    {
        reg = load_id_node(child_node);
        if(una_counter % 2 != 0)
        {
            if(((UnaryExp*)node)->op == AST::SUB)
            {
                emit("\tnegu " + reg + "," + reg + "\n");
            }
            else if(((UnaryExp*)node)->op == AST::NOT)
            {
                emit("\txori " + reg + "," + reg + "," + "1\n");
            }
        }
    }
    else if(child_node->node_type == AST::N_FUNCCALL)
    {
        gen_call(child_node);
        reg = alloc_reg();
        emit("\tmove " + reg + ",$v0\n");
        if(((UnaryExp*)node)->op == AST::SUB && una_counter % 2 != 0)
        {
            emit("\tnegu " + reg + "," + reg + "\n");
        }
        else if(((UnaryExp*)node)->op == AST::NOT && una_counter % 2 != 0)
        {
            emit("\txori " + reg + "," + reg + "," + "1\n");
        }
    }
    else
    {
        reg = gen_exp(child_node);
        if(((UnaryExp*)node)->op == AST::SUB && una_counter % 2 != 0)
        {
            emit("\tnegu " + reg + "," + reg + "\n");
        }
        else if(((UnaryExp*)node)->op == AST::NOT && una_counter % 2 != 0)
        {
            emit("\txori " + reg + "," + reg + "," + "1\n");
        }
    }
    return reg;
}

void gen_if(AST* if_node)
{
    // std::cout<<"gen_if()"<<std::endl;
    std::string exp_reg = gen_exp(if_node->children[0]);
    std::string false_label = "L" + std::to_string(label_counter++);
    emit("\tbeq " + exp_reg + ",$zero," + false_label + "\n");
    // generate statements in if true case
    // post_traverse(if_node->children[1], gen_statement);
    gen_statement(if_node->children[1]);
    if(if_node->node_type == AST::N_IFSTMT)
    {  
        emit(false_label + ":\n");
    }
    else if(if_node->node_type == AST::N_IFELSESTMT)
    {
        std::string after_label = "L" + std::to_string(label_counter++);
        emit("\tj " + after_label + "\n");
        emit(false_label + ":\n");
        // generate statements in the else case
        // post_traverse(if_node->children[2], gen_statement);
        gen_statement(if_node->children[2]);
        emit(after_label + ":\n");
    }
    free_reg(exp_reg);
}

void gen_while(AST* while_node)
{
    // std::cout<<"gen_while()"<<std::endl;
    std::string top_label = "L" + std::to_string(label_counter++);
    std::string end_label = "L" + std::to_string(label_counter++);
    emit(top_label + ":\n");
    std::string exp_reg = gen_exp(while_node->children[0]);
    while_end_labels.push(end_label);
    emit("\tbeq " + exp_reg + ",$zero," + end_label + "\n");
    // generate statements in while block
    // post_traverse(while_node->children[1], gen_statement);
    gen_statement(while_node->children[1]);
    emit("\tj " + top_label + "\n");
    emit(end_label + ":\n");
    free_reg(exp_reg);
}

void gen_assign(AST* assign_node)
{
    // std::cout<<"gen_assign()"<<std::endl;
    // assign_node->print();
    AssnStmt* as_node = (AssnStmt*)assign_node;
    ID* id_node = (ID*)(as_node->children[0]);
    // std::cout<<"ID: "<<std::endl;
    // id_node->print();
    AST* exp_node = as_node->children[1];
    while(exp_node->node_type == AST::N_ASSNSTMT)
    {
        gen_assign(exp_node);
        exp_node = exp_node->children[1];
    }
    // std::cout<<"exp: "<<std::endl;
    // exp_node->print();
    std::string exp_reg = gen_exp(exp_node);
    std::string id_reg;
    if((id_node->stab_entry->loc).compare("") == 0)
    {
        id_reg = alloc_reg();
        id_node->stab_entry->loc = id_reg;
        emit("\tmove " + id_reg + "," + exp_reg + "\n");
    }
    else
    {
        // check if it's a global assignment
        if(id_node->stab_entry->loc.at(0) == 'G')
        {
            // load global var addr
            std::string addr_reg = alloc_reg();
            emit("\tla " + addr_reg + "," + id_node->stab_entry->loc + "\n");
            // save new value into global var addr
            emit("\tsw " + exp_reg + "," + "0(" + addr_reg + ")\n");
            // free registers
            free_reg(addr_reg);
        }
        // check if it's an arg
        else if(id_node->stab_entry->loc.at(1) == 'a')
        {
            if(id_node->stab_entry->loc.compare("$a0") == 0)
            {
                emit("\tsw "+ exp_reg + ","+ std::to_string(4 + save_counter * 4) + "($sp)\n");
            }
            else if(id_node->stab_entry->loc.compare("$a1") == 0)
            {
                emit("\tsw "+ exp_reg + ","+ std::to_string(8 + save_counter * 4) + "($sp)\n");
            }
            else if(id_node->stab_entry->loc.compare("$a2") == 0)
            {
                emit("\tsw "+ exp_reg + ","+ std::to_string(12 + save_counter * 4) + "($sp)\n");
            }
            else if(id_node->stab_entry->loc.compare("$a3") == 0)
            {
                emit("\tsw "+ exp_reg + ","+ std::to_string(16 + save_counter * 4) + "($sp)\n");
            }
        }
        else
        {
            id_reg = id_node->stab_entry->loc;
            // update var reg with new value
            emit("\tmove " + id_reg + "," + exp_reg + "\n");
        }
    }
    free_reg(exp_reg);
    // std::cout<<"gen_assign done"<<std::endl;
}

void gen_return(AST* ret_node)
{
    // std::cout<<"gen_return()"<<std::endl;
    if(!ret_node->children.empty())
    {
        std::string exp_reg = gen_exp(ret_node->children[0]);
        // std::cout<<"return result in "<<exp_reg<<std::endl;
        emit("\tmove $v0," + exp_reg + "\n");
        emit_epilogue();
        free_reg(exp_reg);
    }
    else
    {
        emit_epilogue();
    }
}

void gen_call(AST* call_node)
{
    // std::cout<<"gen_call()"<<std::endl;
    ID* id_node = ((ID*)(call_node->children[0]));
    std::string func_name = id_node->id;
    if(func_name.compare("printi") == 0 || func_name.compare("printc") == 0 || func_name.compare("printb") == 0)
    {
        std::string arg_reg = gen_exp(call_node->children[1]->children[0]);
        emit("\tmove $a0," + arg_reg + "\n");
        emit("\tjal L" + func_name + "\n");
        free_reg(arg_reg);
    }
    else if(func_name.compare("prints") == 0)
    {
        std::string str = ((Literal*)(call_node->children[1]->children[0]))->val;
        int str_len = str.length();
        std::string str_label = "S" + std::to_string(str_counter++);
        std::string strlen_label = str_label + "_LEN";
        emit(".data\n");
        emit(str_label + ":\n");
        emit("\t.byte  ");
        // Have to reconstruct all escapes since scanner ignored escapes
        for(int c = 0; c < int(str.length()); c++)
        {
            if(str.at(c) == '\\')
            {
                str_len--;
                switch(str.at(c+1))
                {
                    case '\'':
                    {
                        emit("39, ");
                        break;
                    }
                    case '\"':
                    {
                        emit("34, ");
                        break;
                    }
                    case '?':
                    {
                        emit("63, ");
                        break;
                    }
                    case '\\':
                    {
                        emit("92, ");
                        break;
                    }
                    case 'a':
                    {
                        emit("7, ");
                        break;
                    }
                    case 'b':
                    {
                        emit("8, ");
                        break;
                    }
                    case 'f':
                    {
                        emit("12, ");
                        break;
                    }
                    case 'r':
                    {
                        emit("13, ");
                        break;
                    }
                    case 'v':
                    {
                        emit("11, ");
                        break;
                    }
                    case 'n':
                    {
                        emit("10, ");
                        break;
                    }
                    case 't':
                    {
                        emit("9, ");
                        break;
                    } 
                    default:
                        break;
                }
                c++;
            }
            else
            {
                emit(std::to_string(int(str.at(c))) + ", ");
            }
        }
        emit("0\n");
        emit("\t.align 2\n");
        emit(strlen_label + ": .word " + std::to_string(str_len) + "\n");
        emit(".text\n");
        emit("\tla $a0," + str_label + "\n");
        emit("\tlw $a1," + strlen_label + "\n");
        emit("\tjal Lprints\n");
    }
    else if(func_name.compare("getchar") == 0 || func_name.compare("halt") == 0)
    {
        emit("\tjal L" + func_name + "\n");
    }
    else
    {
        // save all in use regs as every $t, $s are considered temp
        std::map<std::string, bool>::iterator it = regs_occupied.begin();
        std::stack<std::string> saved_regs;
        while(it != regs_occupied.end())
        {
            if(it->second)
            {
                // std::cout<<it->first<<" is occupied"<<std::endl;
                emit("\tsubu $sp,$sp,4\n");
                emit("\tsw " + it->first +",0($sp)\n");
                saved_regs.push(it->first);
                save_counter++;
            }
            it++;
        }
        std::string func_label = id_node->stab_entry->loc;
        // std::cout<<"generating call for "<<func_label<<std::endl;
        Actuals* actuals = ((Actuals*)(call_node->children[1]));
        if(!actuals->children.empty())
        {
            // std::cout<<"call has actuals "<<func_label<<std::endl;
            if(actuals->children.size() > 4)
            {
                std::cerr<<"Cannot process functions with more than 4 arguments. Exiting."<<std::endl;
                exit(1);
            }
            for(int arg_num=0; arg_num<(int)(actuals->children.size()); arg_num++)
            {
                // std::cout<<"processing arg "<<arg_num<<std::endl;
                std::string arg_reg = "$a" + std::to_string(arg_num);
                // std::cout<<"going to "<<arg_reg<<std::endl;
                std::string actual_reg = gen_exp(actuals->children[arg_num]);
                // std::cout<<"exp returned to "<<actual_reg<<std::endl;
                emit("\tmove " + arg_reg + "," + actual_reg + "\n");
                // actuals->children[arg_num]->stab_entry->loc = arg_reg;
                // std::cout<<"exp returned to "<<actual_reg<<std::endl;
                free_reg(actual_reg);
            }
        }
        emit("\tjal " + func_label + "\n");
        // load saved registers back
        while(!saved_regs.empty())
        {
            emit("\tlw " + saved_regs.top() +",0($sp)\n");
            emit("\taddu $sp,$sp,4\n");
            saved_regs.pop();
            save_counter--;
        }
    }
}

void gen_func(AST* root)
{
    // std::cout<<"gen_func()"<<std::endl;
    for(auto c: root->children)
    {
        if(c->node_type == AST::N_FUNCDECL)
        {
            reset_regs();
            std::string func_label = c->children[0]->stab_entry->loc;
            emit(func_label + ":\n");
            emit_prologue();
            // generate code from every statement in function
            // post_traverse(c, gen_statement);
            AST* block_node;
            for(auto cc : c->children)
            {
                if(cc->node_type == AST::N_BLOCK)
                {
                    block_node = cc;
                }
            }
            gen_statement(block_node);
            // std::cout<<"Finished processing block statements"<<std::endl;
            // c->print();

            if(c->children[0]->stab_entry->type.compare("void") != 0)
            {
                emit_error(no_ret_error_label, no_ret_len_label);
            }
            else
            {
                emit_epilogue();
            }
        }
    }
}

void gen_statement(AST* stmt_node)
{
    // std::cout<<"gen_statement()"<<std::endl;
    switch(stmt_node->node_type)
    {
        case AST::N_BLOCK:
        {
            Block* block_node = (Block*)stmt_node;
            for(auto stmt : block_node->children)
            {
                gen_statement(stmt);
            }
            break;
        }
        case AST::N_IFSTMT:
        case AST::N_IFELSESTMT:
        {
            gen_if(stmt_node);
            break;
        }
        case AST::N_ASSNSTMT:
        {
            gen_assign(stmt_node);
            break;
        }
        case AST::N_RETSTMT:
        {
            gen_return(stmt_node);
            break;
        }
        case AST::N_WHILESTMT:
        {
            gen_while(stmt_node);
            break;
        }
        case AST::N_FUNCCALL:
        {
            gen_call(stmt_node);
            break;
        }
        case AST::N_BREAKSTMT:
        {
            emit("\tj " + while_end_labels.top() + "\n");
            while_end_labels.pop();
            break;
        }
        case AST::N_VARDECL:
        {
            std::string local_var_reg = alloc_reg();
            ID* id_node = (ID*)(stmt_node->children[0]);
            id_node->stab_entry->loc = local_var_reg;
            emit("\tli " + local_var_reg + ",0\n");
            break;
        }
        default:
        {
            break;
        }
    }
}

void gen_globals(AST* root)
{
    // std::cout<<"gen_globals()"<<std::endl;
    emit(".data\n");
    for(auto c: root->children)
    {
        if(c->node_type == AST::N_VARDECL && ((VarDecl*)c)->global)
        {
            ID* id_node = (ID*)(c->children[0]);
            std::string var_name = id_node->id;
            std::string label = "G" + std::to_string(global_counter++) + "_" + var_name;
            id_node->stab_entry->loc = label;
            emit(label + ":\n" + "\t.word 0\n");
        }
        else if(c->node_type == AST::N_FUNCDECL)
        {
            // Assign args to $a regs
            int formal_counter = 0;
            FuncDecl* func_node = (FuncDecl*)c;
            if(!(func_node->no_args))
            {
                for(int i = 1; i < int(func_node->children.size()); i++)
                {
                    if(func_node->children[i]->node_type == AST::N_FORMAL)
                    {
                        func_node->children[i]->children[0]->stab_entry->loc = "$a" + std::to_string(formal_counter++);
                    }
                }
            }
            // emit function labels
            ID* id_node = (ID*)(func_node->children[0]);
            std::string func_name = id_node->id;
            std::string label = "F" + std::to_string(func_counter++) + "_" + func_name;
            id_node->stab_entry->loc = label;
            if(func_node->main)
            {
                main_label = label;
            }
        }
    }
    emit(".text\n");
    emit(".globl main\n");
    emit("main:\n");
    emit("\tjal " + main_label + "\n");
    emit("\tli $v0,10\n");
    emit("\tsyscall\n");
}

void gen_predef()
{
    gen_error();
    // std::cout<<"gen_predef()"<<std::endl;
    std::string data = 
        ".data\n"
        "TRUE:\n"
        "\t.byte  116, 114, 117, 101, 0\n"
        "\t.align 2\n"
        "FALSE:\n"
        "\t.byte  102, 97, 108, 115, 101, 0\n"
        "\t.align 2\n"
        "CHAR:\n"
        "\t.space 2\n"
        ".text\n";

    std::string printi = 
        "Lprinti:\n"
        "\tli $v0,1\n"
        "\tsyscall\n"
        "\tjr $ra\n";

    std::string printc = 
        "Lprintc:\n"
        "\tli $v0,11\n"
        "\tsyscall\n"
        "\tjr $ra\n";

    std::string printb = 
        "Lprintb:\n"
        "\tsubu $sp,$sp,4\n"
        "\tsw $ra,0($sp)\n"
        "\tbeq $a0,$zero,Lprintb_false\n"
        "Lprintb_true:\n"
        "\tla $a0, TRUE\n"
        "\taddi $a1, $zero, 4\n"
        "\tjal Lprints\n"
        "\tj Lprintb_exit\n"
        "Lprintb_false:\n"
        "\tla $a0, FALSE\n"
        "\taddi $a1, $zero, 5\n"
        "\tjal Lprints\n"
        "Lprintb_exit:\n"
        "\tlw $ra,0($sp)\n"
        "\taddu $sp,$sp,4\n"
        "\tjr $ra\n";

    std::string prints = 
        "Lprints:\n"
        "\tsubu $sp,$sp,16\n"
        "\tsw $ra,12($sp)\n"
        "\tsw $t0,8($sp)\n"
        "\tsw $t1,4($sp)\n"
        "\tsw $t2,0($sp)\n"
        "\tmove $t0, $a0\n"
        "\tmove $t1, $a1\n"
        "\tadd $t2, $zero, $zero\n"
        "Lprints_loop:\n"
        "\tbgt $t2,$t1,Lprints_exit\n"
        "\taddi $t2,$t2,1\n"
        "\tlb $a0, 0($t0)\n"
        "\tjal Lprintc\n"
        "\taddi $t0, 1\n"
        "\tj Lprints_loop\n"
        "Lprints_exit:\n"
        "\tlw $ra,12($sp)\n"
        "\tlw $t0,8($sp)\n"
        "\tlw $t1,4($sp)\n"
        "\tlw $t2,0($sp)\n"
        "\taddu $sp,$sp,16\n"
        "\tjr $ra\n";

    std::string getchar = 
        "Lgetchar:\n"
        "\tli $v0, 8\n"
        "\tla $a0, CHAR\n"
        "\tli $a1, 2\n"
        "\tsyscall\n"
        "\tlw $v0, CHAR\n"
        "\tbeq $v0, $zero, EOF\n"
        "\tjr $ra\n"
        "EOF:\n"
        "\tli $v0, -1\n"
        "\tjr $ra\n";

    std::string halt = 
        "Lhalt:\n"
        "\tli $v0, 10\n"
        "\tsyscall\n";

    std::string predef = data + printi + printc + printb + prints + getchar + halt;
    emit(predef);
}

void gen_error()
{
    emit(".data\n");

    std::string no_ret_msg = "Error: Function with return type did not return. Exiting...\n";
    no_ret_error_label = "NO_RET_MSG";
    no_ret_len_label = "NO_RET_LEN";
    int no_ret_len = no_ret_msg.length();
    emit(no_ret_error_label + ":\n");
    emit("\t.byte ");
    for(auto ch : no_ret_msg)
    {
        emit(std::to_string(int(ch)) + ", ");
    }
    emit("0\n");
    emit("\t.align 2\n");
    emit(no_ret_len_label + ": .word " + std::to_string(no_ret_len) + "\n");

    std::string div_zero_msg = "Error: Division by Zero. Exiting...\n";
    div_zero_error_label = "DIV_ZERO_MSG";
    div_zero_len_label = "DIV_ZERO_LEN";
    int div_zero_len = div_zero_msg.length();
    emit(div_zero_error_label + ":\n");
    emit("\t.byte ");
    for(auto ch : div_zero_msg)
    {
        emit(std::to_string(int(ch)) + ", ");
    }
    emit("0\n");
    emit("\t.align 2\n");
    emit(div_zero_len_label + ": .word " + std::to_string(div_zero_len) + "\n");

    emit(".text\n");
}

void emit_error(std::string error_msg_label, std::string error_len_label)
{
    std::string error_label = "E" + std::to_string(error_counter++);
    emit(error_label + ":\n");
    emit("\tla $a0," + error_msg_label + "\n");
    emit("\tlw $a1," + error_len_label + "\n");
    emit("\tjal Lprints\n");
    emit("\tli $a0,1\n");
    emit("\tli $v0,17\n");
    emit("\tsyscall\n");
}

std::string alloc_reg()
{
    if(available_regs.empty())
    {
        std::cerr<<"Ran out of registers, exiting."<<std::endl;
        exit(1);
    }
    std::string reg = available_regs.front();
    available_regs.pop();
    // std::cout<<"Allocating "<<reg<<std::endl;
    regs_occupied[reg] = true;
    return reg;
}

void free_reg(std::string reg)
{
    available_regs.push(reg);
    regs_occupied[reg] = false;
    // std::cout<<"freeing "<<reg<<std::endl;
}

void init_regs()
{
    available_regs.push("$t0");
    available_regs.push("$t1");
    available_regs.push("$t2");
    available_regs.push("$t3");
    available_regs.push("$t4");
    available_regs.push("$t5");
    available_regs.push("$t6");
    available_regs.push("$t7");
    available_regs.push("$t8");
    available_regs.push("$t9");
    available_regs.push("$s0");
    available_regs.push("$s1");
    available_regs.push("$s2");
    available_regs.push("$s3");
    available_regs.push("$s4");
    available_regs.push("$s5");
    available_regs.push("$s6");
    available_regs.push("$s7");
    regs_occupied.emplace("$t0", false);
    regs_occupied.emplace("$t1", false);
    regs_occupied.emplace("$t2", false);
    regs_occupied.emplace("$t3", false);
    regs_occupied.emplace("$t4", false);
    regs_occupied.emplace("$t5", false);
    regs_occupied.emplace("$t6", false);
    regs_occupied.emplace("$t7", false);
    regs_occupied.emplace("$t8", false);
    regs_occupied.emplace("$t9", false);
    regs_occupied.emplace("$s0", false);
    regs_occupied.emplace("$s1", false);
    regs_occupied.emplace("$s2", false);
    regs_occupied.emplace("$s3", false);
    regs_occupied.emplace("$s4", false);
    regs_occupied.emplace("$s5", false);
    regs_occupied.emplace("$s6", false);
    regs_occupied.emplace("$s7", false);
}

void reset_regs()
{
    // std::cout<<"resetting regs "<<std::endl;
    while(!available_regs.empty())
        available_regs.pop();
    available_regs.push("$t0");
    available_regs.push("$t1");
    available_regs.push("$t2");
    available_regs.push("$t3");
    available_regs.push("$t4");
    available_regs.push("$t5");
    available_regs.push("$t6");
    available_regs.push("$t7");
    available_regs.push("$t8");
    available_regs.push("$t9");
    available_regs.push("$s0");
    available_regs.push("$s1");
    available_regs.push("$s2");
    available_regs.push("$s3");
    available_regs.push("$s4");
    available_regs.push("$s5");
    available_regs.push("$s6");
    available_regs.push("$s7");
    regs_occupied["$t0"] = false;
    regs_occupied["$t1"] = false;
    regs_occupied["$t2"] = false;
    regs_occupied["$t3"] = false;
    regs_occupied["$t4"] = false;
    regs_occupied["$t5"] = false;
    regs_occupied["$t6"] = false;
    regs_occupied["$t7"] = false;
    regs_occupied["$t8"] = false;
    regs_occupied["$t9"] = false;
    regs_occupied["$s0"] = false;
    regs_occupied["$s1"] = false;
    regs_occupied["$s2"] = false;
    regs_occupied["$s3"] = false;
    regs_occupied["$s4"] = false;
    regs_occupied["$s5"] = false;
    regs_occupied["$s6"] = false;
    regs_occupied["$s7"] = false;
}

void emit_prologue()
{
    // assume all $t and $s are temp, $ra and all $a should be saved
    emit("\tsubu $sp,$sp,20\n");
    emit("\tsw $ra,0($sp)\n");
    emit("\tsw $a0,4($sp)\n");
    emit("\tsw $a1,8($sp)\n");
    emit("\tsw $a2,12($sp)\n");
    emit("\tsw $a3,16($sp)\n");
}

void emit_epilogue()
{
    emit("\tlw $ra,0($sp)\n");
    emit("\tlw $a0,4($sp)\n");
    emit("\tlw $a1,8($sp)\n");
    emit("\tlw $a2,12($sp)\n");
    emit("\tlw $a3,16($sp)\n");
    emit("\taddu, $sp,$sp,20\n");
    emit("\tjr $ra\n");
}

void save_args()
{
    emit("\tsubu $sp,$sp,16\n");
    emit("\tsw $a0,0($sp)\n");
    emit("\tsw $a1,4($sp)\n");
    emit("\tsw $a2,8($sp)\n");
    emit("\tsw $a3,12($sp)\n");
    save_counter += 4;
}

void load_args()
{
    emit("\tlw $a0,0($sp)\n");
    emit("\tlw $a1,4($sp)\n");
    emit("\tlw $a2,8($sp)\n");
    emit("\tlw $a3,12($sp)\n");
    emit("\taddu, $sp,$sp,16\n");
    save_counter -= 4;
}
void emit(std::string instructions)
{
   std::cout<<instructions;
//    std::cerr<<instructions;
}