`default_nettype none
`timescale 1ns/1ps
module SPG_tb;
reg clk;
reg rst_n;
reg serial;
wire parity_out;

SPG d1(
    .*
);
reg [7:0] a;
always #5 clk=~clk;
task send_bits;
input [7:0] a;
integer i;
begin
  for (i = 0 ;i<8 ;i=i+1 ) begin
  @(negedge clk)  serial=a[i];#10;
  end
end    
endtask
initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
clk=0; rst_n=0;
#10
rst_n=1;
send_bits(8'b00010010);
if (parity_out==0) begin
    $display("Test1 Passed");
end
else $display("Test1 Failed");
#10
send_bits(8'b01010100);
if (parity_out==1) begin
    $display("Test2 Passed");
end
else $display("Test2 Failed");
#100
$stop;
end


endmodule    
