`include "Ripple.v"
`include "mux.v"
module Hammer(a,b,sum,c_out,clk);
parameter k=16;
input  [k-1:0] a,b;
input clk;
output reg [k-1:0] sum;
output reg c_out;
wire c1,c0,c,temp_cout;
wire [k-1:0] Tsum;
wire [k-1:0]temp_sum;
ripple_carry_adder #(.k(k/2))o1(a[k/2-1:0],b[k/2-1:0],1'b0,Tsum[k/2-1:0],c,clk);
ripple_carry_adder #(.k(k/2))o2(a[k-1:k/2],b[k-1:k/2],1'b1,temp_sum[k-1:k/2],c1,clk);
ripple_carry_adder #(.k(k/2))o3(a[k-1:k/2],b[k-1:k/2],1'b0,temp_sum[k/2-1:0],c0,clk);
muxxx #(.k(k/2))o4(temp_sum[k-1:k/2],temp_sum[k/2-1:0],c,Tsum[k-1:k/2]);
muxxx #(.k(1))o5(c1,c0,c,temp_cout);
always@(posedge clk)
begin
    sum=Tsum;
    c_out=temp_cout;
end
endmodule

