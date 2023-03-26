module bencho2;
reg a,b,c_given;
wire diff,c_taken;
full_subtr uut(.a(a),.b(b),.c_given(c_given),.diff(diff),.c_taken(c_taken));
initial
begin
    a=1'b0;
    b=1'b1;
    c_given=1'b1;
    #100
    a=1'b1;
    b=1'b0;
    #100
    c_given=1'b0;
    #100
    a=1'b0;
    #100 
    $finish;
end
endmodule