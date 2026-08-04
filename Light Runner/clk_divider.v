module clk_divider (
    input clk,rst_n,
    output reg clk_two
);
reg [25:0] cnt_next,cnt_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt_reg<=0;clk_two<=0;
        end
        else
        cnt_reg<=cnt_next;
    end
    always @(*) begin
       cnt_next=cnt_reg+1;
        if(cnt_next==12500000) begin
        clk_two=~clk_two;cnt_next=0; end
       else
       clk_two=clk_two;
    end
endmodule
