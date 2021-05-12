module regg(
    input rst,
    input [15:0] v,
    input l,
    output reg [15:0] r
);

    parameter Zero = 16'b0000000000000000;

    always @ (rst or l or v) begin
        case(rst)
            1'b1 : r = Zero;
        endcase

        case(l)
            1'b1 : r = v;
        endcase
    end
    

endmodule