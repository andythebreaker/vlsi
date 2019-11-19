/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
A reduced instruction set computer (RISC)
====================================
                                        +-----------------------------+
                                        | processor                   |
                                        | 12    32     5              |
     clk------------------------------->| PC |  IR  | PSR             |
                                        |                             |
    / 32bits \                          |  +---------------+\         |
   /+--------+                          |  | register      | 2^12     |
    |        |  <-[12]-address(bus)---->|  | file          |          |
2^12| memory |                          |  +---------------+/         |
    |        |  <-[32]-data(bus)------->|                             |
   \+--------+                          |  +==========+               |
                                        |  |   ALU    |               |
                                        |  +==========+               |
                                        +-----------------------------+
======================================
problem:
1*) why memory = 2^12 = reg. file = 2^12
2*) a+b=c [addr # = 3]?
3*) Condition codes  ??  Processor status register
======================================
<!--10 instructions-->
32-bit instruction register
12-bit address register
5-bit processor status register (PSR)
33-bit computation results
======================================
Instructions:
Name       Mnemonic    Opcode    Format      (inst dst, src)
NOP        NOP         0         NOP
BRANCH     BRA         1         BRA         mem, cc
LOAD       LD          2         LD          reg, mem1
STORE      STR         3         STR         mem, src
ADD        ADD         4         ADD         reg, src
MULTIPLY   MUL         5         MUL         reg, src
COMPLEMENT CMP         6         CMP         reg, src
SHIFT      SHF         7         SHF         reg, cnt
ROTATE     ROT         8         ROT         reg, cnt
HALT       HLT         9         HLT

Operand addressing:
Mem  Memory address
mem1 Memory address or immediate value
reg  Any register index
src  Any register index, or immediate value
cc   Condition code
cnt  Shift/rotate count, >0:right,<0:left,+/-32

=============================================
Instruction Format
31      28 27    24 23         12 11            0
+-----------------------------------------------+
| 4bits   |  4bits |   12bits    |    12bits    |
+-----------------------------------------------+
IR[31:28]:OPcode (max # of instructions = 2^4 = 16)
IR[27:24]: condition code  !or!
{
IR[27]:	 source type 0=reg (mem), 1=imm
IR[26]:	 destination type 0=reg (mem), 1=imm (Not valid)
}
IR[23:12]:  source address or	shift/rotate count
IR[11:0] : destination address

=============================================
Condition codes       Processor status register
A    Always           
C    Carry            PSR [0]
E    Even             PSR [1]
P    Parity           PSR [2]
Z    Zero             PSR [3]
N    Negative         PSR [4]

=============================================
Outline of the CPU Module:
module instruction_set_model;

// general definitions
// TRUE, FALSE, DEBUG-ON, etc

// parameters
// CYCLE, WIDTH, etc

// declare memory,
//    register file, ir,
//    ALU registers

// define instruction fields
// define operand types
// define opcode for each instruction
// define condition code fields
// define condition codes

// functions for ALU operands and results

// function/tasks for condition codes

// main tasks
// fetch, execution, write
// initial and always

// debugging help

endmodule

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
module instruction_set_model;

/*Declaration for instruction set model*/
// Parameter Declaration
parameter      WIDTH 	      = 32 ;
parameter      CYCLE 	      = 10 ;
parameter      ADDRSIZE       = 12 ;
parameter      MAXREGS	      = 16 ;
parameter      MEMSIZE	      = (1<<ADDRSIZE);

// Register declarations
reg [WIDTH-1:0]        MEM[0:MEMSIZE-1],
                       RFILE[0:MAXREGS-1],
                       ir,src1,src2;
reg [WIDTH:0]          result ;
reg [ADDRSIZE-1:0]     pc ;
reg [4:0]              psr;
reg                    dir;
reg                    reset;

integer                i;

initial begin
$display("===================\n%b",MEM[1]);
end

endmodule

  

  







