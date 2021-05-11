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
    input [15:0] X,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] Resultado
);

    reg [15:0] Reg_X;
    reg [15:0] Reg_S;
    reg [15:0] Reg_H;

    wire [15:0] outm0, outm1, outm2;

    parameter Zero = 15'b0000000000000000;


always @(posedge ck or rst) begin //Clock na borda de subida
    
    reg R1(X, lx, Reg_X);

    mux M0(Zero, A, B, C, m0, outm0);
    mux M1(outm0, Reg_X, Reg_S, Reg_H, m1, outm1);
    mux M2(Reg_X, outm0, Reg_S, Reg_H, m2, outm2);
    
    ula U(outm1, outm2, h, Resultado);

    reg R2(Resultado, ls, Reg_S);
    reg R3(Resultado, lh, Reg_H);
    

end

endmodule