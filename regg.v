module regg(
    input rst,
    input [15:0] v,
    input l,
    output reg [15:0] r
);

    parameter Zero = 16'b0000000000000000;

    always @ (rst or l or v) begin
        
        if(rst == 1) begin
            r = Zero;
        end

        if(l == 1) begin
            r = v;
        end
        
    end
    

endmodule