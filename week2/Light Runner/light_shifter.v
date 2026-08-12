`default_nettype none
module light_shifter (
    input wire clk,rst_n,hold,
    output wire [3:0]s
); wire clk_two;
light sr(
    .clk(clk_two),
    .rst_n(rst_n),
    .hold(hold),
    .s(s)
);
  clk_divider clock(
    .clk(clk),
    .rst_n(rst_n),
    .clk_two(clk_two)
  );  
endmodule
