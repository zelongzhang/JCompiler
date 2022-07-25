# J-- Compiler Test Output
Each .s MIPS assembly file was generated using 
```
./main.exe -code test_file
```
Each .s file corresponds to a test file of the same name  
i.e gen.t1.s is generated from gen.t1

Each .out file is the piped output generated by calling
```
./spim -f *.s > *.out
```
using the spim executable from ~aycock/411/bin

Some test files require input (gen.t13 and gen.t33)  
their respective input files are screenshots of the console  
named gen.t13.input and gen.t33.input.