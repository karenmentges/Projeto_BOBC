module regg_uni(
    input ck,
    input rst,
    input v,
    input l,
    output reg r
);

    parameter Zero = 1'b0;

    always @ (posedge ck) begin
        
        if(rst == 1) begin
            r = Zero;
        end

        if(l == 1) begin
            r = v;
        end
        
    end
    

endmodule