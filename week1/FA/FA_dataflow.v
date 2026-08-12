
module gate (
    input wire a,b,cin,
    output wire sum,carry
);
assign {carry,sum}=a+b+cin;
endmodule
