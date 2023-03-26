`include "ripple_counter.v"
module machine(q, clk,reset,dir);
input clk,reset,dir;
output [3:0]q;
parameter K = 50000000;
reg [31:0]inti_counti;
reg temp_clk;
always@(negedge clk)
begin
    if(reset)
    begin
        inti_counti<=32'b0;
        temp_clk<=1'b0;
    end
    else
    begin
        if(inti_counti==K)
        begin
            inti_counti<=32'b0;
            temp_clk<=~temp_clk;
        end
        else
        begin
            inti_counti<=inti_counti+1;
        end
    end
end
ripple_carry_counter tt1(q,temp_clk,reset,dir);
endmodule
