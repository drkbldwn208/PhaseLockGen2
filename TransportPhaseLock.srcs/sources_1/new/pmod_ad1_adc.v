`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2026 12:26:54 PM
// Design Name: 
// Module Name: pmod_ad1_adc
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


module pmod_ad1_adc(
    input wire clk,
    input wire rst_n,
    
    input wire ad_en,
    
    output reg cs_n,
    output reg sclk,
    input wire sdata,
    
    output reg [11:0] m_axis_tdata = 12'h000,
    output reg m_axis_tvalid = 1'b0,
    input wire m_axis_tready,
    
    output reg out_sclk
    );
    
    reg [15:0] shift_reg = 16'h0000;
    reg [2:0] clk_div = 3'b0;
    
    always @(posedge clk) begin
        if (!rst_n) begin
            cs_n <= 1'b1;
            sclk <= 1'b0;
            m_axis_tdata <= 12'h000;
            m_axis_tvalid <= 1'b0;
            out_sclk <= 1'b0;
            shift_reg <= 16'h0000;
            clk_div <= 3'b0;
        end else begin 
            if (clk_div == 3'd3) begin
                sclk <= 1'b1;
                out_sclk <= 1'b1;
            end else if (clk_div == 3'd7) begin
                sclk <= 1'b0;
                out_sclk <= 1'b0;
            end 
        end 
    end
    
    always @(posedge sclk) begin 
     
                
            
    
endmodule
