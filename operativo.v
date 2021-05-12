module operativo (
    input ck,
    input rst,
    input lx,
    input [1:0] m0,
    input [1:0] m1,
    input [1:0] m2,
    input h,
    input ls,
    input lh,
    input done,
    input [15:0] NX,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] Resultado
);

    wire [15:0] RegX, RegS, RegH, res;
    wire [15:0] outm0, outm1, outm2;
    parameter Zero = 16'b0000000000000000;

    regg R1(rst, NX, lx, RegX);

    mux M0(Zero, A, B, C, m0, outm0);
    mux M1(outm0, RegX, RegS, RegH, m1, outm1);
    mux M2(RegX, outm0, RegS, RegH, m2, outm2);
    
    ula U(outm1, outm2, h, res);

    regg R2(rst, res, ls, RegS);
    regg R3(rst, res, lh, RegH);

    //always @(posedge ck or rst) begin //Clock na borda de subida
        
    
    //end

    assign Resultado = RegS;

endmodule