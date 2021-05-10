module operativo (
    input ck,
    input rst,
    input lx,
    input m0,
    input m1,
    input m2,
    input h,
    input ls,
    input lh,
    input done,
    //input X,
    //input A,
    //input B,
    //input C,
    output Resultado
);

reg [15:0] Reg_X;
reg [15:0] Reg_S;
reg [15:0] Reg_H;
reg [15:0] Valor1;
reg [15:0] Valor2;

parameter X = 2, A = 3, B = 4, C = 5;


always @(posedge ck or rst) begin //Clock na borda de subida
    if(lx == 1)
        Reg_X <= X;
    end     

    case (m1)
        00 : begin
            if(m0 == 00)
            Valor1 = 0000000000000000;
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
            Valor2 = 0000000000000000;
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
            valor1 <= Valor1 * Valor2;
        end
    endcase 

    if(ls == 1)
        Reg_S = ;
    end
    else if(lh == 1)
        Reg_H = ;
    end

    if(rst == 1) 
        Reg_X = 0000000000000000;
        Reg_S = 0000000000000000;
        Reg_H = 0000000000000000;
    end
    else if(done = 1)
        Resultado <= Reg_S;
    end
    
end

endmodule