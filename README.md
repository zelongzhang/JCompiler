# J-- Compiler

## About
University of Calgary CPSC 411 Project.

### Required Software
The following software are neccesary to build and run:
```
g++
```

### Building
In the directory of the makefile, build with
```
make
```

### Running
To run the lexer with a test file, run the following command in the same directory as main.exe:
```
./main.exe -scanner test_file
```
To run the parser with a teset file, run the following command in the same directory as main.exe:
```
./main.exe -parse test_file
```
To generate code to std::cout, run the following command in the same directory as main.exe:
```
./main.exe -code test_file
```

### Output
The generated outputs of 17/21 of the test files can be found in the output directory.