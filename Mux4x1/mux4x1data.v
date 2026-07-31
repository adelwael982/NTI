module mux_data (
    input a,b,c,d,
    input [1:0] sel,
    output out
);
    assign out= (sel=='b00) ? a:
                (sel=='b01) ? b:
                (sel=='b10) ? c:
                (sel=='b11) ? d:a;
endmodule
