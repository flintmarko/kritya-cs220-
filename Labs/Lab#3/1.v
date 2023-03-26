`include "2.v"
module rcc(clk,reset,q);
input wire clk,reset;
output wire [3:0]q;
wire [3:0]r_reg;
DFF instance1 (q+1,clk,reset,r_reg);
// always@(negedge clk, posedge reset)
//     if(reset)
//         r_reg<=0;
//     else 
//         r_reg<=r_reg+1;
assign q=r_reg;
endmodule