module bencho1;
reg a,b,c;
wire c_out,sum;
full_adder uut(.a(a),.b(b),.c_in(c),.c_out(c_out),.sum(sum));
initial 
begin
    a=1'b0;
    b=1'b1;
    c=1'b1;
    #100
    a=1'b1;
    b=1'b0;
    #100
    c=1'b0;
    #100
    a=1'b0;
    #100 
    $finish;    
end
endmodule