# Referenced from Shankar's pure C++ example
CC := g++
CXXFLAGS := -std=c++14 -Wall
EXEC := main.exe
LEX := lexer.o
TOK := token.o
PAR := parser.o
AST := ast.o
STAB := stab.o
CHECKER := checker.o
GEN := codegen.o

all: $(EXEC)

$(EXEC): main.cpp $(LEX) $(TOK) $(AST) $(PAR) $(STAB) $(CHECKER) $(GEN)
	$(CC) $(CXXFLAGS) -o $@ $^

$(LEX): lexer.cpp lexer.hpp $(TOK)
	$(CC) $(CXXFLAGS) -c $<

$(TOK): token.cpp token.hpp
	$(CC) $(CXXFLAGS) -c $<

$(PAR): parser.cpp parser.hpp
	$(CC) $(CXXFLAGS) -c $<

$(AST): ast.cpp ast.hpp
	$(CC) $(CXXFLAGS) -c $<

$(STAB): stab.cpp stab.hpp
	$(CC) $(CXXFLAGS) -c $<

$(CHECKER): checker.cpp checker.hpp
	$(CC) $(CXXFLAGS) -c $<

$(GEN): codegen.cpp codegen.hpp
	$(CC) $(CXXFLAGS) -c $<

clean: 
	rm -f $(EXEC)
	rm -f $(LEX)
	rm -f $(TOK)
	rm -f $(PAR)
	rm -f $(STAB)
	rm -f $(CHECKER)
	rm -f $(GEN)