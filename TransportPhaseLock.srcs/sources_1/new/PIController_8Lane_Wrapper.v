`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2026 03:34:45 PM
// Design Name: 
// Module Name: PIController_8Lane_Wrapper
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


module PIController_Wrapper #(
    parameter CONTROL_WIDTH = 32,
    parameter ERROR_WIDTH = 12,
    parameter KP_WIDTH = 16,
    parameter KI_WIDTH = 16
    )(
    input clk,
    input rst_n,
    input [ERROR_WIDTH*8 - 1:0] error_signal_unfolded,
    input [KP_WIDTH - 1:0] kp_in,
    input [KI_WIDTH - 1:0] ki_in,
    input [4:0] kp_right_bit_shift_in,
    input [4:0] ki_right_bit_shift_in,
    output [CONTROL_WIDTH*8 - 1:0] control_output,
    input loop_en,
    input integrator_gpio_rst
    );
    
   wire [ERROR_WIDTH*8 - 1:0] error_in;
   assign error_in = loop_en ? error_signal_unfolded : 96'b0;
    

  PIController_8Lane #(
    .CONTROL_WIDTH(32),
    .ERROR_WIDTH(12),
    .KP_WIDTH(16),
    .KI_WIDTH(16)
    ) PIControllerInst (
    .clk(clk),
    .rst_n(rst_n),
    .error_in(error_in),
    .kp_in(kp_in),
    .ki_in(ki_in),
    .kp_bit_shift_right(kp_right_bit_shift_in),
    .ki_bit_shift_right(ki_right_bit_shift_in),
    .control_out(control_output),
    .integrator_gpio_rst(integrator_gpio_rst)
  );
  
   
endmodule
