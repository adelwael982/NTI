`default_nettype none
`timescale 1ns/1ps
module sys_arr_ai_tb;
parameter WIDTH=8;
    reg in_systolic_array_clk;
    reg [2:0]in_systolic_array_ai_size;
    reg in_systolic_array_ai_data_en;
    reg in_systolic_array_rclk;
    reg in_systolic_array_rinc1;
    reg in_systolic_array_rinc2;
    reg in_systolic_array_rinc3;
    reg in_systolic_array_rst;
    reg [WIDTH-1:0]  in_systolic_array_a_r0;    
    reg [WIDTH-1:0]  in_systolic_array_a_r1;
    reg [WIDTH-1:0]  in_systolic_array_a_r2;    
    reg [WIDTH-1:0]  in_systolic_array_b_c0;
    reg [WIDTH-1:0]  in_systolic_array_b_c1;    
    reg [WIDTH-1:0]  in_systolic_array_b_c2;
    wire empty1;
    wire empty2;
    wire empty3;
    wire [2*WIDTH-1:0] out_systolic_array_ai_out1;
    wire [2*WIDTH-1:0] out_systolic_array_ai_out2;
    wire [2*WIDTH-1:0] out_systolic_array_ai_out3;
    wire [2*WIDTH-1:0] out_systolic_array_ai_rdata1;
    wire [2*WIDTH-1:0] out_systolic_array_ai_rdata2;
    wire [2*WIDTH-1:0] out_systolic_array_ai_rdata3;

systolic_array_ai #(.WIDTH(WIDTH)) sys1(
 .*
);
reg [WIDTH-1:0] a00,a01,a02,a10,a11,a12,a20,a21,a22;
reg [WIDTH-1:0] b00,b01,b02,b10,b11,b12,b20,b21,b22;

always #5 in_systolic_array_clk=~in_systolic_array_clk;
always #5 in_systolic_array_rclk=~in_systolic_array_rclk;

task send_matrixA_B;
  input[WIDTH-1:0] a00,a01,a02,a10,a11,a12,a20,a21,a22,b00,b01,b02,b10,b11,b12,b20,b21,b22;
  @(negedge in_systolic_array_clk)
  begin
    in_systolic_array_a_r0=a00;
    in_systolic_array_a_r1=a01;
    in_systolic_array_a_r2=a02;
    in_systolic_array_b_c0=b00;
    in_systolic_array_b_c1=b01;
    in_systolic_array_b_c2=b02;
    #10 
    in_systolic_array_a_r0=a10;
    in_systolic_array_a_r1=a11;
    in_systolic_array_a_r2=a12;
    in_systolic_array_b_c0=b10;
    in_systolic_array_b_c1=b11;
    in_systolic_array_b_c2=b12;
    #10
    in_systolic_array_a_r0=a20;
    in_systolic_array_a_r1=a21;
    in_systolic_array_a_r2=a22;
    in_systolic_array_b_c0=b20;
    in_systolic_array_b_c1=b21;
    in_systolic_array_b_c2=b22;

    end
endtask

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
$monitor("Output 1:%b       Output 2:%b      Output 3:%b     Time%0t",out_systolic_array_ai_out1,out_systolic_array_ai_out2,out_systolic_array_ai_out3,$time);


in_systolic_array_clk=0; in_systolic_array_ai_size=3;  in_systolic_array_rst=0; in_systolic_array_ai_data_en=0;


in_systolic_array_rclk=0; in_systolic_array_rinc1=1; in_systolic_array_rinc2=1; in_systolic_array_rinc3=1;
#10

send_matrixA_B(1,4,7,2,5,8,3,6,9,1,0,0,0,1,0,0,0,1);
#100 
in_systolic_array_ai_data_en=1;
#10
send_matrixA_B(1,4,7,2,5,8,3,6,9,1,0,0,0,1,0,0,0,1);
#100

in_systolic_array_rst=1;

send_matrixA_B(1,4,7,2,5,8,3,6,9,3,5,1,5,3,7,1,7,3);
#40;
 in_systolic_array_ai_data_en=0;#40;
 send_matrixA_B(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

#20
in_systolic_array_ai_data_en=1;
send_matrixA_B(1,4,7,2,5,8,3,6,9,3,0,0,0,3,0,0,0,3);
#20
 in_systolic_array_ai_data_en=0;#40;
 send_matrixA_B(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

#20
in_systolic_array_ai_data_en=1;in_systolic_array_ai_size=2;
send_matrixA_B(1,3,0,2,4,0,0,0,0,1,3,0,2,4,0,0,0,0);
#20
in_systolic_array_ai_data_en=0;
#100
$stop;
end
endmodule