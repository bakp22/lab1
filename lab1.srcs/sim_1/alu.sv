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
    input wire [2:0] control, 
    output wire [OP_WIDTH-1:0] res //output
);
    assign res = (control == 3'b000) ? ~op1 : //NOT
                 (control == 3'b001) ? (op1^op2) : //XOR
                 (control == 3'b010) ? (op1 & op2) : //AND
                 (control == 3'b011) ? (op1 | op2) : //OR
                 (control == 3'b100) ? ~(op1^op2) : //XNOR
                 {OP_WIDTH{1'b0}};  
     
endmodule

