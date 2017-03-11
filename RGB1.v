`timescale 1ns / 1ps


module RGB1(
    output wire [3:0] R,
    output wire [3:0] G,
    output wire [3:0] B,
    input BotonR,
    input BotonG,
    input BotonB,
    input wire BIT_FUENTE,
    input wire H_ON,
    input wire V_ON,
    output  R2,
    output  G2,
    output  B2
    );
    
    wire Tierra = 1'b0;
    wire SalidaMUXR,SalidaMUXG,SalidaMUXB;
    wire Seleccion =  BIT_FUENTE &  H_ON &  V_ON;
    
   
    
       assign SalidaMUXR = Seleccion ? BotonR : Tierra;
       assign SalidaMUXG = Seleccion ? BotonG : Tierra;
       assign SalidaMUXB = Seleccion ? BotonB : Tierra;
       
  /*Salidas al puerto VGA*/     
    assign R = {SalidaMUXR,SalidaMUXR,SalidaMUXR,SalidaMUXR};
    assign G = {SalidaMUXG,SalidaMUXG,SalidaMUXG,SalidaMUXG};
    assign B = {SalidaMUXB,SalidaMUXB,SalidaMUXB,SalidaMUXB};

 /*Salidas para la medicion en analizador logico*/
    assign R2 = SalidaMUXR;
    assign G2 = SalidaMUXG;
    assign B2 = SalidaMUXB;


    
    
    
endmodule
