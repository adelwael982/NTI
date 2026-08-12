module mux_behave (
    input a,b,c,d,
    input [1:0] sel,
    output reg out
);
always @(*) begin
    case (sel)
       'b00 : out=a;
       'b01 : out=b;
       'b10 : out=c;
       'b11 : out=d;
        default: out=a;
    endcase
end
endmodule
