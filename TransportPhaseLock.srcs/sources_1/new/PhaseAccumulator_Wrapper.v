`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2026 04:17:08 PM
// Design Name: 
// Module Name: PhaseAccumulator_Wrapper
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


module PhaseAccumulator_Wrapper #(
    parameter PHASE_WIDTH = 32
    )(
    input clk,
    input rst_n,
    input [PHASE_WIDTH-1:0] center_freq_word,
    input [PHASE_WIDTH*8-1:0] pi_control_in,
    
    output [PHASE_WIDTH*8-1:0] phase_out
);

    PhaseAccumulator_8Lane #(
    .PHASE_WIDTH(32)
    ) PhaseAccumulatorInst (
    .clk(clk),
    .rst_n(rst_n),
    .center_freq_word(center_freq_word),
    .pi_control_in(pi_control_in),
    .phase_out(phase_out)
);
 
endmodule
