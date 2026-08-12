`timescale 1ps/1ps
module gray_to_binary_tb;
parameter bits = 4;
reg [bits-1:0]gray;
wire [bits-1:0]binary;

gray_to_binary #(.bits(bits)) d1(
    .binary(binary),
    .gray(gray)
);

initial begin
    $dumpfile("gray_to_binary.vcd");
    $dumpvars;

gray='b1100;
#10
if (binary=='b1000) begin
    $display("Test1 Pass");
end
else 
   $display("Test1 Fail");

gray='b0100;
#10
if (binary=='b0111) begin
    $display("Test2 Pass");
end
else 
   $display("Test2 Fail");

gray='b0011;
#10
if (binary=='b0010) begin
    $display("Test3 Pass");
end
else 
   $display("Test3 Fail");  

gray='b1001;
#10
if (binary=='b1110) begin
    $display("Test4 Pass");
end
else 
   $display("Test4 Fail"); 

   #100;
   $stop;
end
endmodule
