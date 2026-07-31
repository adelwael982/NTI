module muxsmall (
    input a,b,sel,
    output out
);
assign out= sel ? a:b;
endmodule
