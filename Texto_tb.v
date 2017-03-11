`timescale 1ns / 1ps


module Texto_tb(

    );
    
<<<<<<< HEAD
    reg [9:0] Qh_tb;
    reg [9:0] Qv_tb;
    wire BIT_FUENTEtb;
=======
    reg [9:0] Qh_tb;// = 10'b0000000000;
    reg [9:0] Qv_tb;// = 9'b000000000;
    wire BIT_FUENTEtb,ANDD1,ANDD2,ORD,ANDJ,ANDV;
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
    reg reloj_tb;
    reg resetH =1'b0;
    integer i=0,j=0;
    parameter PERIOD = 10;
    
    
     
    
    Posicion_Mosaicos inst_Mosaico(
<<<<<<< HEAD
        .Qv(Qv_tb),.Qh(Qh_tb),.resetM(resetH),.reloj(reloj_tb),
=======
        .Qv(Qv_tb),.Qh(Qh_tb),.reloj(reloj_tb),
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
        .wire_BIT_FUENTE(BIT_FUENTEtb)
        );
initial
    begin
    reloj_tb=0;
    Qh_tb= 10'b0000000000;
    Qv_tb=10'b0000000000;
    
    forever begin
    for (i=0;i<525;i=i+1)
        begin
        
        for (j=0;j<800;j=j+1)
        begin
        #40 Qh_tb = Qh_tb + 10'd1;
        end
        if (Qh_tb == 10'd800)
        begin
        Qh_tb= 10'd0;
        Qv_tb=Qv_tb+10'd1;
        
        end
        
        if (Qv_tb == 10'd525)
        Qv_tb = 10'd0;
        
end
end
end
  
  
  
  
   always
   begin
   #5 reloj_tb = ~reloj_tb;
   end
   
               
endmodule
