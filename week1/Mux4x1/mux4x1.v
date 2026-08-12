module muxbig (
    input a,b,c,d,
    input [1:0] sel,
    output out

);
wire out_in1,out_in2;
muxsmall d1(
    .a(a),
    .b(b),
    .sel(sel[0]),
    .out(out_in1)
);
muxsmall d2(
    .a(c),
    .b(d),
    .sel(sel[0]),
    .out(out_in2)
);
muxsmall d3(
    .a(out_in1),
    .b(out_in2),
    .sel(sel[1]),
    .out(out)
);
endmodule
