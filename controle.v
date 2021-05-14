module controle (
    input ck,
    input inicio,
    input rst,
    output reg lx,
    output reg [1:0] m0,
    output reg [1:0] m1,
    output reg [1:0] m2,
    output reg h,
    output reg ls,
    output reg lh,
    output reg pronto
);

reg [3:0] state = 4'b0000; // inicializa em A
parameter [3:0] A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000, J = 4'b1001;

always @(posedge ck or rst) begin //Clock na borda de subida
    if(rst == 1) begin
        state <= A;
    end
    else begin
        case (state)
            A : begin
                lx <= 1'b0; 
                m0 <= 2'b00;
                m1 <= 2'b00;
                m2 <= 2'b00;
                h <= 1'b0; 
                ls <= 1'b0;
                lh <= 1'b0;
                pronto <= 1'b0;
                if(inicio == 1) begin
                    state <= B;
                end
                else begin
                    state <= A;
                end
            end
            B : begin
                lx <= 1'b1; 
                m0 <= 2'b01; 
                m1 <= 2'b00;
                m2 <= 2'b00; 
                h <= 1'b1; 
                ls <= 1'b0; 
                lh <= 1'b0; 
                pronto <= 1'b0;
                state <= C;
            end
            C : begin
                lx <= 1'b0;
                m0 <= 2'b01;
                m1 <= 2'b00;
                m2 <= 2'b00;
                h <= 1'b1;
                ls <= 1'b0;
                lh <= 1'b1;
                pronto <= 1'b0;
                state <= D;
            end
            D : begin
                lx <= 1'b0;
                m0 <= 2'b10;
                m1 <= 2'b00;
                m2 <= 2'b11;
                h <= 1'b0;
                ls <= 1'b0;
                lh <= 1'b0;
                pronto <= 1'b0;
                state <= E;
            end
            E : begin
                lx <= 1'b0;
                m0 <= 2'b10;
                m1 <= 2'b00;
                m2 <= 2'b11;
                h <= 1'b0;
                ls <= 1'b0;
                lh <= 1'b1;
                pronto <= 1'b0;
                state <= F;
            end
            F : begin
                lx <= 1'b0;
                m0 <= 2'b00;
                m1 <= 2'b01;
                m2 <= 2'b11;
                h <= 1'b1;
                ls <= 1'b0;
                lh <= 1'b0;
                pronto <= 1'b0;
                state <= G;
            end
            G : begin
                lx <= 1'b0;
                m0 <= 2'b00;
                m1 <= 2'b01;
                m2 <= 2'b11;
                h <= 1'b1;
                ls <= 1'b0;
                lh <= 1'b1;
                pronto <= 1'b0;
                state <= H;
            end
            H : begin
                lx <= 1'b0;
                m0 <= 2'b11;
                m1 <= 2'b00;
                m2 <= 2'b11;
                h <= 1'b0;
                ls <= 1'b0;
                lh <= 1'b0;
                pronto <= 1'b0;
                state <= I;
            end
            I : begin
                lx <= 1'b0;
                m0 <= 2'b11;
                m1 <= 2'b00;
                m2 <= 2'b11;
                h <= 1'b0;
                ls <= 1'b1;
                lh <= 1'b0;
                pronto <= 1'b0;
                state <= J;
            end
            J : begin
                lx <= 1'b0;
                m0 <= 2'b00;
                m1 <= 2'b00;
                m2 <= 2'b00;
                h <= 1'b0;
                ls <= 1'b0;
                lh <= 1'b0;
                pronto <= 1'b1;
                state <= A;
            end
        endcase    
    end
end
endmodule