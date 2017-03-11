`timescale 1ns / 1ps


module RGB1(  //inicia el modulo RGB, define sus entradas y salidas respectivas
    output wire [3:0] R,
    output wire [3:0] G,
    output wire [3:0] B,
    input BotonR,//BotonR, BotonG y BotonB son los switch donde el usuario puede escojer el color que desea
    input BotonG,
    input BotonB,
    input wire BIT_FUENTE,//es la salida del circuito de texto
    input wire H_ON,//H_ON y V_ON nos indican si el pixel esta en la zona de display
    input wire V_ON,
    output  R2,
    output  G2,
    output  B2
    );
    
    wire Tierra = 1'b0; 
    wire SalidaMUXR,SalidaMUXG,SalidaMUXB;
    wire Seleccion =  BIT_FUENTE &  H_ON &  V_ON;//compuerta AND de BIT_FUENTE, H_ON y V_ON
    
   
    
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
