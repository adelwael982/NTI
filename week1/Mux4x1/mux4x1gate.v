module mux_gl (
    input a,b,c,d,
    input [1:0]sel,
    output out
);
wire out_in1,out_in2,out_in3,out_in4;
assign out_in1=a&~sel[0]&~sel[1];
assign out_in2=b&sel[0]&~sel[1];
assign out_in3=c&~sel[0]&sel[1];
assign out_in4=d&sel[0]&sel[1];

assign out = out_in1|out_in2|out_in3|out_in4;
endmodule
