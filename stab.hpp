#pragma once
#include <string.h>
#include <vector>
#include <iostream>
#include <stack>
#include <map>

class StabEntry
{
    public:
    std::string name;
    std::string type;
    std::string sig;
    std::string loc;

    StabEntry(std::string name, std::string type, std::string sig)
    {
        this->name = name;
        this->type = type;
        this->sig = sig;
        this->loc = "";
    }

    void print_entry()
    {
        std::cout<<"(Stab entry: "<<this<<", name="<<this->name<<", type="<<this->type<<", sig="<<this->sig<<", loc="<<loc<<")"<<std::endl;
    }
};

class Stab
{
    public:
    std::string scope_name;
    std::map<std::string, StabEntry*> entries;
    Stab(std::string scope_name, std::map<std::string, StabEntry*> entries)
    {
        this->scope_name = scope_name;
        this->entries = entries;
    }
    void print_tab()
    {
        std::cout<<"Stab "<<this->scope_name<<std::endl;
        for(const auto& e : this->entries)
        {
            std::cout<<"name: "<<e.first<<", ";
            e.second->print_entry();
        }
    }
};