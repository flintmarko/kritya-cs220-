module Dragonfangs
#(parameter N = 32)
(clk,reset,write_enable,address,data_in,mode,data_out);
input mode,clk,reset,write_enable;
input [N-1:0]address;
input [31:0]data_in;
output reg [31:0]data_out;
reg [31:0] dummy;
reg [31:0] memory [2**N-1:0];
integer i;
always@(posedge clk)
begin
    if(reset)
    begin
        for(i=0;i<2**N;i=i+1)
        begin
            memory[i]=32'b0;
        end
        dummy=32'b0;
    end
    else
    begin
        if(mode)
        begin
            for(i=0;i<2**N;i++)
            begin
                memory[i]=memory[i];
            end
        end
        else
        begin
            if(write_enable)
            begin
                for(i=0;i<2**N;i++)
                begin
                    memory[i]=memory[i];
                end
                memory[address]=data_in;
            end
            else
            begin
                for(i=0;i<2**N;i++)
                begin
                    memory[i]=memory[i];
                end
            end
        end
        dummy=memory[address];
    end
end
always@(posedge clk)
begin
    data_out=dummy;
end
endmodule
