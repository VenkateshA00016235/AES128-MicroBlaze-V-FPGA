`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2026 14:52:09
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



module aes_axi_slave (
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

    // -------------------------------------------------------------------------
    // Register map
    // -------------------------------------------------------------------------
    localparam [7:0] ADDR_PTEXT0 = 8'h00;
    localparam [7:0] ADDR_PTEXT1 = 8'h04;
    localparam [7:0] ADDR_PTEXT2 = 8'h08;
    localparam [7:0] ADDR_PTEXT3 = 8'h0C;

    localparam [7:0] ADDR_KEY0   = 8'h10;
    localparam [7:0] ADDR_KEY1   = 8'h14;
    localparam [7:0] ADDR_KEY2   = 8'h18;
    localparam [7:0] ADDR_KEY3   = 8'h1C;

    localparam [7:0] ADDR_CTEXT0 = 8'h20;
    localparam [7:0] ADDR_CTEXT1 = 8'h24;
    localparam [7:0] ADDR_CTEXT2 = 8'h28;
    localparam [7:0] ADDR_CTEXT3 = 8'h2C;

    localparam [7:0] ADDR_CONTROL = 8'h30;
    localparam [7:0] ADDR_STATUS  = 8'h34;

    // CONTROL register bits:
    // bit 0 = START
    //
    // STATUS register bits:
    // bit 0 = DONE

    // -------------------------------------------------------------------------
    // Plaintext and key registers
    // -------------------------------------------------------------------------
    reg [31:0] plaintext0;
    reg [31:0] plaintext1;
    reg [31:0] plaintext2;
    reg [31:0] plaintext3;

    reg [31:0] key0;
    reg [31:0] key1;
    reg [31:0] key2;
    reg [31:0] key3;

    // Registered ciphertext
    reg [31:0] ciphertext0;
    reg [31:0] ciphertext1;
    reg [31:0] ciphertext2;
    reg [31:0] ciphertext3;

    reg done_reg;

    wire [127:0] plaintext_bus;
    wire [127:0] key_bus;
    wire [127:0] ciphertext_comb;

    assign plaintext_bus = {
        plaintext0,
        plaintext1,
        plaintext2,
        plaintext3
    };

    assign key_bus = {
        key0,
        key1,
        key2,
        key3
    };

    // -------------------------------------------------------------------------
    // Combinational AES-128 encryption core
    // -------------------------------------------------------------------------
    aes_encrypt_core aes_core (
        .plaintext  (plaintext_bus),
        .key        (key_bus),
        .ciphertext (ciphertext_comb)
    );

    // -------------------------------------------------------------------------
    // AXI4-Lite write-channel storage
    // Address and write data may arrive on different cycles.
    // -------------------------------------------------------------------------
    reg [31:0] awaddr_reg;
    reg        awaddr_valid;

    reg [31:0] wdata_reg;
    reg [3:0]  wstrb_reg;
    reg        wdata_valid;

    reg [1:0]  bresp_reg;
    reg        bvalid_reg;

    assign s_axi_awready = !awaddr_valid && !bvalid_reg;
    assign s_axi_wready  = !wdata_valid && !bvalid_reg;

    assign s_axi_bresp  = bresp_reg;
    assign s_axi_bvalid = bvalid_reg;

    // Apply AXI byte-write strobes
    function [31:0] apply_wstrb;
        input [31:0] old_value;
        input [31:0] new_value;
        input [3:0]  write_strobe;
        integer byte_index;
        begin
            apply_wstrb = old_value;

            for (byte_index = 0; byte_index < 4; byte_index = byte_index + 1) begin
                if (write_strobe[byte_index]) begin
                    apply_wstrb[(byte_index * 8) +: 8] =
                        new_value[(byte_index * 8) +: 8];
                end
            end
        end
    endfunction

    always @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            awaddr_reg   <= 32'b0;
            awaddr_valid <= 1'b0;

            wdata_reg    <= 32'b0;
            wstrb_reg    <= 4'b0;
            wdata_valid  <= 1'b0;

            bresp_reg    <= 2'b00;
            bvalid_reg   <= 1'b0;

            plaintext0   <= 32'b0;
            plaintext1   <= 32'b0;
            plaintext2   <= 32'b0;
            plaintext3   <= 32'b0;

            key0         <= 32'b0;
            key1         <= 32'b0;
            key2         <= 32'b0;
            key3         <= 32'b0;

            ciphertext0  <= 32'b0;
            ciphertext1  <= 32'b0;
            ciphertext2  <= 32'b0;
            ciphertext3  <= 32'b0;

            done_reg     <= 1'b0;
        end
        else begin
            // Capture AXI write address.
            if (s_axi_awvalid && s_axi_awready) begin
                awaddr_reg   <= s_axi_awaddr;
                awaddr_valid <= 1'b1;
            end

            // Capture AXI write data.
            if (s_axi_wvalid && s_axi_wready) begin
                wdata_reg   <= s_axi_wdata;
                wstrb_reg   <= s_axi_wstrb;
                wdata_valid <= 1'b1;
            end

            // Perform write after both address and data are available.
            if (awaddr_valid && wdata_valid && !bvalid_reg) begin
                case (awaddr_reg[7:0])
                    ADDR_PTEXT0:
                        plaintext0 <= apply_wstrb(
                            plaintext0,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_PTEXT1:
                        plaintext1 <= apply_wstrb(
                            plaintext1,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_PTEXT2:
                        plaintext2 <= apply_wstrb(
                            plaintext2,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_PTEXT3:
                        plaintext3 <= apply_wstrb(
                            plaintext3,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_KEY0:
                        key0 <= apply_wstrb(
                            key0,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_KEY1:
                        key1 <= apply_wstrb(
                            key1,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_KEY2:
                        key2 <= apply_wstrb(
                            key2,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_KEY3:
                        key3 <= apply_wstrb(
                            key3,
                            wdata_reg,
                            wstrb_reg
                        );

                    ADDR_CONTROL: begin
                        // Capture the current combinational AES result
                        // when CONTROL.START is written as 1.
                        if (wstrb_reg[0] && wdata_reg[0]) begin
                            ciphertext0 <= ciphertext_comb[127:96];
                            ciphertext1 <= ciphertext_comb[95:64];
                            ciphertext2 <= ciphertext_comb[63:32];
                            ciphertext3 <= ciphertext_comb[31:0];

                            done_reg <= 1'b1;
                        end
                    end

                    default: begin
                        // Unsupported writes are ignored.
                    end
                endcase

                awaddr_valid <= 1'b0;
                wdata_valid  <= 1'b0;

                bresp_reg  <= 2'b00; // AXI OKAY
                bvalid_reg <= 1'b1;
            end

            // Complete the AXI write response.
            if (bvalid_reg && s_axi_bready) begin
                bvalid_reg <= 1'b0;
            end

            // Clear DONE when software begins changing input data.
            if (awaddr_valid && wdata_valid && !bvalid_reg) begin
                case (awaddr_reg[7:0])
                    ADDR_PTEXT0,
                    ADDR_PTEXT1,
                    ADDR_PTEXT2,
                    ADDR_PTEXT3,
                    ADDR_KEY0,
                    ADDR_KEY1,
                    ADDR_KEY2,
                    ADDR_KEY3:
                        done_reg <= 1'b0;

                    default: begin
                    end
                endcase
            end
        end
    end

    // -------------------------------------------------------------------------
    // AXI4-Lite read channel
    // -------------------------------------------------------------------------
    reg [31:0] rdata_reg;
    reg [1:0]  rresp_reg;
    reg        rvalid_reg;

    assign s_axi_arready = !rvalid_reg;
    assign s_axi_rdata   = rdata_reg;
    assign s_axi_rresp   = rresp_reg;
    assign s_axi_rvalid  = rvalid_reg;

    always @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            rdata_reg  <= 32'b0;
            rresp_reg  <= 2'b00;
            rvalid_reg <= 1'b0;
        end
        else begin
            if (s_axi_arvalid && s_axi_arready) begin
                case (s_axi_araddr[7:0])
                    ADDR_PTEXT0: rdata_reg <= plaintext0;
                    ADDR_PTEXT1: rdata_reg <= plaintext1;
                    ADDR_PTEXT2: rdata_reg <= plaintext2;
                    ADDR_PTEXT3: rdata_reg <= plaintext3;

                    ADDR_KEY0: rdata_reg <= key0;
                    ADDR_KEY1: rdata_reg <= key1;
                    ADDR_KEY2: rdata_reg <= key2;
                    ADDR_KEY3: rdata_reg <= key3;

                    ADDR_CTEXT0: rdata_reg <= ciphertext0;
                    ADDR_CTEXT1: rdata_reg <= ciphertext1;
                    ADDR_CTEXT2: rdata_reg <= ciphertext2;
                    ADDR_CTEXT3: rdata_reg <= ciphertext3;

                    ADDR_CONTROL:
                        rdata_reg <= 32'b0;

                    ADDR_STATUS:
                        rdata_reg <= {
                            31'b0,
                            done_reg
                        };

                    default:
                        rdata_reg <= 32'b0;
                endcase

                rresp_reg  <= 2'b00; // AXI OKAY
                rvalid_reg <= 1'b1;
            end

            if (rvalid_reg && s_axi_rready) begin
                rvalid_reg <= 1'b0;
            end
        end
    end

endmodule