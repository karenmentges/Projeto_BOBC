module controle (
    input ck,
    input inicio,
    input pronto,
    input rst,
    output lx,
    output[1:0] m0,
    output[1:0] m1,
    output[1:0] m2,
    output h,
    output ls,
    output lh,
    output done
);

reg [1:0] state;

parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6, H = 7, I = 8, J = 9;


always @(posedge ck or rst) begin //Clock na borda de subida
    if(rst == 1) 
        state <= A;
    else begin
        case (state)
            A : begin
                lx=1'b0; 
                m0=2'b00;
                m1=2'b00;
                m2=2'b00;
                h=1'b0;
                ls=1'b0;
                lh=1'b0;
                done=1'b0;
                state <= B;
            end
            B : begin
                lx=1'b1; 
                m0=2'b01; 
                m1=2'b00;
                m2=2'b00; 
                h=1'b1; 
                ls=1'b0; 
                lh=1'b0; 
                done=1'b0;
                state <= C;
            end
            C : begin
                lx=1'b0;
                m0=2'b01;
                m1=2'b00;
                m2=2'b00;
                h=1'b1;
                ls=1'b0;
                lh=1'b1;
                done=1'b0;
                state <= D;
            end
            D : begin
                lx=1'b0;
                m0=2'b10;
                m1=2'b00;
                m2=2'b11;
                h=1'b0;
                ls=1'b0;
                lh=1'b0;
                done=1'b0;
                state <= E;
            end
            E : begin
                lx=1'b0;
                m0=2'b10;
                m1=2'b00;
                m2=2'b11;
                h=1'b0;
                ls=1'b0;
                lh=1'b1;
                done=1'b0;
                state <= F;
            end
            F : begin
                lx=1'b0;
                m0=2'b00;
                m1=2'b01;
                m2=2'b11;
                h=1'b1;
                ls=1'b0;
                lh=1'b0;
                done=1'b0;
                state <= G;
            end
            G : begin
                lx=1'b0;
                m0=2'b00;
                m1=2'b01;
                m2=2'b11;
                h=1'b1;
                ls=1'b0;
                lh=1'b1;
                done=1'b0;
                state <= H;
            end
            H : begin
                lx=1'b0;
                m0=2'b11;
                m1=2'b00;
                m2=2'b11;
                h=1'b0;
                ls=1'b0;
                lh=1'b0;
                done=1'b0;
                state <= I;
            end
            I : begin
                lx=1'b0;
                m0=2'b11;
                m1=2'b00;
                m2=2'b11;
                h=1'b0;
                ls=1'b1;
                lh=1'b0;
                done=1'b0;
                state <= J;
            end
            J : begin
                lx=1'b0;
                m0=2'b00;
                m1=2'b00;
                m2=2'b00;
                h=1'b0;
                ls=1'b0;
                lh=1'b0;
                done=1'b1;
                state <= A;
            end
        endcase    
    end
end
endmodule