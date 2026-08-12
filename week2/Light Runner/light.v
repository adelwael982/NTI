`default_nettype none
module light (
    input wire clk,rst_n,hold,
    output reg [3:0] s
);
 reg[3:0] s_next;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        s<=4'b0111;
    end
    else if (!hold)
    s<=s;
    else
  s<=s_next;
  end  

 always @(*) begin
    s_next={s[0],s[3:1]};
 end
endmodule
