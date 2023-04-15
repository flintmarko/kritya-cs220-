module ALU
(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [3:0] ALUop,
    output reg [31:0] ALUout
);

always @(ALUop,A,B)
begin
    case(ALUop)
        4'b0000: ALUout = 32'b0;
        4'b0001: ALUout = A+B;
        4'b0010: ALUout = A-B;
        4'b0011: ALUout = A&B;
        4'b0100: ALUout = A|B;
        4'b0101: ALUout = A<<B;
        4'b0110: ALUout = A>>B;
        4'b0111: ALUout = (A==B);
        4'b1000: ALUout = (A<B);
        4'b1001: ALUout = (A>B);
        default : ALUout = 32'b0;
    endcase
end
endmodule 
