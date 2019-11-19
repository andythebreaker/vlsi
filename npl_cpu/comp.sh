#!/bin/sh
#type 'd' to load default
printf "name:(without .v)"
read Name
s=${Name}".v"
t="instruction_set_model.v"
if [ "$Name" = "d" ]
 then s=${t}
fi
o=${Name}".out"
if [ -e ${o} ]
 then rm ${o}
fi
iverilog ${s} -o ${o}
vvp ${o}
printf "Good day..."
