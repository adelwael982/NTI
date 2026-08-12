module SPG (
    input clk,rst_n,serial,
    output reg parity_out
);
reg [3:0] cnt_reg,cnt_next;
reg [7:0] register,register_next;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt_reg<=0; register<=8'b0; parity_out<=0;
        end
        else begin
           cnt_reg<=cnt_next;register<=register_next;
        end
        
    end
always @(*) begin
    cnt_next=cnt_reg;
    if (cnt_reg<9) begin
        if (cnt_reg==0) begin
            register=8'b0;parity_out<=0;
        end
        cnt_next=cnt_reg+1; register_next={serial,register[7:1]};
      if (cnt_reg==8) begin
    parity_out=calc_parity(register); cnt_next=0;
      end
    end
end  
function calc_parity;
        input [7:0] bits; 
        integer i;  
        reg parity; 
        begin
            parity = 0;
            for (i = 0; i < 8; i = i + 1) begin
                parity = parity ^ bits[i];
            end
            calc_parity = parity; 
        end
    endfunction
endmodule
