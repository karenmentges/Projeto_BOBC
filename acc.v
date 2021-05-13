module acc(
    input ck,
    input rst,
    input [2:0] o,
    output reg [2:0] overflow
); 
    
    parameter Zero = 2'b00;
    
    always @(posedge ck or rst)
        if(rst == 1) begin
            overflow = Zero;
        end
        else begin
            overflow = overflow + o;
        end
    endmodule