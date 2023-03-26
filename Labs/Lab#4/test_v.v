module marry;
reg mode,clk,reset,write_enable;
reg [4:0]address;
reg [31:0]data_in;
wire [31:0]data_out;
heart uut(.clk(clk),.reset(reset),.write_enable(write_enable),.address(address),.data_in(data_in),.mode(mode),.data_out(data_out));
initial
begin
    clk=0;
    forever begin
        #10
        clk=~clk;
    end
end
initial
begin
    reset=1'b1;
    #100
    $display(data_out);
    reset=1'b0;
    mode=1'b0;
    address=5'b10110;
    data_in=324560;
    write_enable=1'b1;
    #100
    $display(data_out);
    mode=1'b1;
    address=5'b10110;
    data_in=32493320;
    write_enable=1'b1;
    #100
    $display(data_out);
    mode=1'b0;
    address=5'b11001;
    data_in=3234360;
    write_enable=1'b0;
    #100
    $display(data_out);
    mode=1'b0;
    address=5'b11110;
    data_in=1324140;
    write_enable=1'b1;
    #100
    $display(data_out);
    mode=1'b1;
    address=5'b10110;
    data_in=2420140;
    write_enable=1'b1;
    #100
    $display(data_out);
    mode=1'b0;
    address=5'b10111;
    data_in=4901240;
    write_enable=1'b1;
    #100
    $display(data_out);
    #200
    $finish;
end
endmodule