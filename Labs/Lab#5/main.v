`include "valentine.v"
`include "CAdder.v"
module implement(input wire clk,output reg led);
reg reset,write_enable,mode;
reg [4:0]add_1,add_2,add_3;
reg [31:0]in_1,in_2,in_3;
wire [31:0]out_1,out_2,out_3;
heart o1 (clk,reset,write_enable,add_1,in_1,mode,out_1);
heart o2 (clk,reset,write_enable,add_2,in_2,mode,out_2);
heart o3 (clk,reset,write_enable,add_3,in_3,mode,out_3);
initial begin
    reset<=1'b0;
    write_enable<=1'b1;
    mode<=1'b0;
    add_1=5'b10110;
    in_1=32'b0 10101001 01000010101001000101011;
    add_2=5'b11100;
    in_2=32'b0 10111101 01011111010100101010110;
    add_3=5'b11111;
    in_3=32'b01011110101011111010100101100000;
end
reg [31:0]a,b,c;
always@(posedge clk)begin
    mode<=1'b1;
    a<=out_1;
    b<=out_2;
    c<=out_3;
end
wire [31:0]temp;
fp_adder k1 (a[31],b[31],a[30:23],b[30:23],a[22:0],b[22:0],temp[31],temp[30:23],temp[22:0]);
always@(posedge clk)begin
    if(temp==c)begin
        led=1'b1;
    end
    else begin
        led=1'b0;
    end
end
endmodule