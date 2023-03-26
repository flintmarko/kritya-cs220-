module full_subtr(a,b,c_given,diff,c_taken);
input a,b,c_given;
output diff,c_taken;
wire t1,t2,t3,t4,t5,t6;
xor(t1,a,b);
xor(diff,c_given,t1);
not(t2,a);
and(t3,t2,c_given);
and(t4,t2,b);
and(t5,c_given,b);
or(t6,t3,t4);
or(c_taken,t6,t5);
// always@*
// begin
//     $display(diff,c_taken);
// end
endmodule
