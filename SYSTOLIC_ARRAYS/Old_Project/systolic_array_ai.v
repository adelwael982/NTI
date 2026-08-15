module systolic_array_ai #(
    parameter WIDTH=8
) (
    input wire in_systolic_array_clk,
    input wire [2:0]in_systolic_array_ai_size,
    input wire in_systolic_array_ai_data_en,
    input wire in_systolic_array_rclk,in_systolic_array_rinc1,in_systolic_array_rinc2,in_systolic_array_rinc3,
    input wire in_systolic_array_rst,
    input wire [WIDTH-1:0]  in_systolic_array_a_r0,	
    input wire [WIDTH-1:0]  in_systolic_array_a_r1,
	input wire [WIDTH-1:0]  in_systolic_array_a_r2,	
    input wire [WIDTH-1:0]  in_systolic_array_b_c0,
	input wire [WIDTH-1:0]  in_systolic_array_b_c1,	
    input wire [WIDTH-1:0]  in_systolic_array_b_c2,
    output wire empty1,empty2,empty3,
    output wire [2*WIDTH-1:0] out_systolic_array_ai_rdata1,
    output wire [2*WIDTH-1:0] out_systolic_array_ai_rdata2,
    output wire [2*WIDTH-1:0] out_systolic_array_ai_rdata3,
    output wire  [2*WIDTH-1:0] out_systolic_array_ai_out1,
    output wire  [2*WIDTH-1:0] out_systolic_array_ai_out2,
    output wire  [2*WIDTH-1:0] out_systolic_array_ai_out3
);
wire [1:0]in_systolic_array_ctrl1,in_systolic_array_ctrl2,in_systolic_array_ctrl3; //ctrl signal from control to sys array


wire full1,full2,full3;//the full signal from the fifo to control

wire winc1,winc2,winc3; //increment from control to the fifo

wire valid;//valid signal from control to sys array
systolic_array #(.WIDTH(WIDTH)) s1(
        .in_systolic_array_clk(in_systolic_array_clk),
        .in_systolic_array_rst(in_systolic_array_rst),
        .in_systolic_array_valid(valid),  
	.in_systolic_array_ctrl1(in_systolic_array_ctrl1),
    .in_systolic_array_ctrl2(in_systolic_array_ctrl2),
    .in_systolic_array_ctrl3(in_systolic_array_ctrl3), 
    .in_systolic_array_a_r0(in_systolic_array_a_r0),	
    .in_systolic_array_a_r1(in_systolic_array_a_r1),
	.in_systolic_array_a_r2(in_systolic_array_a_r2),	
    .in_systolic_array_b_c0(in_systolic_array_b_c0),
	.in_systolic_array_b_c1(in_systolic_array_b_c1),	
    .in_systolic_array_b_c2(in_systolic_array_b_c2),    
    .out_systolic_array_out1(out_systolic_array_ai_out1),
    .out_systolic_array_out2(out_systolic_array_ai_out2),
    .out_systolic_array_out3(out_systolic_array_ai_out3) 
);
async_fifo #(.data(2*WIDTH)) async1 (
    .wclk(in_systolic_array_clk),
    .rclk(in_systolic_array_rclk),
    .rinc(in_systolic_array_rinc1),
    .winc(winc1),
    .rrst(in_systolic_array_rst),
    .wrst(in_systolic_array_rst),
    .wdata(out_systolic_array_ai_out1),
    .rdata(out_systolic_array_ai_rdata1),
    .full(full1),
    .empty(empty1)
);
async_fifo #(.data(2*WIDTH)) async2 (
    .wclk(in_systolic_array_clk),
    .rclk(in_systolic_array_rclk),
    .rinc(in_systolic_array_rinc2),
    .winc(winc2),
    .rrst(in_systolic_array_rst),
    .wrst(in_systolic_array_rst),
    .wdata(out_systolic_array_ai_out2),
    .rdata(out_systolic_array_ai_rdata2),
    .full(full2),
    .empty(empty2)
);
async_fifo #(.data(2*WIDTH)) async3 (
    .wclk(in_systolic_array_clk),
    .rclk(in_systolic_array_rclk),
    .rinc(in_systolic_array_rinc3),
    .winc(winc3),
    .rrst(in_systolic_array_rst),
    .wrst(in_systolic_array_rst),
    .wdata(out_systolic_array_ai_out3),
    .rdata(out_systolic_array_ai_rdata3),
    .full(full3),
    .empty(empty3)
);
control_system1 control(
    .in_cs_clk(in_systolic_array_clk),
    .in_cs_rst(in_systolic_array_rst),
    .in_cs_full1(full1),
    .in_cs_full2(full2),
    .in_cs_full3(full3),
    .in_cs_data_en(in_systolic_array_ai_data_en),
    .in_cs_size(in_systolic_array_ai_size),
    .out_cs_winc1(winc1),
    .out_cs_winc2(winc2),
    .out_cs_winc3(winc3),
    .out_cs_valid(valid),
    .out_cs_ctrl1(in_systolic_array_ctrl1),
    .out_cs_ctrl2(in_systolic_array_ctrl2),
    .out_cs_ctrl3(in_systolic_array_ctrl3)
);
endmodule
