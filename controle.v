module controle (
    input ck,
    input inicio,
    input pronto,
    input rst,
    output lx,
    output m0,
    output m1,
    output m2,
    output h,
    output ls,
    output lh,
    output done
);

reg [1:0] state;

parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6, H = 7, I = 8, J = 9;

always @(*) begin
    case (state)
    A : begin
        lx=1'b0; m0=2'b00; m1=2'b00; m2=2'b00; h=1'b0; ls=1'b0; lh=1'b0; done=1'b0;
    B : begin
        lx=1'b1; m0=2'b01; m1=2'b00; m2=2'b00; h=1'b1; ls=1'b0; lh=1'b0; done=1'b0;
    C : begin
        lx=1'b0; m0=2'b01; m1=2'b00; m2=2'b00; h=1'b1; ls=1'b0; lh=1'b1; done=1'b0;
    D : begin
        lx=1'b0; m0=2'b10; m1=2'b00; m2=2'b11; h=1'b0; ls=1'b0; lh=1'b0; done=1'b0;
    E : begin
        lx=1'b0; m0=2'b10; m1=2'b00; m2=2'b11; h=1'b0; ls=1'b0; lh=1'b1; done=1'b0;
    F : begin
        lx=1'b0; m0=2'b00; m1=2'b01; m2=2'b11; h=1'b1; ls=1'b0; lh=1'b0; done=1'b0;
    G : begin
        lx=1'b0; m0=2'b00; m1=2'b01; m2=2'b11; h=1'b1; ls=1'b0; lh=1'b1; done=1'b0;
    H : begin
        lx=1'b0; m0=2'b11; m1=2'b00; m2=2'b11; h=1'b0; ls=1'b0; lh=1'b0; done=1'b0;
    I : begin
        lx=1'b0; m0=2'b11; m1=2'b00; m2=2'b11; h=1'b0; ls=1'b1; lh=1'b0; done=1'b0;
    J : begin
        lx=1'b0; m0=2'b00; m1=2'b00; m2=2'b00; h=1'b0; ls=1'b0; lh=1'b0; done=1'b1;
    endcase
end

always @(posedge ck or rst) begin //Clock na borda de subida
    if(rst == 1) 
        state <= A;
    else begin
        case (state)
            A : begin
                state <= B;
            end
            B : begin
                state <= C;
            end
            C : begin
                state <= D;
            end
            D : begin
                state <= E;
            end
            E : begin
                state <= F;
            end
            F : begin
                state <= G;
            end
            G : begin
                state <= H;
            end
            H : begin
                state <= I;
            end
            I : begin
                state <= J;
            end
            J : begin
                state <= A;
            end
        endcase    
    end
end

endmodule