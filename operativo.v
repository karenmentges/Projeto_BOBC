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

parameter Valor1 = 15'b0000000000000000, Valor2 = 15'b0000000000000000;


always @(posedge ck or rst) begin //Clock na borda de subida
    
    reg R1(Resultado, lx, Reg_X);

    mux M0(Zero, A, B, C, m0, outm0);
    mux M1(outm0, Reg_X, Reg_S, Reg_H, m1, outm1);
    mux M2(Reg_X, outm0, Reg_S, Reg_H, m2, outm2);
    
    ula U(outm1, outm2, h, Resultado);

    reg R2(Resultado, ls, Reg_S);
    reg R3(Resultado, lh, Reg_H);
    

end

always @(posedge ck or rst) begin //Clock na borda de subida
    if(lx == 1)
        Reg_X <= X;
    end     

    case (m1)
        00 : begin
            if(m0 == 00)
                Valor1 <= 15'b0000000000000000;
            end
            else if(m0 == 01)
                Valor1 <= A;
            end
            else if(m0 == 10)
                Valor1 <= B;
            end
            else if(m0 == 11)
                Valor1 <= C;
            end
        end
        01 : begin
            Valor1 <= Reg_X;
        end
        10 : begin
            Valor1 <= Reg_S;
        end
        11 : begin
            Valor1 <= Reg_H;
        end
    endcase  

    case (m2)
        00 : begin
            Valor2 <= Reg_X;
        end
        01 : begin
            if(m0 == 00)
                Valor2 <= 15'b0000000000000000;
            end
            else if(m0 == 01)
                Valor2 <= A;
            end
            else if(m0 == 10)
                Valor2 <= B;
            end
            else if(m0 == 11)
                Valor2 <= C;
            end
        end
        10 : begin
            Valor2 <= Reg_S;
        end
        11 : begin
            Valor2 <= Reg_H;
        end
    endcase 

    case (h)
        0 : begin
            Valor1 <= Valor1 + Valor2;
        end
        1 : begin
            Valor1 <= Valor1 * Valor2;
        end
    endcase 

    if(ls == 1)
        Reg_S <= Valor1;
    end
    else if(lh == 1)
        Reg_H <= Valor1;
    end

    if(rst == 1) 
        Reg_X <= 15'b0000000000000000;
        Reg_S <= 15'b0000000000000000;
        Reg_H <= 15'b0000000000000000;
    end
    else if(done = 1)
        assign Resultado = Reg_S;
    end
    
end

endmodule