`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 22:36:38
// Design Name: 
// Module Name: aes_addroundkey
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


module aes_addroundkey(

input  wire [127:0] state_in,
    input  wire [127:0] round_key,

    output wire [127:0] state_out

    );
    
     assign state_out = state_in ^ round_key;
endmodule
