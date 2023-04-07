`include "veda.v"
`include "ALU.v"
module golem
(
    input wire clk
);
reg [31:0] zero,t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,s3,s4,s5,s6,s7,a0,a1,a2,a3,v0,v1,sp,ra;
wire [31:0] instruction;
reg [7:0] CP,dm_add;
reg dm_reset,dm_we,dm_md,im_we,im_md;
reg [31:0] dm_di,im_di;
wire [31:0] dm_do;
reg [31:0] alu_input1,alu_input2;
wire [31:0]alu_output;
reg [2:0]alu_opc;
Dragonfangs #(.N(8)) instance1(.clk(clk),.reset(1'b0),.write_enable(im_we),.address(CP),.data_in(im_di),.mode(im_md),.data_out(instruction));
Dragonfangs #(.N(8)) instance2(.clk(clk),.reset(dm_reset),.write_enable(dm_we),.address(dm_add),.data_in(dm_di),.mode(dm_md),.data_out(dm_do));
alu al(alu_input1,alu_input2,alu_output,alu_opc);
initial begin
    dm_md=1'b1;
    CP=0;
    sp=32'd255;
    zero=1'b0;
    im_we=1'b1;
    im_md=1'b0;
    im_di={6'd0,5'd1,5'd2,5'd2,6'd0};
    #100 im_md=1'b1;
end
always@(posedge clk)begin
    CP<=CP+1;
    case(instruction[31:26])
    6'd0:
        //implement add,sub,addu,subu,and,or,sll,slt,srl, ***jr***
        case(instruction[5:0])
            6'b000000:
                //implement sll
                alu_opc=3'b010;
                alu_input1=f(instruction[25:21]);
                alu_input2=f(instruction[20:16]);
                #21 
                $display(alu_output);
            6'b100000:
                //implement add
                
            6'b100001:
                //implement addu
                
            6'b100010:
                //implement sub
            6'b100011:
                //implement subu
            6'b100100:
                //implement and
            6'b100101:
                //implement or
            6'd24:
                //implement slt
            6'd2:
                //implement srl
            6'b001000:
                //implement jr   
                endcase 
        // endcase
        $display("Hey look ! we are doing Rtype");
    6'd8:
        //implement addi
        $display("Hey look ! we are doing addi ");
    6'd9:
        //implement addiu
        $display("Hey look ! we are doing addiu");
    6'd12:
        //implement andi
        $display("Hey look ! we are doing andi ");
    6'd13:
        //implement ori
        $display(" ori --> Solved // bang");
    6'd35:
        //implement lw
        $display("Hey look ! we are doing lw ");
    6'b101010:
        //implement sw
        $display("Hey look ! we are doing sw ");
    6'd4:
        //implement beq
        $display("Hey look ! we are doing beq ");
    6'd5:
        //implement bne
        $display("Hey look ! we are doing bne ");
    6'd23:
        //implement bgt
        $display("Hey look ! we are doing bgt ");
    6'd29:
        //implement bgte
        $display("Hey look ! we are doing bgte ");
    6'd41:
        //implement ble
        $display("Hey look ! we are doing ble ");
    6'd43:
        //implement bleq
        $display("Hey look ! we are doing bleq ");
    6'b000010:
        //implement j
        $display("Hey look ! we are doing j ");
    6'd3:
        //implement jal
        $display("Hey look ! we are doing jal ");
    6'd10:
        //implement slti
        $display("Hey look ! we are doing sltt ");
    endcase

    
end
endmodule