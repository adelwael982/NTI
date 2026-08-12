module decoder_lab_shift #(
    parameter in=2
) (
    input [in-1:0] a,
    input enable,
    output wire [(1<<in)-1:0] f 
);
assign f = (enable) ? (1<<a):'b0;
endmodule

