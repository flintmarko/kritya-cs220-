module veda_Instruction
(clk,reset,write_enable,address,data_in,mode,data_out);
input mode,clk,reset,write_enable;
input [4:0]address;
input [31:0]data_in;
output reg [31:0]data_out;
reg [31:0] memory [16:0];
integer i;
initial begin
    memory[0]= 32'b00100000000000100000000000000000; // addi $t1, $zero, 0
    memory[1] = 32'b01110100010010100000000000001110; //  bge $t1, $s1, end1 where end1's relative address is 0x14
    memory[2] = 32'b00100000000000110000000000000000; // addi $t2, $zero, 0
    memory[3] = 32'b01110100011010100000000000001010; //  bge $t2, $s1, end2 where end1's relative address is 0x10
    memory[4] = 32'b00000000000000110010000010000000; // sll $t3, $t2, 2
    memory[5] = 32'b00000001001001000010100000100000; // add $t4, $s0, $t3
    memory[6] = 32'b10001100101001100000000000000000; // lw $t5, 0($t4)
    memory[7] = 32'b10001100101001110000000000000100; // lw $t6, 4($t4)
    memory[8] = 32'b10101100110001110000000000000011; // ble $t5, $t6,ifend->rel address=0x3
    memory[9] = 32'b10101000101001100000000000000100; // sw $t5, 4($t4)
    memory[10] = 32'b10101000101001110000000000000000; // sw $t6, 0($t4)
    memory[11] = 32'b00100000011000110000000000000001; // addi $t2, $t2, 1
    memory[12] = 32'b00001000000000000000000000000011; // j loop2->where PC=3
    memory[13] = 32'b00100000010000100000000000000001; // addi $t1, $t1, 1
    memory[14] = 32'b00001000000000000000000000000001; // j loop1->where PC=1
    memory[15] = 32'b00000000000000000000000000001000; // jr 
    memory[16] = 32'b11111111111111111111111111111111; // The END of the program
end
always@(address)
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
                    //
                end
            end
        end
        data_out=memory[address];
        //$display("data_out=%b",data_out);
    end
end
endmodule
