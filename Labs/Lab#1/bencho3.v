module bencho3;
reg [31:0]a,b;
wire [31:0]sum;
wire c_out;
T2_bit_adder uut(.a(a),.b(b),.c_out(c_out),.sum(sum));
initial 
begin
    a=32'd69;
    b=32'd91;
    #100
    $display(sum);
    a=32'd89;
    b=32'd98;
    #100
    $display(sum);
    a=32'd76;
    b=32'd94;
    #100
    $display(sum); 
    $finish;
end
endmodule
