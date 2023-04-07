module tb;
reg clk;
golem uut (.clk(clk));

initial begin
    clk=1'b0;
    forever #10 clk=~clk;
end 
initial begin
    #10000 $finish;
end
endmodule