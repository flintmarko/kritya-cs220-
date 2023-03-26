module float_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);

wire [31:0] mantissa_a = a[22:0];
wire [31:0] mantissa_b = b[22:0];
wire [7:0] exp_a = a[30:23];
wire [7:0] exp_b = b[30:23];
wire sign_a = a[31];
wire sign_b = b[31];

wire [31:0] mantissa_sum;
wire [7:0] exp_sum;
wire sign_sum;

assign {sign_sum, exp_sum, mantissa_sum} = (sign_a == sign_b) ? 
                                           (exp_a > exp_b ? 
                                              {exp_a, mantissa_a} + {7'b0, exp_a-exp_b, mantissa_b} :
                                               {exp_b, mantissa_b} + {7'b0, exp_b-exp_a, mantissa_a}) :
                                           (exp_a > exp_b ? 
                                               {sign_a, exp_a, mantissa_a} - {7'b0, exp_a-exp_b, mantissa_b} :
                                               {sign_b, exp_b, mantissa_b} - {7'b0, exp_b-exp_a, mantissa_a});

assign result = {sign_sum, exp_sum, mantissa_sum};

endmodule