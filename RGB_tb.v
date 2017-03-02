`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2017 07:52:12 AM
// Design Name: 
// Module Name: RGB_tb
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


module RGB_tb(

    );
    wire [3:0] R;
    wire [3:0] G;
    wire [3:0] B;
    reg Boton_R,Boton_G,Boton_B,BIT_FUENTE,H_ON,V_ON;
    
    
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
     initial
     
       begin
        Boton_R = 1'b0;
        Boton_G = 1'b0;
        Boton_B = 1'b0;
        BIT_FUENTE = 1'b0;
        H_ON = 1'b0;
        V_ON = 1'b0;
        #30 Boton_R = 1'b1;
        #40 Boton_G = 1'b1;
        #50 Boton_B = 1'b1;
        #5 BIT_FUENTE = 1'b1;
        #15 H_ON = 1'b1;
        #20 V_ON = 1'b1;
        #120 BIT_FUENTE = 1'b0;
        end
     
endmodule
