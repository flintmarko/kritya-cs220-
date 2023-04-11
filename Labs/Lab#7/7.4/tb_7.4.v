module tb;
reg clk;
main_file uut (.clk(clk));

initial begin
    clk=1'b0;
    forever #50 clk=~clk;
end 
initial begin
    #(108000) $finish;
end
endmodule