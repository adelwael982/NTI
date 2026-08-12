`default_nettype none
module over_mealy (
    input wire data,clk,rst_n,
    output reg out
);
reg [2:0] ps,ns;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        out<=0;ps<=0;
    end
    else
     ps<=ns;
end  

always @(*) begin
    ns=ps;out=0;
    case (ps)
    3'b000    : begin
        if (data) begin
            ns=3'b001;
        end 
    end
    3'b001    : begin
        if (data) begin
            ns=3'b010;
        end
        else ns=3'b000;
    end
    3'b010    : begin
        if (!data) begin
            ns=3'b011;
        end
    else ns=3'b001;
    end
    3'b011    : begin
        if (data) begin
            ns=3'b100;
        end
        else
        ns=3'b000;
    end
    3'b100    : begin
        if (!data) begin
            ns=3'b101;
        end
        else
        ns=3'b001;
    end
    3'b101    : begin
        if (data) begin
            ns=3'b001; out=1;
        end
        else ns=3'b000;
    end
        default: ns=ps;
    endcase
end
endmodule
