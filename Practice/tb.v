module myself;
reg clk;
me uut(.clk(clk));
initial begin
    clk=0;
    forever begin
        #10
        clk=~clk;
    end
end
initial begin
    #100 $finish;
end
endmodule