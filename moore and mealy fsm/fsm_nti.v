`default_nettype none
module fsm_nti (
    input wire a,b,clk,rst_n,
    output wire y0,y1
);
    localparam 
    s0 = 2'b00,
    s1 = 2'b01,
    s2 = 2'b10
    ;
    reg [1:0] cs,ns;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cs<=s0;
        end
        else
        cs<=ns;
    end
    always @(*) begin
       ns=cs;
        case (cs)
           s0 : begin
            if (a&&b) begin
                ns=s2;
            end
            else if (a&&(!b)) begin
                ns=s1;
            end
           end
           s1 : begin
            if (a) begin ns=s0; end
           end
           s2 : ns=s0;
        endcase
    end
assign y0 = (cs==s0)&&(a&&b) ? 1:0;
assign y1 = (cs==s1)||(cs==s0) ? 1:0;
endmodule
