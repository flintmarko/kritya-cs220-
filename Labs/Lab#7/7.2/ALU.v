module alu(inp1,inp2,out,opc);
input [31:0]inp1,inp2;
output [31:0]out;
input [2:0]opc;
assign out = opc[2]?(opc[1]?(opc[0]?inp1+inp2:inp1+ ~inp2 +1):(opc[0]?inp1-inp2:inp1&inp2)):(opc[1]?(opc[0]?inp1|inp2:inp1<<inp2):(opc[0]?inp1>>inp2:inp1));
endmodule