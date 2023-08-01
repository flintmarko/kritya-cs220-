module veda_data
(clk,reset,write_enable,address,data_in,mode,data_out);
input mode,clk,reset,write_enable;
input [7:0]address;
input [31:0]data_in;
output reg [31:0]data_out;
//reg [31:0] dummy;
reg [31:0] memory [63:0];
integer i;
initial begin
    memory[0]=  32'd4;
    memory[4] = 32'd3;
    memory[8] = 32'd1;
    memory[12] =32'd2;
    memory[16] =32'd6;
    memory[20] =32'd5;
    memory[24] =32'd1;
    memory[28] =32'd9;
    memory[32] =32'd5;
    memory[36]=32'd10;
    memory[40] =32'd2;
    memory[44] =32'd4;
end
always@(address,data_in,write_enable,mode,reset)
begin
    if(reset)
    begin
        for(i=0;i<16;i=i+1)
        begin
            memory[i]=32'b0;
        end
        data_out=32'b0;
    end
    else
    begin
        if(mode)
        begin
            for(i=0;i<16;i++)
            begin
                memory[i]=memory[i];
            end
        end
        else
        begin
            if(write_enable)
            begin
                for(i=0;i<16;i++)
                begin
                    memory[i]=memory[i];
                end
                memory[address]=data_in;
            end
            else
            begin
                for(i=0;i<16;i++)
                begin
                    memory[i]=memory[i];
                end
            end
        end
        data_out=memory[address];
    end
end
endmodule
