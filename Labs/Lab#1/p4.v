`include "p2.v"
module T2_bit_sub(a,b,c_taken,diff);
input [31:0] a,b;
output c_taken;
output [31:0] diff;
wire [31:0] carry;
full_subtr k1(a[0],b[0],1'b0,diff[0],carry[0]);
full_subtr k2(a[1],b[1],carry[0],diff[1],carry[1]);
full_subtr k3(a[2],b[2],carry[1],diff[2],carry[2]);
full_subtr k4(a[3],b[3],carry[2],diff[3],carry[3]);
full_subtr k5(a[4],b[4],carry[3],diff[4],carry[4]);
full_subtr k6(a[5],b[5],carry[4],diff[5],carry[5]);
full_subtr k7(a[6],b[6],carry[5],diff[6],carry[6]);
full_subtr k8(a[7],b[7],carry[6],diff[7],carry[7]);
full_subtr k9(a[8],b[8],carry[7],diff[8],carry[8]);
full_subtr k10(a[9],b[9],carry[8],diff[9],carry[9]);
full_subtr k11(a[10],b[10],carry[9],diff[10],carry[10]);
full_subtr k12(a[11],b[11],carry[10],diff[11],carry[11]);
full_subtr k13(a[12],b[12],carry[11],diff[12],carry[12]);
full_subtr k14(a[13],b[13],carry[12],diff[13],carry[13]);
full_subtr k15(a[14],b[14],carry[13],diff[14],carry[14]);
full_subtr k16(a[15],b[15],carry[14],diff[15],carry[15]);
full_subtr k17(a[16],b[16],carry[15],diff[16],carry[16]);
full_subtr k18(a[17],b[17],carry[16],diff[17],carry[17]);
full_subtr k19(a[18],b[18],carry[17],diff[18],carry[18]);
full_subtr k20(a[19],b[19],carry[18],diff[19],carry[19]);
full_subtr k21(a[20],b[20],carry[19],diff[20],carry[20]);
full_subtr k22(a[21],b[21],carry[20],diff[21],carry[21]);
full_subtr k23(a[22],b[22],carry[21],diff[22],carry[22]);
full_subtr k24(a[23],b[23],carry[22],diff[23],carry[23]);
full_subtr k25(a[24],b[24],carry[23],diff[24],carry[24]);
full_subtr k26(a[25],b[25],carry[24],diff[25],carry[25]);
full_subtr k27(a[26],b[26],carry[25],diff[26],carry[26]);
full_subtr k28(a[27],b[27],carry[26],diff[27],carry[27]);
full_subtr k29(a[28],b[28],carry[27],diff[28],carry[28]);
full_subtr k30(a[29],b[29],carry[28],diff[29],carry[29]);
full_subtr k31(a[30],b[30],carry[29],diff[30],carry[30]);
full_subtr k32(a[31],b[31],carry[30],diff[31],carry[31]);
assign c_taken=carry[31];
// integer i;
// always@(posedge diff[31])
// begin

//     $display("a->%b",a);
//     $display("%b->b",a);
//     $display("%diff->b",diff);
//     $display("c_out->%b",c_out);

// end
endmodule