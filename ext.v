module ext(
    input ck,
    input unextended,
    output reg [2:0] extended 
);
   
    always @(posedge ck) begin 
        extended <= $signed(unextended);
    end

endmodule