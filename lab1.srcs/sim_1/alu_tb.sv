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
    reg [2:0] control;
    wire [OP_WIDTH-1:0] res;

    alu #(.OP_WIDTH(OP_WIDTH)) my_alu(
        .op1(op1),
        .op2(op2),
        .control(control),
        .res(res)
    );

    initial begin
        //NOT
        op1 = 4'b0000; control = 3'b000; 
        #10; // time for res to update
        assert (res === ~op1) else $finish;
        $display("NOT: %d -> %d", res, op1);
        //XOR
        op1 = 4'b0001; op2 = 4'b0000; control = 3'b001;
        #10; 
        assert (res === op1 ^ op2) else $finish;
        $display("XOR: %d -> %d", res, op1);
        //AND
        op1 = 4'b0001; op2 = 4'b0001; control = 3'b010; 
        #10; 
        assert (res === op1 & op2) else $finish;
        $display("AND: %d", res);
        //OR
        op1 = 4'b0001; op2 = 4'b0001; control = 3'b011;
        #10;
        assert (res === op1 | op2) else $finish;
        $display("OR:  %d", res);
        //XNOR
        op1 = 4'b0001; op2 = 4'b0001; control = 3'b100;
        #10;
        assert (res === ~(op1^op2)) else $finish;
        $display("XNOR: %d", res);
        //Left Shift
        op1 = 4'b0011; op2 = 4'b0010; control = 3'b101;
        #10;
        assert (res === (op1 << op2)) else $finish;
        $display("LEFT_SHIFT: %d", res);
        //Right Shift
        op1 = 4'b1100; op2 = 4'b0010; control = 3'b110;
        #10;
        assert (res === (op1 >> op2)) else $finish;
        $display("RIGHT_SHIFT: %d", res);
        //RIGHT Shift signed
        op1 = 4'b1100; op2 = 4'b0010; control = 3'b111;
        #10;
        assert (res === (op1 >>> op2)) else $finish;
        $display("RIGHT_SHIFT_SIGNED: %d", res);
        
    end
    
endmodule
