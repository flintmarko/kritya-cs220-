module DFF(d,clk,reset,q);
input wire clk,reset;
input wire [3:0]d;
output reg [3:0]q;
always@(negedge clk, posedge reset)
    if(reset)
        q<=0;
    else 
        q<=d;
endmodule