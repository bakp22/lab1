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
    input wire [3:0] control, 
    output wire [OP_WIDTH-1:0] res //output
);
    assign res = (control == 4'b0000) ? ~op1 : //NOT
                 (control == 4'b0001) ? (op1^op2) : //XOR
                 (control == 4'b0010) ? (op1 & op2) : //AND
                 (control == 4'b0011) ? (op1 | op2) : //OR
                 (control == 4'b0100) ? ~(op1^op2) : //XNOR
                 (control == 4'b0101) ? op1 << op2 : //left shift unsigned or signed
                 (control == 4'b0110) ? op1 >> op2 : //right shift unsigned 
                 (control == 4'b0111) ? $signed(op1) >>> op2 : //signed right shift
                 (control == 4'b1111) ? op1 - op2 : //SUB
                 (control == 4'b1000) ? op1 + op2 : //ADD
                 (control == 4'b1100) ? op1 < op2 : //less than
                 (control == 4'b1101) ? op1 > op2 : //greater than
                 (control == 4'b1110) ? op1 == op2 : //equals to 
                 {OP_WIDTH{1'b0}};  
     
endmodule

