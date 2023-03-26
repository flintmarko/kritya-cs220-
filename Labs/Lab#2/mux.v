module muxxx(a,b,c,d);
parameter k=8;
input [k-1:0]a,b;
input c;
output [k-1:0]d;
assign d=c?a:b;
endmodule