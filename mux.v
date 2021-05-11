module mux(
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [15:0] D,
    input [1:0] sel,
    output [15:0] out
);

    always @ (A or B or C or D or sel) begin
        case(sel)
            2'b00 : out <= A;
            2'b01 : out <= B;
            2'b10 : out <= C;
            2'b11 : out <= D;
        endcase
    end

endmodule