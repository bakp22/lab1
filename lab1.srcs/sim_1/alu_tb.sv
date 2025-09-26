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


module alu_tb();

    parameter OP_WIDTH = 4;
    reg [OP_WIDTH-1:0] op1;
    reg [OP_WIDTH-1:0] op2;
    reg control;
    wire [OP_WIDTH-1:0] res;

    alu #(.OP_WIDTH(OP_WIDTH)) my_alu(
        .op1(op1),
        .op2(op2),
        .control(control),
        .res(res)
    );

    initial begin
        // Test Case #1 - NOT tests
        op1 = 0; op2 = 0; control = 0; 
        #10; // time for res to update
        assert (res == ~op1) else $finish;
        $display("NOT: %d -> %d", res, op1);

        op1 = 0; op2 = 1; control = 0; 
        #10;
        assert (res == ~op1) else $error("test 1 failed");
        $display("NOT: %d -> %d", res, op1);
        
        op1 = 1; op2 = 0; control = 0;
        #10; 
        assert (res == ~op1) else $finish;
        $display("NOT: %d -> %d", res, op1);
        
        op1 = 1; op2 = 1; control = 0; 
        #10; 
        assert (res == ~op1) else $finish;
        $display("NOT: %d -> %d", res, op1);
        
        //Test Case #2 - XOR tests
        op1 = 0; op2 = 0; control = 1; 
        #10; // time for res to update
        assert (res == op1 ^ op2) else $finish;
        $display("XOR: %d -> %d", res, op1);

        op1 = 0; op2 = 1; control = 1; 
        #10;
        assert (res == op1 ^ op2) else $finish;
        $display("XOR: %d -> %d", res, op1);
        
        op1 = 1; op2 = 0; control = 1;
        #10; 
        assert (res == op1 ^ op2) else $finish;
        $display("XOR: %d -> %d", res, op1);
        
        op1 = 1; op2 = 1; control = 1; 
        #10; 
        assert (res == op1 ^ op2) else $finish;
        $display("XOR: %d -> %d", res, op1);
        
    end
    
endmodule
