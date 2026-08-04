`timescale 1ns/1ns
module light_shifter_tb;
reg clk;
reg rst_n;
reg hold;
wire s;

light_shifter c1(
    .clk(clk),
    .rst_n(rst_n),
    .hold(hold),
    .s(s)
);
always #10 clk=~clk;
initial begin
    clk=0;rst_n=1;
    #1;
    rst_n=0;
    #1;
    rst_n=1;
    #2000000002;
    $stop;
end
endmodule
