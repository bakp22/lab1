`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Beren Akpinar
// 
// Create Date: 09/19/2025 03:03:11 PM
// Design Name: 
// Module Name: alu
// Project Name: lab_1
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


module alu(
    input wire op1, //input
    input wire op2,
    input wire control, 
    output wire res //output
);
    assign res = (control == 0) ? ~op1 : (op1^op2);
     
endmodule

