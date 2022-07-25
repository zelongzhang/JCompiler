#include "checker.hpp"

static std::stack<Stab*>* scope_stack; 
static int maindecl_counter;

void decorate_ast(AST* root)
{
    //std::cout<<"Decorating..."<<std::endl;
    build_stab(root);
    check_type(root);
}

void build_stab(AST* root)
{
    std::stack<Stab*> st;
    scope_stack = &st;
    std::map<std::string, StabEntry*> predef_entries;
    predef_entries.emplace("getchar", new StabEntry("getchar", "int", ""));
    predef_entries.emplace("halt", new StabEntry("halt","void", ""));
    predef_entries.emplace("printb", new StabEntry("printb","void", "bool"));
    predef_entries.emplace("printc", new StabEntry("printc","void", "int"));
    predef_entries.emplace("printi", new StabEntry("printi","void", "int"));
    predef_entries.emplace("prints", new StabEntry("prints","void", "string"));
    Stab* predef = new Stab("predef", predef_entries);
    open_stack(scope_stack, predef);
    std::map<std::string, StabEntry*> global_entries;
    Stab* global = new Stab("global", global_entries);
    open_stack(scope_stack, global);
    maindecl_counter = 0;
    post_traverse(root, cb_find_glob);
    if(maindecl_counter == 0)
    {
        std::cerr<< "No main function defined. Exiting."<<std::endl;
        exit(1);
    }
    if(maindecl_counter > 1)
    {
        std::cerr<< "Multiple main functions defined. Exiting."<<std::endl;
        exit(1);
    }
    // global->print_tab();
    pre_post_traverse(root, cb_link_id);

}


void check_type(AST* root)
{
    return;
}

void post_traverse(AST* node, void(*post_cb)(AST*))
{
    // //std::cout<<"Begin post traversal"<<std::endl;
    for(auto c: node->children)
    {
        post_traverse(c, post_cb);
    }
    post_cb(node);
}

void pre_traverse(AST* node, void(*pre_cb)(AST*))
{
    pre_cb(node);
    for(auto c: node->children)
    {
        pre_traverse(c, pre_cb);
    }
}

void pre_post_traverse(AST* node, void(*pre_post_cb)(AST*))
{
    pre_post_cb(node);
    for(auto c: node->children)
    {
        pre_post_traverse(c, pre_post_cb);
    }
    pre_post_cb(node);
}

void open_stack(std::stack<Stab*>* stack, Stab* stab)
{
    stack->push(stab);
}

void close_stack(std::stack<Stab*>* stack)
{
    stack->pop();
}

void cb_find_glob(AST* node)
{
    // //std::cout<<"glob cb"<<std::endl;
    std::map<std::string, StabEntry*>* glob_entries = &(scope_stack->top()->entries);
    switch(node->node_type)
    {
        case AST::N_FUNCDECL:
        {
            // //std::cout<<"Found funcdecl"<<std::endl;
            // node->print();

            std::string func_sig = "";
            std::string func_name;
            std::string ret_type;

            // check if main declaration
            if(((FuncDecl*)node)->main == true)
            {
                maindecl_counter++;
            }

            // get return type of function
            if(((FuncDecl*)node)->type == Token::T_INT)
            {
                ret_type = "int";
            }
            else if(((FuncDecl*)node)->type == Token::T_BOOL)
            {
                ret_type = "bool";
            }
            else if(((FuncDecl*)node)->type == Token::T_VOID)
            {
                ret_type = "void";
            }

            // get formal sig and name of function from children
            for(AST* c : node->children)
            {
                if(c->node_type == AST::N_FORMAL)
                {
                    // //std::cout<<"Found formal"<<std::endl;

                    if(((Formal*)c)->type == Token::T_INT)
                    {
                        func_sig = func_sig + "int";
                    }
                    else if(((Formal*)c)->type == Token::T_BOOL)
                    {
                        func_sig = func_sig + "bool";
                    }
                }
                else if(c->node_type == AST::N_FORMAL_EMPTY)
                {
                    // //std::cout<<"Found empty formal"<<std::endl;
                }
                else if(c->node_type == AST::N_ID)
                {
                    // //std::cout<<"Found ID"<<std::endl;
                    func_name = ((ID*)c)->id;
                    // check if already defined
                    Stab* glob = scope_stack->top();
                    if(find_entry_in_stab(glob, func_name) != NULL)
                    {
                        std::cerr<<"Multiple instances of "<<func_name<<" are defined. Exiting."<<std::endl;
                        exit(1);
                    }
                }
            }
            // Put function into global stab
            StabEntry* globl_entry = new StabEntry(func_name, ret_type, func_sig);
            glob_entries->emplace(func_name, globl_entry);
            break;
        }
        case AST::N_VARDECL:
        {
            // check if this is a global var
            if(((VarDecl*)node)->global == false)
                break;
            // check if this has already been linked
            if(node->stab_entry != NULL)
                break;
            // //std::cout<<"Found vardecl"<<std::endl;
            // node->print();
            std::string var_sig = "";
            std::string var_name;
            std::string var_type;

            // get type of var
            if(((VarDecl*)node)->type == Token::T_INT)
            {
                var_type = "int";
            }
            else if(((VarDecl*)node)->type == Token::T_BOOL)
            {
                var_type = "bool";
            }

            // get name of var
            for(AST* c : node->children)
            {
                if(c->node_type == AST::N_ID)
                {
                    // //std::cout<<"Found var ID"<<std::endl;
                    var_name = ((ID*)c)->id;
                    // Put var into global stab
                    if(find_entry(glob_entries, var_name) != NULL)
                    { 
                        std::cerr<<"Multiple definitions of "<<var_name<<" in global scope. Exiting."<<std::endl;
                        exit(1);
                    }
                    StabEntry* globl_entry = new StabEntry(var_name, var_type, var_sig);
                    glob_entries->emplace(var_name, globl_entry);
                    ((ID*)c)->stab_entry = globl_entry;
                }
            }
            break;
        }

        default:
        {
            break;
        }
    }
}

void cb_link_id(AST* node)
{
    //std::cout<<"cb_link_id: "<<node->node_type<<std::endl;
    // node->print();
    switch(node->node_type)
    {
        case AST::N_FUNCDECL: // function begins or ends
        {
            //std::cout<<"cb_link_id: funcdecl: ";
            std::string func_name = ((ID*)(node->children[0]))->id;
            std::string scope_name = scope_stack->top()->scope_name;
            //std::cout<<func_name<<std::endl;
            // if no match, it is a new scope, 
            // if match, the scope must be closing
            if(func_name.compare(scope_name) != 0)
            {
                //std::cout<<"opening scope "<<func_name<<std::endl;
                std::map<std::string, StabEntry*> scope_entries; 
                Stab* scope_stab = new Stab(func_name, scope_entries);
                open_stack(scope_stack, scope_stab);
                Stab* top_stab = scope_stack->top();
                //std::cout<<"top stab is "<<top_stab->scope_name<<std::endl;

                // add any formals as local var
                // stab is empty, so no need to search, just add
                for(AST* c : node->children)
                {
                    if(c->node_type == AST::N_FORMAL)
                    {
                        ID* id_node = ((ID*)(c->children[0]));
                        std::string formal_sig = "";
                        std::string formal_name = id_node->id;
                        std::string formal_type;
                        if(((Formal*)c)->type == Token::T_INT)
                        {
                            formal_type = "int";
                        }
                        else if(((Formal*)c)->type == Token::T_BOOL)
                        {
                            formal_type = "bool";
                        }
                        StabEntry* formal_entry = new StabEntry(formal_name, formal_type, formal_sig);
                        top_stab->entries.emplace(formal_name, formal_entry);
                        id_node->stab_entry = formal_entry;
                        //std::cout<<"added formal to "<<top_stab->scope_name<<std::endl;
                        // top_stab->print_tab();
                    }
                }
            }
            else
            {
                //std::cout<<"closing scope "<<scope_name<<std::endl;
                close_stack(scope_stack);
                // Stab* top_stab = scope_stack->top();
                //std::cout<<"top stab is "<<top_stab->scope_name<<std::endl;
            }
            break;
        }
        case AST::N_VARDECL: // local var declarations
        {
            //std::cout<<"VarDecl"<<std::endl;
            // check if this is a global var
            if(((VarDecl*)node)->global == true)
            {
                //std::cout<<"this is a global var, breaking"<<std::endl;
                break;
            }
            // check if this has already been linked

            //std::cout<<"found local var: ";
            std::string var_sig = "";
            std::string var_name;
            std::string var_type;

            // get type of var
            if(((VarDecl*)node)->type == Token::T_INT)
            {
                var_type = "int";
            }
            else if(((VarDecl*)node)->type == Token::T_BOOL)
            {
                var_type = "bool";
            }
            //std::cout<<"var is of type "<<var_type<<std::endl;

            // get ID of var, link it to stab entry
            for(AST* c : node->children)
            {
                if(c->node_type == AST::N_ID)
                {
                    //std::cout<<"found the id node "<<std::endl;
                    // c->print();
                    if(c->stab_entry != NULL)
                    {
                        //std::cout<<"this already has a link "<<std::endl;
                        // c->stab_entry->print_entry();
                        break;
                    }
                    else
                    {
                        // //std::cout<<"Found var ID"<<std::endl;
                        var_name = ((ID*)c)->id;
                        //std::cout<<"var name is "<<var_name<<std::endl;
                        // Put var into scope stab
                        std::map<std::string, StabEntry*>* scope_entries = &(scope_stack->top()->entries);
                        // Stab* top_stab = scope_stack->top();
                        //std::cout<<"top stab is "<<top_stab->scope_name<<std::endl;
                        if(find_entry(scope_entries, var_name) != NULL)
                        { 
                            std::cerr<<"Multiple definitions of "<<var_name<<" in scope of "<<scope_stack->top()->scope_name<<". Exiting."<<std::endl;
                            exit(1);
                        }

                        //std::cout<<"creating entry "<<std::endl;
                        StabEntry* scope_entry = new StabEntry(var_name, var_type, var_sig);
                        // scope_entry->print_entry();
                        scope_entries->emplace(var_name, scope_entry);
                        c->stab_entry = scope_entry;
                        break;
                    }
                }
            }
            break;
        }
        case AST::N_ID: // All identifiers should be inside one of the stabs in the scope stack
        {
            if(node->stab_entry != NULL)
                break;
            std::string id_name = ((ID*)node)->id;
            StabEntry* id_entry = find_entry_in_stack(scope_stack, id_name);
            if(id_entry == NULL)
            {
                std::cerr<<"The identifier '"<<id_name<<"' is undefined. Exiting."<<std::endl;
                exit(1);
            }
            node->stab_entry = id_entry;
            break;
        }
        default:
        {
            break;
        }
    }
}

StabEntry* find_entry(std::map<std::string, StabEntry*>* entries, std::string entry_name)
{
    if (entries->find(entry_name) == entries->end()) 
    {
        return NULL;
    } 
    else 
    {
        return entries->at(entry_name);
    }
}

StabEntry* find_entry_in_stab(Stab* stab, std::string entry_name)
{   
    return find_entry(&(stab->entries), entry_name);
}

StabEntry* find_entry_in_stack(std::stack<Stab*>* stack, std::string entry_name)
{
    //std::cout<<"Finding entry in stack"<<std::endl;
    std::stack<Stab*> holding_stack;
    Stab* top_stab;
    StabEntry* res = NULL;
    while(res == NULL && !stack->empty())
    {
        top_stab = stack->top();
        res = find_entry_in_stab(top_stab, entry_name);
        if(res != NULL)
        {
            //std::cout<<"entry found in "<<top_stab->scope_name<<std::endl;
            break;
        }
        holding_stack.push(top_stab);
        //std::cout<<"popping "<<top_stab->scope_name<<std::endl;
        stack->pop();
    }

    while(!holding_stack.empty())
    {
        //std::cout<<"pushing "<<holding_stack.top()->scope_name<<std::endl;
        stack->push(holding_stack.top());
        holding_stack.pop();
    }
    return res;
}
