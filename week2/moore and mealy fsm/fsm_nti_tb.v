`default_nettype none
`timescale 1ns/1ps
module fsm_nti_tb;
reg clk;
reg rst_n;
reg a;
reg b;
wire y0;
wire y1;

always #5  clk=~clk;
fsm_nti d1(
 .*
);
initial begin
   $dumpfile("dump.vcd");
   $dumpvars;
    clk=0; rst_n=0;
    a=0; b=0;
    $monitor("Input A %b   Input B %b    Output Y0 %b    Output Y1 %b   ",a,b,y0,y1);
    #10
    rst_n=1;
    #10
    a=1;
    #20
    a=0; b=1;
    #10
    a=1;
    #20
    #100 
    $stop;
end
endmodule