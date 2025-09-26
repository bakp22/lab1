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


module alu #(parameter OP_WIDTH = 4)(
    input wire [OP_WIDTH-1:0] op1, //input
    input wire [OP_WIDTH-1:0] op2,
    input wire control, 
    output wire [OP_WIDTH-1:0] res //output
);
    assign res = (control == 0) ? ~op1 : (op1^op2);
     
endmodule

