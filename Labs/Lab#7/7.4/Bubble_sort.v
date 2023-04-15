`include "InstructionMemory.v"
`include "DataMemory.v"
`include "alu.v"
module main_file 
(
    input wire clk
);
reg [31:0] registers [31:0]; // implementing register memory 
wire [31:0] instruction; // instruction memory output
reg [4:0] PC; // program counter
reg im_reset,im_we,im_mode; // instruction memory control signals like reset, write enable and mode
reg [31:0] im_din; // instruction memory data input (This was used to make a call for the instruction memory)
reg dm_reset,dm_we,dm_mode; // data memory control signals like reset, write enable and mode
reg [7:0]dm_add; // data memory address
reg[31:0]dm_din; // data memory data input
wire[31:0]dm_dout; // data memory data output
wire [31:0]alu_output; // ALU output
reg [31:0]alu_A,alu_B; // ALU inputs
reg [3:0]alu_op; // ALU operation
integer i; // for loop counter
ALU instance0(alu_A,alu_B,alu_op,alu_output); // ALU instance
veda_Instruction instance1(.clk(clk),.reset(im_reset),.write_enable(im_we),.address(PC),.data_in(im_din),.mode(im_mode),.data_out(instruction)); // instruction memory instance
veda_data instance2(.clk(clk),.reset(dm_reset),.write_enable(dm_we),.address(dm_add),.data_in(dm_din),.mode(dm_mode),.data_out(dm_dout)); // data memory instance
        // initial block
initial begin 
    im_reset=1'b0;
    dm_reset=1'b0;
    im_we=1'b0;
    dm_we=1'b0;
    im_mode=1'b1;
    dm_mode=1'b1;
    PC=8'b0;
    im_din=32'b0;
    dm_din=32'b0;
    dm_add=8'b0;
    registers[0]=32'b0; // $zero
    registers[23]=32'd63; // $sp
    registers[9] = 32'd0; // $s0 = address of array 
    registers[10] = 32'd11; // $s1 = size of array (= 11 in our example)
end
         // always block
always@(posedge clk)
    begin
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
                alu_B=instruction[10:6];
                alu_op=4'b0101;
                #10
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
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
                #10
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
                PC=PC+1;
            end
            6'b100001:begin
                //implement addu
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
                dm_add=8'b0;
                PC=PC+1;
            end
            6'b100010:begin
                //implement sub
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[25:21]];
                alu_op=4'b0010;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
                PC=PC+1;
            end
            6'b100011:begin
                //implement subu
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[25:21]];
                alu_op=4'b0010;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
                PC=PC+1;
            end
            6'b100100:begin
                //implement and
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[25:21]];
                alu_op=4'b0011;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
                PC=PC+1;
            end
            6'b100101:begin
                //implement or
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[25:21]];
                alu_op=4'b0100;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
                PC=PC+1;
            end
            6'b011000:begin
                //implement slt
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=registers[instruction[25:21]];
                alu_op=4'b1000;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
                PC=PC+1;
            end
            6'd000010:begin
                //implement srl
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[20:16]];
                alu_B=instruction[10:6];
                alu_op=4'b0110;
                registers[instruction[15:11]]=alu_output;
                dm_we=1'b0;
                dm_din=32'b0;
                dm_mode=1'b1;
                dm_add=8'b0;
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
                PC=PC+1;
                //printing the output only once when the program ends
                for(i=0;i<45;i=i+4)
                begin
                    dm_add=i;
                    #10
                    $display(dm_dout);
                end
                
            end
            default : begin
                for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=32'd0;
                alu_B=32'd0;
                alu_op=4'b0000;
                dm_we=1'b0;
                dm_din=32'd0;
                dm_mode=1'b1;
                dm_add=8'd0;
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
            #10
            registers[instruction[20:16]]=alu_output;
            dm_we=1'b0;
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            #10
            dm_add=alu_output;
            dm_mode=1'b1;
            #10
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
            #10
            dm_add=alu_output;
            dm_mode=1'b0;
            dm_we=1'b1;
            dm_din=registers[instruction[20:16]];
            #10
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
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            #10
            dm_we=1'b0;
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
            PC=alu_output ? PC+1 : PC+instruction[15:0];
        end
        6'b101001:begin
            //implement ble
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=registers[instruction[25:21]];
            alu_B=registers[instruction[20:16]];
            alu_op=4'b1000;
            dm_we=1'b0;
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            #10
            dm_we=1'b0;
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
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
            #10
            dm_we=1'b0;
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
            PC = instruction[25:0];
        end
        6'd000011:begin
            //implement jal
            // ra<=CP;
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
            alu_A=32'd0;
            alu_B=32'd0;;
            alu_op=4'b0000;
            dm_we=1'b0;
            dm_din=32'd0;
            dm_mode=1'b1;
            dm_add=8'd0;
            registers[24]=PC+1;
            PC=instruction[25:0];
        end
        6'b001010:begin
            //implement slti
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=registers[instruction[25:21]];
                alu_B=instruction[15:0];
                alu_op=4'b1000;
                registers[instruction[20:16]]=alu_output;
                dm_we=1'b0;
                dm_din=32'd0;
                dm_mode=1'b1;
                dm_add=8'd0;
                PC=PC+1;
        end
        default: begin
            for(i=0;i<32;i=i+1)begin
                    registers[i]=registers[i];
                end
                alu_A=32'd0;
                alu_B=32'd0;
                alu_op=4'b0000;
                dm_we=1'b0;
                dm_din=32'd0;
                dm_mode=1'b1;
                dm_add=8'd0;
                PC=PC;
        end
        endcase
    end
endmodule