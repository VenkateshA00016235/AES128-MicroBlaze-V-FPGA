`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 23:33:09
// Design Name: 
// Module Name: aes_axi_slave
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


module aes_axi_slave(

    input  wire         s_axi_aclk,
    input  wire         s_axi_aresetn,

    input  wire [31:0]  s_axi_awaddr,
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,

    input  wire [31:0]  s_axi_wdata,
    input  wire [3:0]   s_axi_wstrb,
    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,

    output wire [1:0]   s_axi_bresp,
    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,

    input  wire [31:0]  s_axi_araddr,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,

    output wire [31:0]  s_axi_rdata,
    output wire [1:0]   s_axi_rresp,
    output wire         s_axi_rvalid,
    input  wire         s_axi_rready

    );
    
    
        // Plaintext registers
    reg [31:0] plaintext0;
    reg [31:0] plaintext1;
    reg [31:0] plaintext2;
    reg [31:0] plaintext3;

    // Key registers
    reg [31:0] key0;
    reg [31:0] key1;
    reg [31:0] key2;
    reg [31:0] key3;

    // Ciphertext
    wire [127:0] ciphertext;

    // Combine 32-bit registers into 128-bit buses
    wire [127:0] plaintext;
    wire [127:0] key;

    assign plaintext = {
        plaintext0,
        plaintext1,
        plaintext2,
        plaintext3
    };

    assign key = {
        key0,
        key1,
        key2,
        key3
    };

    // AES encryption core
    aes_encrypt_core aes_core (
        .plaintext(plaintext),
        .key(key),
        .ciphertext(ciphertext)
    );
    
    
        reg        axi_awready;
    reg        axi_wready;
    reg [1:0]  axi_bresp;
    reg        axi_bvalid;

    reg        axi_arready;
    reg [31:0] axi_rdata;
    reg [1:0]  axi_rresp;
    reg        axi_rvalid;

    assign s_axi_awready = axi_awready;
    assign s_axi_wready  = axi_wready;
    assign s_axi_bresp   = axi_bresp;
    assign s_axi_bvalid  = axi_bvalid;

    assign s_axi_arready = axi_arready;
    assign s_axi_rdata   = axi_rdata;
    assign s_axi_rresp   = axi_rresp;
    assign s_axi_rvalid  = axi_rvalid;
    
    
    
        always @(posedge s_axi_aclk) begin

        if (!s_axi_aresetn) begin

            axi_awready <= 1'b0;
            axi_wready  <= 1'b0;
            axi_bresp   <= 2'b00;
            axi_bvalid  <= 1'b0;

            plaintext0 <= 32'b0;
            plaintext1 <= 32'b0;
            plaintext2 <= 32'b0;
            plaintext3 <= 32'b0;

            key0 <= 32'b0;
            key1 <= 32'b0;
            key2 <= 32'b0;
            key3 <= 32'b0;

        end
        else begin

            axi_awready <= 1'b0;
            axi_wready  <= 1'b0;

            if (
                s_axi_awvalid &&
                s_axi_wvalid &&
                !axi_bvalid
            ) begin

                axi_awready <= 1'b1;
                axi_wready  <= 1'b1;

                case (s_axi_awaddr[7:0])

                    8'h00: plaintext0 <= s_axi_wdata;
                    8'h04: plaintext1 <= s_axi_wdata;
                    8'h08: plaintext2 <= s_axi_wdata;
                    8'h0C: plaintext3 <= s_axi_wdata;

                    8'h10: key0 <= s_axi_wdata;
                    8'h14: key1 <= s_axi_wdata;
                    8'h18: key2 <= s_axi_wdata;
                    8'h1C: key3 <= s_axi_wdata;

                    default: begin
                    end

                endcase

                axi_bresp  <= 2'b00;
                axi_bvalid <= 1'b1;

            end

            if (axi_bvalid && s_axi_bready)
                axi_bvalid <= 1'b0;

        end

    end
    
    
        always @(posedge s_axi_aclk) begin

        if (!s_axi_aresetn) begin

            axi_arready <= 1'b0;
            axi_rdata   <= 32'b0;
            axi_rresp   <= 2'b00;
            axi_rvalid  <= 1'b0;

        end
        else begin

            axi_arready <= 1'b0;

            if (s_axi_arvalid && !axi_rvalid) begin

                axi_arready <= 1'b1;

                case (s_axi_araddr[7:0])

                    8'h00: axi_rdata <= plaintext0;
                    8'h04: axi_rdata <= plaintext1;
                    8'h08: axi_rdata <= plaintext2;
                    8'h0C: axi_rdata <= plaintext3;

                    8'h10: axi_rdata <= key0;
                    8'h14: axi_rdata <= key1;
                    8'h18: axi_rdata <= key2;
                    8'h1C: axi_rdata <= key3;

                    8'h20: axi_rdata <= ciphertext[127:96];
                    8'h24: axi_rdata <= ciphertext[95:64];
                    8'h28: axi_rdata <= ciphertext[63:32];
                    8'h2C: axi_rdata <= ciphertext[31:0];

                    default: axi_rdata <= 32'b0;

                endcase

                axi_rresp  <= 2'b00;
                axi_rvalid <= 1'b1;

            end

            if (axi_rvalid && s_axi_rready)
                axi_rvalid <= 1'b0;

        end

    end
    
endmodule
