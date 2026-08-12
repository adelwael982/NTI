`default_nettype none
`timescale 1ns/1ps
module sequence_tb;
reg data;
reg clk;
reg rst_n;
wire out;

non_moore m1(
.*
);

non_mealy m2(
    .*
);

over_moore m3(
    .*
);

over_mealy m4(
    .*
);
always #5 clk=~clk;
reg [7:0] data2;

task send_bits;
input [7:0] data2;
integer i;
begin
    @(negedge clk);
for (i =0 ;i<8 ;i=i+1 ) begin
    data=data2[i];
    #10;
end
end
endtask    
initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    clk=0;  rst_n=0; data=0;
    #10
    rst_n=1;
    send_bits(145);
    #100;
    send_bits(90);
    #100;
    send_bits(8'b01110101);
    send_bits(8'b11010101);
    send_bits(8'b01010101);
    send_bits(8'b01100100);
    send_bits(8'b11010111);
    #100;
    $stop;

end
endmodule    
