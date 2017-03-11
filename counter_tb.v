`timescale 1ns / 1ps
<<<<<<< HEAD
=======
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
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d


module counter_tb(

    );
     wire [9:0] Qh;
     wire [9:0] Qv;
<<<<<<< HEAD
     wire H_Sync, H_Sync2;
     wire V_Sync, V_Sync2;
=======
     wire H_Sync;
     wire V_Sync;
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
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
<<<<<<< HEAD
                .reloj(reloj),
                .H_Sync2(H_Sync2),
                .V_Sync2(V_Sync2)
=======
                .reloj(reloj)
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
        );
initial
            
            begin
            reloj=0;
            resetM = 1;
            #100 resetM = 0;
            end
            
            always
            begin
<<<<<<< HEAD
            #5 reloj = ~reloj;
=======
            #10 reloj = ~reloj;
>>>>>>> 577cc9a1689b628be444f2603bb3fba1a29a7b4d
            end

endmodule
