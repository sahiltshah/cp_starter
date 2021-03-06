# Shell Script Use for quick C++ program writing

For every new C++ program to be created, the standard procedure has always has been to make a ```program_name.cpp``` file. Then open it and add relevant header files, ```using namespace std;``` and then and ```int main()``` function with a ```return 0;``` instruction at the last. Then the file needs to be saved. Then if you are slightly experienced, you would have learnt that it makes more sense to simply store the test-cases in a text file instead of enterring it manually in command line everytime, so you would even be creating an ```program_name_input.txt``` file to store your test-cases. And maybe even an output file to store your output for future reference. 

Upon saving, the cpp file has to be compiled using ```g++ program_name.cpp``` and then run with the input test casese using ```./a.out <program_input.txt> program_output.txt``` if you've not given a unique name to the compiled file. 

All this process is simply tedious and redundant. In online contests where rank is sometimes critically dependent on the speed at which you write the most basic programs, such things need not be done again and again. Worst case is when you would encounter a logical/runtime error in the output and then repeat the whole process all over again from compiling to running, scrambling through past commands to save time. 

A simple solution is to use a pre-designed shell script that takes care of all the repetitive work so you can focus on writing/fixing what's important without wasting time. 

I've made a simple shell script called ```caller.sh```. Ensure that your program's folder has this file with the requisite access level. And then its all just cakewalk. 
Everytime you want to create a new program, you just invoke/run the caller file using ```./caller.sh```. It will have a prompt for a name you wish to enter. Enter that and within seconds a file for the cpp-program with basic header files, shell script for compiling and running that file, input text file for the test cases and output text file for the program is created. 

Now during coding, your work has slightly reduced to modifying your cpp-file, saving it and then running ```./program_name```, this is a program-specific shell file that will compile and run at the same time for you. You don't have to manually compile it first and then run it or attach input and output files. The program-specific shell files created for each file take care of it all. Also for each program-specific script, the chmod command has already been taken care of by the outer script, so you need not bother. 

If you use this process over and over, your main folder will be having the ```caller.sh``` generic file and 4 files for each of the programs. Note that the program-specific shell files are added only to combine the compiling and running with input location all in one simple shell instruction

Happy coding :)

## Work till now

After a few failed iterations I've created a [shell script](https://github.com/sahiltshah/cp_starter/blob/master/caller.sh) that makes a C++, Input, Output and corresponding Shell script file after a user-prompt.

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

Download the [`caller.sh`](https://github.com/cp_starter/shell/blob/master/caller.sh) file into the target directory, then update the access level
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
### First-time use
```bash
sahilshah@sahil-ma Documents % cd cp
sahilshah@sahil-ma cp % ls
caller.sh
sahilshah@sahil-ma cp % chmod +x caller.sh
```
### Generic use
We input the name 'long_challenge_1' when asked in prompt ( You can use any program name as you wish)

```bash
sahilshah@sahil-ma cp % ./caller.sh
What is the name of the program?
long_challenge_1
Vim: Warning: Input is not from a terminal
Vim: Warning: Input is not from a terminal
Vim: Warning: Input is not from a terminal
Vim: Warning: Input is not from a terminal



Completed creating programs: 
1. long_challenge_1.cpp
2. long_challenge_1_input.txt
3. long_challenge_1_output.txt
4. long_challenge_1.sh (for compiling and running the program file)


sahilshah@sahil-ma cp % ls
caller.sh			long_challenge_1_input.txt
long_challenge_1.cpp		long_challenge_1_output.txt
long_challenge_1.sh
```

For all further modifications to the program, simply save the program and then run ```./long_challenge_1``` and it will compile and run again. Your output will always be stored in the ```long_challenge_1_output.txt``` and it will overwrite the old output everytime the program is run again.
Modify your input from the ```long_challenge_1_input.txt```

Note that after running `caller.sh` just wait for a few seconds and all the files will be created. 

### File examples:
#### Working screenshot

![alt text](https://github.com/sahiltshah/cp_starter/blob/master/Screenshot%202020-09-17%20at%2012.08.07%20PM.png?raw=true)

#### Program cpp file created with the header files
```vi long_challenge_1.cpp```
![alt text](https://github.com/sahiltshah/cp_starter/blob/master/program%20cpp%20file%20created.png?raw=true)

#### Program specific shell script created for compiling and running
```vi long_challenge_1.sh```
![alt text](https://github.com/sahiltshah/cp_starter/blob/master/specific%20shell%20file%20for%20each%20program%20created.png?raw=true)





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
