`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 08:44:47 AM
// Design Name: 
// Module Name: TODO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
    output V_Sync
    );
    
    wire [9:0] Qv;
    wire [9:0] Qh;
    wire BIT_FUENTE;
    wire H_ON;
    wire V_ON;
    
    
    counter inst_counter(
            .Qh(Qh),
            .Qv(Qv),
            .H_Sync(H_Sync),
            .V_Sync(V_Sync),
            .V_ON(V_ON),
            .H_ON(H_ON),
            .resetM(resetM),
            .reloj(reloj)
    );
     Posicion_Mosaicos inst_Mosaico(
           .Qv(Qv),.Qh(Qh),.resetM(resetM),.reloj(reloj),
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
               .V_ON(V_ON)
               );
endmodule
