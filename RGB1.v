`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2017 09:29:05
// Design Name: 
// Module Name: RGB1
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


module RGB1(
    output wire [3:0] R,
    output wire [3:0] G,
    output wire [3:0] B,
    input BotonR,
    input BotonG,
    input BotonB,
    input wire BIT_FUENTE,
    input wire H_ON,
    input wire V_ON
    );
    
     wire Tierra = 1'b0;
       
     wire SalidaMUXR,SalidaMUXG,SalidaMUXB;

          

    wire Seleccion =  BIT_FUENTE &  H_ON &  V_ON;
    
   
    
       assign SalidaMUXR = Seleccion ? BotonR : Tierra;
       assign SalidaMUXG = Seleccion ? BotonG : Tierra;
       assign SalidaMUXB = Seleccion ? BotonB : Tierra;
       
       
assign R = {SalidaMUXR,SalidaMUXR,SalidaMUXR,SalidaMUXR};
assign G = {SalidaMUXG,SalidaMUXG,SalidaMUXG,SalidaMUXG};
assign B = {SalidaMUXB,SalidaMUXB,SalidaMUXB,SalidaMUXB};

    
    
    
endmodule
