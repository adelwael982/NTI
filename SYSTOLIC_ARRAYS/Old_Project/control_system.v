`default_nettype none
module control_system1 (
    input wire in_cs_clk,in_cs_rst,
    input wire in_cs_full1,
    input wire in_cs_full2,
    input wire in_cs_full3,
    input wire in_cs_data_en,
    input wire [2:0]in_cs_size,
    output reg out_cs_winc1,
    output reg out_cs_winc2,
    output reg out_cs_winc3,
    output reg out_cs_valid,
    output reg [1:0] out_cs_ctrl1,
    output reg [1:0] out_cs_ctrl2,
    output reg [1:0] out_cs_ctrl3
);
reg [3:0] cnt_next,cnt_reg;
reg [7:0] calc;
//Next State Logic
   always @(posedge in_cs_clk or negedge in_cs_rst) begin
    if (!in_cs_rst) begin
        cnt_reg<=3'b000;
    end
    else begin cnt_reg<=cnt_next;end
   end

   //next state logic  
always @(*) begin 
   calc=(in_cs_size<<2)-2;
if (in_cs_data_en&&cnt_reg==3'b000) begin
   cnt_next=cnt_reg+1;
end
else if ((cnt_reg>0)&&(cnt_reg<calc)) begin
   cnt_next=cnt_reg+1;
end
else cnt_next=3'b000;
end


 // Output Logic
 always @(*) begin
    if ((cnt_reg>0)&&(!in_cs_full1)&&(!in_cs_full2)&&(!in_cs_full3)) begin
        out_cs_valid=1;
    end
     else out_cs_valid=0;

     if (cnt_reg>1&&cnt_reg<6) begin
        out_cs_ctrl1=cnt_reg-2;
     end
     else out_cs_ctrl1=2'b00;


     if (cnt_reg>2&&cnt_reg<7) begin
        out_cs_ctrl2=cnt_reg-3;
     end
     else out_cs_ctrl2=2'b00;


     if (cnt_reg>3&&cnt_reg<8) begin
        out_cs_ctrl3=cnt_reg-4;
     end
     else out_cs_ctrl3=2'b00;

    if ((cnt_reg>1&&cnt_reg<6)&&(!in_cs_full1)) begin
        out_cs_winc1=1;
    end
     else out_cs_winc1=0;
     
     
     if ((cnt_reg>2&&cnt_reg<7)&&(!in_cs_full2)) begin
        out_cs_winc2=1;
    end
     else out_cs_winc2=0;
     
     
     if ((cnt_reg>3&&cnt_reg<8)&&(!in_cs_full3)) begin
        out_cs_winc3=1;
    end
     else out_cs_winc3=0;
 end

endmodule