module decoder_lab #(
    parameter in=2
) (
    input [in-1:0] a,
    input enable,
    output reg [(1<<in)-1:0] f 
);
always @(*) begin
    f='b0;
if (enable) begin
    f[a]=1;
end
else
f='b0;
end
endmodule
