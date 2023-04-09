`include "veda.v"
`include "alu.v"
module main_file 
(
    input wire clk
);
reg [31:0] registers [31:0];
wire [31:0] instruction;
reg [7:0] PC;
reg im_reset,im_we,im_mode;
reg [31:0] im_din;
reg dm_reset,dm_we,dm_mode;
reg [7:0]dm_add;
reg[31:0]dm_din;
wire[31:0]dm_dout;
wire [31:0]alu_output;
reg [31:0]alu_A,alu_B;
reg [3:0]alu_op;
integer i;
ALU instance0(alu_A,alu_B,alu_op,alu_output);
Dragonfangs #(.N(8)) instance1(.clk(clk),.reset(im_reset),.write_enable(im_we),.address(PC),.data_in(im_din),.mode(im_mode),.data_out(instruction));
Dragonfangs #(.N(8)) instance2(.clk(clk),.reset(dm_reset),.write_enable(dm_we),.address(dm_add),.data_in(dm_din),.mode(dm_mode),.data_out(dm_dout));
initial begin
    im_reset = 1'b1;
    dm_reset = 1'b1;
    #10
    im_reset = 1'b0;
    dm_reset = 1'b0;
    PC = 8'b0;
    im_mode = 1'b0;
    im_we = 1'b1;
    im_din = 32'b00100000000000100000000000000000; // addi $t1, $zero, 0
    PC=PC+1;
    im_din = 32'b01110100010010100000000000001110; //  bge $t1, $s1, end1 where end1's relative address is 0x14
    PC=PC+1;
    im_din = 32'b00100000000001100000000000000000; // addi $t2, $zero, 0
    PC=PC+1;
    im_din = 32'b01110100011010100000000000001010; //  bge $t2, $s1, end2 where end1's relative address is 0x10
    PC=PC+1;
    im_din = 32'b00000000000000110010000010000000; // sll $t3, $t2, 2
    PC=PC+1;
    im_din = 32'b00000001001001000010100000100000; // add $t4, $s0, $t3
    PC=PC+1;
    im_din = 32'b10001100101001100000000000000000; // lw $t5, 0($t4)
    PC=PC+1;
    im_din = 32'b10001100101001110000000000000100; // lw $t6, 4($t4)
    PC=PC+1;
    im_din = 32'b10101100110001110000000000000011; // ble $t5, $t6,ifend->rel address=0x3
    PC=PC+1;
    im_din = 32'b10101000101001100000000000000100; // sw $t5, 4($t4)
    PC=PC+1;
    im_din = 32'b10101000101001110000000000000000; // sw $t6, 0($t4)
    PC=PC+1;
    im_din = 32'b00100000011000110000000000000001; // addi $t2, $t2, 1
    PC=PC+1;
    im_din = 32'b00001000000000000000000000000011; // j loop2->where PC=3
    PC=PC+1;
    im_din = 32'b00100000010000100000000000000001; // addi $t1, $t1, 1
    PC=PC+1;
    im_din = 32'b00001000000000000000000000000001; // j loop1->where PC=1
    im_we = 1'b0;
    im_mode = 1'b1;
    PC=8'b0;
    dm_mode=1'b0;
    dm_we=1'b1;
    dm_add=32'b0;
    dm_din=32'd2;
    dm_add=32'd4;
    dm_din=32'd3;
    dm_add=32'd8;
    dm_din=32'd1;
    dm_add=32'd12;
    dm_din=32'd5;
    dm_add=32'd16;
    dm_din=32'd2;
    dm_add=32'd20;
    dm_din=32'd3;
    dm_add=32'd24;
    dm_din=32'd1;
    dm_add=32'd28;
    dm_din=32'd1;
    dm_add=32'd32;
    dm_din=32'd7;
    dm_add=32'd36;
    dm_din=32'd5;
    dm_add=32'd40;
    dm_din=32'd3;
    dm_mode=1'd1;
    dm_we=1'b0;
    dm_add=32'b0;
    registers[9]=32'b0; // la $s0, a
    registers[23]=32'd255; // for initialising stack pointer
    registers[0]=32'd0; // for initialising $zero
    registers[10]=32'd11; // li $s1, 11
end

always@(posedge clk)
    begin
        //CP<=CP+1;
        // if(CP=0)
        // begin
        //     $display("lkl")
        // end
        
        case(instruction[31:26])
        6'd0: begin
            //implement add,sub,addu,subu,and,or,sll,slt,srl, ***jr***
            case(instruction[5:0])
            6'b000000: begin
                //implement sll
                for(i=0;i<32;i=i+1)
                begin
                    registers[i]<=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b0101;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b100000:begin
                //implement add
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[25:21]];
                alu_op=4'b0001;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b100001:begin
                //implement addu
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end   
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b0001;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b100010:begin
                //implement sub
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b0010;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b100011:begin
                //implement subu
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b0010;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b100100:begin
                //implement and
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b0011;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b100101:begin
                //implement or
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b0100;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b011000:begin
                //implement slt
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b1000;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'd000010:begin
                //implement srl
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[10:6]];
                alu_op=4'b0110;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=PC+1;
            end
            6'b001000:begin
                //implement jr
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=32'b0;
                alu_B=32'b0;
                alu_op=4'b0000;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
                PC=registers[instruction[25:21]];
            end
            default : begin
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=32'b0;
                alu_B=32'b0;
                alu_op=4'b0000;
                dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=PC+1;
            end
            endcase
        end
        6'b001000: begin
        //implement addi
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=instruction[15:0];
            alu_op=4'b0001;
            registers[instruction[20:16]]=alu_output;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=PC+1;
        end
        6'b001001: begin
            //implement addiu
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=instruction[15:0];
            alu_op=4'b0001;
            registers[instruction[20:16]]=alu_output;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=PC+1;
        end
        6'b001100:begin
        //implement andi
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=instruction[15:0];
            alu_op=4'b0011;
            registers[instruction[20:16]]=alu_output;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=PC+1;
        end
        6'b001101:begin
        //implement ori
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=instruction[15:0];
            alu_op=4'b0100;
            registers[instruction[20:16]]=alu_output;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=PC+1;
        end
        6'b100011:begin
            //implement lw
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=instruction[15:0];
            alu_op=4'b0001;
            dm_add=alu_output;
            dm_mode=1'b1;
            registers[instruction[20:16]]=dm_dout;
            dm_we=dm_we;
            dm_din=dm_din;
            PC=PC+1;
        end
        6'b101010:begin
            //implement sw
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=instruction[15:0];
            alu_op=4'b0001;
            dm_add=alu_output;
            dm_mode=1'b0;
            dm_we=1'b1;
            dm_din=registers[instruction[20:16]];
            dm_mode=1'b1;
            dm_we=1'b1;
            PC=PC+1;
        end
        6'b000100:begin
            //implement beq

            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=registers[instruction[20:16]];
            alu_op=4'b0111;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=alu_output ? PC+instruction[15:0] : PC+1;
        end
        6'b000101:begin
            //implement bne
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=registers[instruction[20:16]];
            alu_op=4'b0111;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=alu_output ? PC+1 : PC+instruction[15:0];
        end
        6'b010111:begin
            //implement bgt
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[20:16]];
            alu_B=registers[instruction[25:21]];
            alu_op=4'b1000;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=alu_output ? PC+instruction[15:0] : PC+1;
        end
        6'b011101:begin
            //implement bgte
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=registers[instruction[20:16]];
            alu_op=4'b1000;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=alu_output ? PC+1 : PC+instruction[15:0];
        end
        6'd41:begin
            //implement ble
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=registers[instruction[20:16]];
            alu_op=4'b1000;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=alu_output ? PC+instruction[15:0] : PC+1;
        end
        6'b101011:begin
            //implement bleq
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=registers[instruction[20:16]];
            alu_op=4'b1001;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC=alu_output ? PC+1 : PC+instruction[15:0];
        end
        6'b000010:begin
            //implement j
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=32'b0;
            alu_B=32'b0;;
            alu_op=4'b0000;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            PC = instruction[25:0];
        end
        6'd3:begin
            //implement jal
            // ra<=CP;
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=32'b0;
            alu_B=32'b0;;
            alu_op=4'b0000;
            dm_we=1'b0;
            dm_din=32'b0;
            dm_mode=1'b1;
            dm_add=32'b0;
            registers[24]=PC+1;
            PC=instruction[25:0];
        end
        6'd10:begin
            //implement slti
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[25:21]];
                alu_B=instruction[15:0];
                alu_op=4'b1000;
                registers[instruction[20:16]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=32'b0;
                PC=PC+1;
        end
        default: begin
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=32'b0;
                alu_B=32'b0;
                alu_op=4'b0000;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=32'b0;
                PC=PC+1;
        end
        endcase
    end



endmodule