module testALU;
reg[31:0]inp1,inp2;
reg [2:0]opc;
wire [31:0]out;
alu uut (.inp1(inp1),.inp2(inp2),.out(out),.opc(opc));
initial begin
    inp1=32'd9669;
    inp2=32'd8989;
    opc=3'b111;
    #100 $display(out);
    inp1=32'd9669;
    inp2=32'd8989;
    opc=3'b110;
    #100 $display(out);
    inp1=32'd9669;
    inp2=32'd8989;
    opc=3'b101;
    #100 $display(out);
    inp1=32'd9669;
    inp2=32'd8989;
    opc=3'b100;
    #100 $display(out);
    inp1=32'd9669;
    inp2=32'd8989;
    opc=3'b011;
    #100 $display(out);
    inp1=32'd9669;
    inp2=32'd8989;
end
endmodule