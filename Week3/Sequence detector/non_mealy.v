`default_nettype none
module non_mealy (
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
    ns=3'b000; out=0;
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
    end
    3'b010    : begin
        if (!data) begin
            ns=3'b011;
        end
    end
    3'b011    : begin
        if (data) begin
            ns=3'b100;
        end
    end
    3'b100    : begin
        if (!data) begin
            ns=3'b101;
        end
    end
    3'b101    : begin
        if (data) begin
         out=1;
        end
    end
        default: ns=3'b000;
    endcase
end
endmodule

