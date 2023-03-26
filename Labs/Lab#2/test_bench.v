module test_hammer;
reg [15:0]a,b;
wire [15:0]sum;
wire cout;
reg clock;
Hammer #(.k(16)) uut(.a(a),.b(b),.sum(sum),.c_out(cout),.clk(clock));
initial
begin
   clock=0;
   forever #10 clock=~clock;
end
initial
begin
   a=16'b1110101010101101;
   b=16'b0101010101110101;
   #100
   $display(sum);
   $display(cout); 
   $finish;
end
endmodule