module me(clk);
input clk;
reg a,b,c;
initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
end
always@(clk)begin
    c=1'b1;
    a<=c;
    b=c;
    $display(a,b,c);
end
endmodule