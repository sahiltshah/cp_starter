echo What is the name of the program?
read var

echo $'i#include <iostream>\nusing namespace std;\nint main()\n{\n\n    return 0;\n}\E:x\n' | vi ${var}.cpp
echo $'iinsert input here\E:x' | vi ${var}_input.txt
echo $'ioutput will be printed here\E:x\n' | vi ${var}_output.txt
printf "ig++ %s.cpp -o %s\n./%s < %s_input.txt > %s_output.txt\E:x\n" "$var" "$var" "$var" "$var" "$var"| vi ${var}.sh

chmod +x ${var}.sh

printf "\n\n\nCompleted creating programs: \n1. ${var}.cpp\n2. ${var}_input.txt\n3. ${var}_output.txt\n4. ${var}.sh (for compiling and running the program file)\n"
