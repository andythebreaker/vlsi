#!/bin/sh
printf "name:(without .v)"
read Name
s=${Name}".v"
t="test_bench.v"
if [ "$Name" = "t" ]
 then s=${t}
fi
o=${Name}".out"
if [ -e ${o} ]
 then rm ${o}
fi
iverilog ${s} -o ${o}
vvp ${o}
printf "Good day..."
