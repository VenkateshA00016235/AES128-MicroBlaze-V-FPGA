`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 00:07:45
// Design Name: 
// Module Name: aes_sbox_tb
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




module aes_sbox_tb;

    reg  [7:0] data_in;
    wire [7:0] data_out;

    integer errors;

    
    aes_sbox dut (
        .data_in  (data_in),
        .data_out (data_out)
    );

 
    task check_sbox;
        input [7:0] test_input;
        input [7:0] expected_output;
        begin
            data_in = test_input;
            #10;

            if (data_out === expected_output) begin
                $display(
                    "PASS: input = %h, output = %h",
                    data_in,
                    data_out
                );
            end
            else begin
                $display(
                    "FAIL: input = %h, expected = %h, actual = %h",
                    data_in,
                    expected_output,
                    data_out
                );

                errors = errors + 1;
            end
        end
    endtask

    initial begin
        errors  = 0;
        data_in = 8'h00;

      
        check_sbox(8'h00, 8'h63);
        check_sbox(8'h53, 8'hED);
        check_sbox(8'h7C, 8'h10);
        check_sbox(8'hFF, 8'h16);

        if (errors == 0)
            $display("AES S-Box test completed: ALL TESTS PASSED");
        else
            $display(
                "AES S-Box test completed: %0d TEST(S) FAILED",
                errors
            );

        $finish;
    end

endmodule
