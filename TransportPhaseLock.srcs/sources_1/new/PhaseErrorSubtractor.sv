`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2026 02:44:43 PM
// Design Name: 
// Module Name: PhaseErrorSubtractor
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


module PhaseErrorSubtractor #(
    parameter int PHASE_WIDTH = 12
)(
    input logic clk,
    input logic rst_n,
    input logic signed [PHASE_WIDTH*8 - 1:0] phase_1_in,
    input logic signed [PHASE_WIDTH*8 - 1:0] phase_2_in,
    output logic signed [PHASE_WIDTH*8 -1:0] error_signal_out
);
    
    logic signed [PHASE_WIDTH - 1:0] phase_1_in_unfolded [7:0];
    logic signed [PHASE_WIDTH - 1:0] phase_2_in_unfolded [7:0];
    logic signed [PHASE_WIDTH*8 - 1:0] error_signal_out_reg;
    
    always @(posedge clk) begin
        if (!rst_n) begin
            for (int i = 0; i < 8; i++) begin
                phase_1_in_unfolded[i] <= 0;
                phase_2_in_unfolded[i] <= 0;
            end
        error_signal_out_reg <= 0;
        end
endmodule
