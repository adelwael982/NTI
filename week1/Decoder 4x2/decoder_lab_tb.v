`timescale 1ns/1ps
module decode_tb;
parameter in = 2;
reg [in-1:0] a;
reg enable;
wire [(1<<in)-1:0] f ;

decoder_lab_shift #(.in(in)) d1(
.a(a),
.enable(enable),
.f(f)

);
initial begin
$dumpfile("decoder_lab.vcd");
$dumpvars;
enable=0;a='b0;
#10;
if (f=='b0) begin
    $display ("test_pass : Not Enabled");
end
else
$display ("test_fail : Not Enabled");
#10;
enable=1;
#10;
if (f=='b0001) begin
    $display ("test_pass : Selection0");
end
else
$display ("test_fail : Selection0");
#10;
a='b01;enable=1;
#10;
if (f=='b0010) begin
    $display ("test_pass : Selection1");
end
else
$display ("test_fail : Selection1");
#10;
a='b10;enable=1;
#10;
if (f=='b0100) begin
    $display ("test_pass : Selection2");
end
else
$display ("test_fail : Selection2");
#10;
a=11;enable=1;
#10;
if (f=='b1000) begin
    $display ("test_pass : Selection3");
end
else
$display ("test_fail : Selection3");
#100;
$stop;
end

endmodule