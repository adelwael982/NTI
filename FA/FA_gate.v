module gate (
    input wire a,b,cin,
    output wire sum,carry
);
wire out1,out2,out3;
xor (a,b,out1);
and (a,b,out2);
xor (cin,out1,sum);
and (cin,out1,out3);
or (out3,out2,carry);
endmodule
