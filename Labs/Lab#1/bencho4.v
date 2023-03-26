module bencho3;
reg [31:0]a,b;
wire [31:0]diff;
wire c_taken;
T2_bit_sub uut(.a(a),.b(b),.c_taken(c_taken),.diff(diff));
initial 
begin
    a=32'd96;
    b=32'd91;
    #100
    $display(diff);
    a=32'd101;
    b=32'd98;
    #100
    $display(diff);
    a=32'd199;
    b=32'd94;
    #100
    $display(diff); 
    $finish;
end
endmodule
