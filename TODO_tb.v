`timescale 1ns / 1ps
<<<<<<< HEAD
=======
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2017 01:43:56 PM
// Design Name: 
// Module Name: TODO_tb
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
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d


module TODO_tb(

    );
    
        reg reloj;
        reg resetM;
        reg Boton_B,Boton_R,Boton_G;
<<<<<<< HEAD
        wire H_Sync,H_Sync2,V_Sync,V_Sync2,BIT_FUENTE,H_ON,V_ON,R2,G2,B2;
=======
        wire H_Sync,V_Sync,BIT_FUENTE,H_ON,V_ON;
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
        wire [3:0] R;
        wire [3:0] G;
        wire [3:0] B;
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
<<<<<<< HEAD
                .reloj(reloj),
                .H_Sync2(H_Sync2),
                .V_Sync2(V_Sync2)

=======
                .reloj(reloj)
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
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
<<<<<<< HEAD
                   .V_ON(V_ON),
                   .R2(R2),
                   .B2(B2),
                   .G2(G2)

=======
                   .V_ON(V_ON)
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
                   );
                   
        initial
                begin
                reloj= 0 ;
                resetM = 1;    
                Boton_R = 1'b0;
                Boton_G = 1'b0;
                Boton_B = 1'b0; 
                #100 resetM = 0;
                #1000 Boton_R = 1'b1;
                #5000 Boton_B = 1'b1;
                
                #19000000 resetM = 1'b1;
                end
                always
                begin
                #5 reloj = ~reloj;
                end
                

    
endmodule
