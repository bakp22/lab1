`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2025 03:05:15 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb(norOut, A);
    output logic norOut;
    input logic A;

    initial begin
        A <= 1; #10;
        A <= 0;
        $stop();
    end
    
    alu dut (.norOut, .A)

endmodule
Engineer
