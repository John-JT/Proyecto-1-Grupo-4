`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2017 05:59:23 AM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(

    );
     wire [9:0] Qh;
     wire [9:0] Qv;
     wire H_Sync;
     wire V_Sync;
     wire V_ON;
     wire H_ON;
     reg resetM;
     reg reloj;

    
    
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
initial
            
            begin
            reloj=0;
            resetM = 1;
            #100 resetM = 0;
            end
            
            always
            begin
            #10 reloj = ~reloj;
            end

endmodule
