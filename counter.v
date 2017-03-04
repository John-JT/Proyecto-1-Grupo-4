`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date: 02/27/2017 02:15:46 PM
// Descripcion: Este circuito llamado counter es el circuito sincronizador, es un
// circuito de control, genera la posicion del pixel que se esta "imprimiendo" 
// y genera las sen~ales de sincronizacion H_Sync y V_Sync que son salidas directas
// del controlador VGA (para el control del puerto VGA). Tambien genera H_ON y V_ON 
// que indica si se esta en un zona de display de la pantalla o en una zona de borde,
// estas sen~ales las manipula el circuito de texto.
//////////////////////////////////////////////////////////////////////////////////

module counter(
    output wire [9:0] Qh, //Posicion en "x" del pixel (contador de pixeles)
    output wire [9:0] Qv, //Posicion en "y" del pixel (contador de lineas de pixeles)
    output wire H_Sync,   //Sincronizacion horizontal del controlador VGA
    output wire V_Sync,   //Sincronizacion vertical del controlador VGA
    output wire V_ON,     //Indica si verticalmente estamos en zona de display
    output wire H_ON,     //Indica si horizontalmente estamos en zona de display
    input resetM,         //Reset maestro, resetea todo lo secuencial del circuito final
    input reloj           //clk de la fpga (100MHz)
    );
  
    
//Inicializacion de algunas variables y creacion de otras  
reg [9:0] Qhreg=10'b0000000000;
reg [9:0] Qvreg=10'b0000000000;
    
reg[1:0] enableH = 2'b00;  //hace que el contador horizontal funcione a 25Mhz
reg enableV;               //hace que el contador vertical funcione a 32.25KHz
    
reg H_Syncreg;
reg V_Syncreg;

reg H_ONreg;
reg V_ONreg;
   

//Contador divisor de frecuencia
    always @(posedge reloj) //genera un "clock" de 25MHz
      begin
      
         if (resetM)
            enableH <= 2'b00;
            
         else if (enableH == 2'b11)
            enableH <= 2'b00;
         
         else
            enableH <= enableH + 2'b01;
            
       end 
            
            
//Contador pixeles (posicion horizontal)
        always @(posedge reloj)        
        begin
        enableV <= 1'b0;
                    
            if (resetM)
               Qhreg = 10'b0000000000;
                               
            else if (Qh == 10'd800) 
            begin              
               Qhreg = 10'b0000000000;   
               enableV <= 1'b1;                     
             end
                               
                else if (enableH == 2'b11)
                Qhreg =  Qhreg + 10'b0000000001;
   
         end
                   
  
//Contador lineas (posicion vertical)
          always @(posedge reloj)                    
           begin
                          
             if (resetM)
                 Qvreg <= 10'b000000000;
                                            
             else if (Qvreg == 10'd525)          
                 Qvreg <= 10'b0000000000;   
                         
             else if (enableV == 1'b1)
                 Qvreg <= Qvreg + 10'b0000000001;
                             
           end       

 
// Horizontal Sync
    always @(posedge reloj) //Conjunto de comparadores que generan
    begin                   //la sincronizacion horizontal  
      
       if (Qhreg <= 6'd48)
         begin
           H_ONreg <= 1'b0;
           H_Syncreg <= 1'b1;
         end
       
       else if (Qhreg <= 10'd688)
         H_ONreg <= 1'b1;
         
       else if (Qhreg <= 10'd704)
         H_ONreg <= 1'b0;
       
       else 
         H_Syncreg <= 1'b0;  
          
     end
     
  
 //Vertical Sync
        always @(posedge reloj) //Conjunto de comparadores que generan
        begin                   //la sincronizacion horizontal 
          
           if (Qvreg <= 6'd33)
             begin
               V_ONreg <= 1'b0;
               V_Syncreg <= 1'b1;
             end
           
           else if (Qvreg <= 10'd513)
             V_ONreg <= 1'b1;
             
           else if (Qvreg <= 10'd523)
             V_ONreg <= 1'b0;
           
           else 
             V_Syncreg <= 1'b0;
             
         end

 /*Se igualan algunas variables intermedias (reg)
   a salidas tipo wire*/
 assign Qh = Qhreg;
 assign Qv = Qvreg;
 
 assign H_Sync = H_Syncreg;
 assign V_Sync = V_Syncreg;
 
 assign H_ON = H_ONreg;
 assign V_ON = V_ONreg;


endmodule
