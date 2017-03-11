`timescale 1ns / 1ps



module TODO(
    input reloj,
    input resetM,
    input Boton_B,
    input Boton_R,
    input Boton_G,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output H_Sync,
    output V_Sync,
    output H_Sync2,
    output V_Sync2,
    output BIT_FUENTE,
    output H_ON,
    output V_ON,
    output R2,
    output G2,
    output B2
    );
    
    wire [9:0] Qv;
    wire [9:0] Qh;
    
    
    counter inst_counter(
            .Qh(Qh),
            .Qv(Qv),
            .H_Sync(H_Sync),
            .V_Sync(V_Sync),
            .V_ON(V_ON),
            .H_ON(H_ON),
            .resetM(resetM),
            .reloj(reloj),
            .H_Sync2(H_Sync2),
            .V_Sync2(V_Sync2)
    );
     Posicion_Mosaicos inst_Mosaico(
           .Qv(Qv),
           .Qh(Qh),
           .resetM(resetM),
           .reloj(reloj),
           .wire_BIT_FUENTE(BIT_FUENTE)
           );
     RGB1 inst_RGB1(
               .R(R),
               .G(G),
               .B(B),
               .BotonR(Boton_R),
               .BotonG(Boton_G),
               .BotonB(Boton_B),
               .BIT_FUENTE(BIT_FUENTE),
               .H_ON(H_ON),
               .V_ON(V_ON),
               .R2(R2),
               .B2(B2),
               .G2(G2)
               );
endmodule
