# Shell Script Use for quick C++ program writing

For every new C++ program to be created, the standard procedure has always has been to make a ```program_name.cpp``` file. Then open it and add relevant header files, ```using namespace std;``` and then and ```int main()``` function with a ```return 0;``` instruction at the last. Then the file needs to be saved. Then if you are slightly experienced at competitive programming you would have learnt that it makes more sense to simply store the test-cases in a text file instead of enterring it manually in command line everytime, so you would even be creating an ```program_name_input.txt``` file to store your test-cases. And maybe even an output file to store your output for future reference. 

Upon saving, the cpp file has to be compiled using ```g++ program_name.cpp``` and then run with the input test casese using ```./a.out <program_input.txt> program_output.txt``` if you've not given a unique name to the compiled file. 

All this process is simply tedious and redundant. In online contests where rank is sometimes critically dependent on the speed at which you write the most basic programs, such things need not be done again and again. Worst case is when you would encounter a logical/runtime error in the output and then repeat the whole process all over again from compiling to running, scrambling through past commands to save time. 

A simple solution is to use a pre-designed shell script that takes care of all the repetitive work so you can focus on writing/fixing what's important without wasting time. 

I've made a simple shell script called ```caller.sh```. Ensure that your program's folder has this file with the requisite access level. And then its all just cakewalk. 
Everytime you want to create a new program, you just invoke/run the caller file using ```./caller.sh```. It will have a prompt for a name you wish to enter. Enter that and within seconds a file for the cpp-program with basic header files, shell script for compiling and running that file, input text file for the test cases and output text file for the program outputs. 

Now during coding your work has just reduced to modifying your cpp-file, saving it and then running ```./program_name```, this is a program-specific shell file that will compile and run at the same time for you. 

If you use this process over and over, your main folder will be having the ```caller.sh``` generic file and 4 files for each of the programs. Note that the program-specific shell files are added only to combine the compiling and running with input location all in one simple shell instruction

Happy coding :)

## Work till now

After a few failed iterations I've created a [shell script](https://github.com/sahiltshah98/shell/blob/master/caller.sh) that makes a C++, Input, Output and corresponding Shell script file after a user-prompt.

```bash
echo What is the name of the program?
read var

echo $'i#include <iostream>\nusing namespace std;\nint main()\n{\n\n    return 0;\n}\E:x\n' | vi ${var}.cpp
echo $'iinsert input here\E:x' | vi ${var}_input.txt
echo $'ioutput will be printed here\E:x\n' | vi ${var}_output.txt
printf "ig++ %s.cpp -o %s\n./%s < %s_input.txt > %s_output.txt\E:x\n" "$var" "$var" "$var" "$var" "$var"| vi ${var}.sh

chmod +x ${var}.sh

printf "\n\n\nCompleted creating programs: \n1. ${var}.cpp\n2. ${var}_input.txt\n3. ${var}_output.txt\n4. ${var}.sh (for compiling and running the program file)\n"
```

Note that the first echo line literally contains all the generic repetitive stuff you write in every C++ program. Feel free to modify it as per your needs. Maybe add the ```#include<bits/stdc++.h>``` or other unix/networking header files too. 

## Usage instructions

Download the [`caller.sh`](https://github.com/sahiltshah98/shell/blob/master/caller.sh) file into the target directory, then update the access level
```bash
chmod +x caller.sh
```
Note: This access level had to be done only once after download. Everytime the file is used later on, the access layer need not be fixed.

Now just directly run the file and follow on-terminal instructions:
```bash
./caller.sh
```
[Just for verification] Use the `ls` command and all the new files with the inputed `filename` shall be shown

## Usage example





## Troubleshooting

If you ever get:
```bash
sahilshah@sahil-ma cp_starter % ./caller.sh
zsh: permission denied: ./caller.sh
```
This means that you haven't changed the access-level for that file in the folder. It's pretty simple,
```bash
sahilshah@sahil-ma cp_starter % chmod +x caller.sh
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
