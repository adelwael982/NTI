`timescale 1ns/1ns
module light_shifter_tb;
reg clk;
reg rst_n;
reg hold;
wire [3:0]s;

light_shifter c1(
    .clk(clk),
    .rst_n(rst_n),
    .hold(hold),
    .s(s)
);
always #10 clk=~clk;
initial begin
    clk=0;rst_n=0;hold=1;
    #20;
    rst_n=1;
    #1000000000;
    hold=0;
    #1000000000;
    hold=1;
   #4000000000;
    $stop;
end
endmodule
