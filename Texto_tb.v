`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 08:07:31 AM
// Design Name: 
// Module Name: Texto_tb
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


module Texto_tb(

    );
    
    reg [9:0] Qh_tb;// = 10'b0000000000;
    reg [9:0] Qv_tb;// = 9'b000000000;
    wire BIT_FUENTEtb,ANDD1,ANDD2,ORD,ANDJ,ANDV;
    reg reloj_tb;
    reg resetH =1'b0;
    integer i=0,j=0;
    parameter PERIOD = 10;
    
    
     
    
    Posicion_Mosaicos inst_Mosaico(
        .Qv(Qv_tb),.Qh(Qh_tb),.reloj(reloj_tb),
        .wire_BIT_FUENTE(BIT_FUENTEtb),.ANDD1(ANDD1),
        .ANDD2(ANDD2),.ORD(ORD),.ANDJ(ANDJ),.ANDV(ANDV)
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
