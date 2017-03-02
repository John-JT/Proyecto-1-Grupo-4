`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 02/27/2017 02:15:46 PM
//
//////////////////////////////////////////////////////////////////////////////////

module counter(
    output wire [9:0] Qh,
    output wire [9:0] Qv,
    output wire H_Sync,
    output wire V_Sync,
    output wire V_ON,
    output wire H_ON,
    input resetM,
    input reloj
    );
  
 

reg [9:0] Qhreg=10'b0000000000;
reg [9:0] Qvreg=10'b0000000000;

reg[1:0] enableH = 2'b00;
reg enableV;

reg H_Syncreg;
reg V_Syncreg;

reg H_ONreg;
reg V_ONreg;
   

//Contador divisor de frecuencia
      always @(posedge reloj)
      begin
      
         if (resetM)
            enableH <= 2'b00;
            
         else if (enableH == 2'b11)
            enableH <= 2'b00;
         
         else
            enableH <= enableH + 2'b01;
            
       end 
            
            
 //Contador pixeles (H)
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
                   
  
 //Contador lineas (V)
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
    always @(posedge reloj)
    
    begin
      
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
        always @(posedge reloj)
        
        begin
          
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

 assign Qh = Qhreg;
 assign Qv = Qvreg;
 
 assign H_Sync = H_Syncreg;
 assign V_Sync = V_Syncreg;
 
 assign H_ON = H_ONreg;
 assign V_ON = V_ONreg;


endmodule