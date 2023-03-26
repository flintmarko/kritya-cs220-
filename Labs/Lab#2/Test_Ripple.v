module test_Ripple;
reg [15:0]a,b;
wire [15:0]sum;
wire cout;
reg c_in,clock;
ripple_carry_adder #(.k(16)) uut(.a(a),.b(b),.c_in(c_in),.Tsum(sum),.Tc_out(cout),.clk(clock));

initial begin
   clock=0;
   forever #10 clock=~clock;
end

initial
begin
   a=16'b1110101010101101;
   b=16'b0101010101110101;
   c_in=1'b0;
   #100
   $display(sum);
   $display(cout); 
   $finish;
end
endmodule