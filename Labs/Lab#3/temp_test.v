module test;
reg clk,reset,dir;
wire [3:0] out;
machine #(.K(10)) uut (.q(out),.clk(clk),.reset(reset),.dir(dir));
initial 
begin
    clk =0;
    forever begin
        #1 clk = ~clk;
    end
end
initial 
begin
    $monitor(out);
    dir =1;
    reset = 1;
    #100;
    reset =0;
    #100;
    dir=0;
    #100;
    dir=1;
    #100 $finish;
end
endmodule