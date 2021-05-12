module ula(
    input [15:0] v1,
    input [15:0] v2,
    input h,
    output reg overflow,
    output reg [15:0] r
);

    always @ (h or v1 or v2) begin
        case(h)
            1'b0 : {overflow, r} = v1 + v2;
            1'b1 : {overflow, r} = v1 * v2;
        endcase
    end

endmodule