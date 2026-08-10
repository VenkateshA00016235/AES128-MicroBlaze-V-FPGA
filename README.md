# Design and Performance Evaluation of an AES-128 Hardware Accelerator in a MicroBlaze V FPGA System

## Overview

This project represents the design, implementation, and performance evaluation of an AES-128 hardware accelerator integrated with a MicroBlaze V soft processor on a Zybo FPGA platform.

The project implements AES-128 encryption in both hardware and software to analyze the benefits of the hardware acceleration. The designed AES-128 hardware accelerator is connected to the MicroBlaze V processor through an AXI4-Lite interface, enabling the processor to do encryption operations to dedicated hardware.

Performance is calculated by measuring execution cycles, latency, throughput, and hardware acceleration speedup using an AXI Timer. Functional verification is performed by comparing the hardware-generated ciphertext with the software implementation.

---

## Project Objectives

The objectives of this project are:

- Design an AES-128 encryption core using Verilog HDL.
- Package the AES core as a custom AXI4-Lite peripheral.
- Integrate the accelerator into a MicroBlaze V FPGA system.
- Develop a software AES-128 implementation for comparison.
- Measure execution cycles, latency, throughput, and speedup.
- Verify that the hardware and software implementations produce same ciphertext.


# Development Tools
* AMD Vivado
* AMD Vitis
* MicroBlaze V
* Verilog HDL
* C
* AXI4-Lite
* AXI Timer
* MDM JTAG UART
* XSDB

# System Architecture

The FPGA system contains  of the following major components:

* MicroBlaze V soft RISC-V processor
* Local BRAM for instruction and data memory
* AXI SmartConnect for peripheral interconnection
* Personalized AES-128 AXI4-Lite Hardware Accelerator
* AXI Timer for performance measurement
* MDM JTAG UART for user interaction
* Clock and reset system

The processor communicates with the AES hardware accelerator through an AXI4-Lite memory-mapped interface. Plaintext and encryption keys are written to the accelerator registers, the encryption operation is initiated through a control register, and the resulting ciphertext is read back after completion.




                           User / JTAG UART
                                  |
                                  v
                         +------------------+
                         |   MicroBlaze V   |
                         +--------+---------+
                                  |
                             AXI4-Lite Bus
                                  |
                 +----------------+----------------+
                 |                                 |
                 v                                 v
        +----------------------+          +------------------+
        |   AES-128 AXI IP     |          |    AXI Timer     |
        |                      |          |                  |
        |  Input Registers     |          |  Cycle Counter   |
        |  ----------------    |          +------------------+
        |  Plaintext[127:0]    |
        |  Key[127:0]          |
        |                      |
        |  AES-128 Core        |
        |                      |
        |  Output Registers    |
        |  ----------------    |
        |  Ciphertext[127:0]   |
        |                      |
        |  Control / Status    |
        +----------+-----------+
                   |
                   v
          Ciphertext read by
            MicroBlaze V
                   |
                   v
             JTAG Terminal

             
# Hardware Design

The hardware accelerator is implemented in Verilog HDL and integrated into the FPGA system as a custom AXI4-Lite peripheral.

The design is divided into three major components:

1. AES-128 Encryption Core

The encryption core implements the standard AES-128 algorithm contains:

- SubBytes
- ShiftRows
- MixColumns
- AddRoundKey
- Key Expansion

Encryption is performed using:

- Initial AddRoundKey
- Nine standard AES rounds
- One final round without MixColumns

The accelerator accepts:

- 128-bit plaintext
- 128-bit secret key

and produces a:

- 128-bit ciphertext


2. AXI4-Lite Interface

The AES encryption core is wrapped with an AXI4-Lite slave interface, allowing the MicroBlaze V processor to communicate with the hardware accelerator using memory-mapped registers.

The MicroBlaze V processor first writes the 128-bit plaintext and 128-bit AES key into four 32-bit registers each. Then starts the accelerator through the control register. After the status register indicates completion, the processor reads the 128-bit ciphertext from four 32-bit output registers.

The register map includes:

| Register               | Description                    |
|------------------------|--------------------------------|
| Plaintext Registers    | 128-bit input data             |
| Key Registers          | 128-bit encryption key         |
| Ciphertext Registers   | 128-bit encrypted output       |
| Control Register       | Starts encryption              |
| Status Register        | Indicates encryption completion|

The AES AXI peripheral is mapped at:

```text
0x80000000
```

3. Performance Measurement

Performance evaluation is performed using an AXI Timer operating at:

```text
100 MHz
```

The timer is used to measure:

- Hardware execution cycles
- Software execution cycles
- Encryption latency
- Throughput
- Hardware acceleration speedup


# Software Applications

Three standalone software applications are created to demonstrate and evaluate the AES-128 hardware accelerator.

## AES128_HW

This application performs AES-128 encryption using only the custom hardware accelerator implemented in programmable logic.


- Interactive plaintext and key input through the JTAG UART
- Hardware AES-128 encryption
- Execution cycle measurement
- Latency calculation
- Throughput calculation



## AES128_SW

This application executes the complete AES-128 algorithm in software on the MicroBlaze V processor.


- Interactive plaintext and key input
- Software AES-128 encryption
- Execution cycle measurement
- Latency calculation
- Throughput calculation


## AES128_Comparison

This application executes both the hardware and software implementations using same input.

It performs:

- Hardware encryption
- Software encryption
- Ciphertext verification
- Execution cycle comparison
- Latency comparison
- Throughput comparison
- Hardware acceleration speedup calculation

The application verifies that both implementations produce the same ciphertext before reporting the measured performance.

# Repository Structure

```text
AES128-MicroBlaze-V-FPGA/
│
├── 01_Software_AES128/
│   ├── AES128_Platform/        # Vitis platform for project
│   ├── AES128_HW/              # Hardware AES-128 application
│   ├── AES128_SW/              # Software AES-128 application
│   └── AES128_Comparison/      # Hardware vs Software comparison application
│
├── 02_Hardware_Verilog/
│   └── AES128_Core/            # Verilog implementation of AES-128
│
├── 03_AXI_Integration/
│   └── AES128_AXI_IP/          # Custom AXI4-Lite peripheral
│
├── 04_Vivado_Project/
│   └── AES128_MicroBlazeV/     # Vivado RISC-V Based FPGA project 
│
├── 05_Results/
│   ├── Hardware/
│   ├── Software/
│   ├── Comparison/
│   └── Performance/
│
├── 06_Documentation/
│   ├── Images/
│   ├── Block_Diagrams/
│   ├── Presentation/
│   └── Report/
│
└── README.md
```



# Running the Project


The project was developed using:

- AMD Vivado
- AMD Vitis
- MicroBlaze V
- XSDB
- Zybo FPGA Board (or compatible FPGA platform)


## Build Procedure

1. Open the Vivado project.
2. Generate the bitstream.
3. Export the hardware platform (`.xsa`)file.
4. Open the Vitis workspace and check the correct (`.xsa`)file is updated at platform settings before build.
5. Build the platform project.
6. Build one of the following applications:
   - `AES128_HW`
   - `AES128_SW`
   - `AES128_Comparison`


## Programming the FPGA

Program the FPGA with the generated bitstream `.BIT` file  before downloading the application ELF.


## Running an Application

Open XSDB and connect to the target:

```tcl
connect
targets
```

Open the jtag terminal at microblaze V to see the output :

```tcl
targets 6
jtagterminal     (A jtag terminal will open)
```

Select the MicroBlaze V processor (Hart#0):

```tcl
targets 7
```

Reset the processor:

```tcl
rst -processor
```

Download the required application.

### Hardware Application

```tcl
dow "D:/AES128-MicroBlaze-V-FPGA/01_Software_AES128/AES128_HW/build/AES128_HW.elf"
```

### Software Application

```tcl
dow "D:/AES128-MicroBlaze-V-FPGA/01_Software_AES128/AES128_SW/build/AES128_SW.elf"
```

### Comparison Application

```tcl
dow "D:/AES128-MicroBlaze-V-FPGA/01_Software_AES128/AES128_Comparison/build/AES128_Comparison.elf"
```

Run the application:

```tcl
con
```

The application communicates through the MDM JTAG UART terminal, where the user enters the plaintext and encryption key in hexadecimal format.


# Performance Results

The AES-128 hardware accelerator was calculated against a software implementation running on the MicroBlaze V processor. Performance was measured using the AXI Timer operating at 100 MHz.

Here the measured hardware execution time includes:

- Writing plaintext through AXI4-Lite
- Writing the AES-128 key
- Starting the hardware accelerator
- Polling the completion status
- Reading the ciphertext back to MicroBlaze V

Therefore, the reported performance represents end-to-end application execution, rather than only the internal AES encryption core. The output at the terminal look like below.


+------------------------------------------+-----------------------------------------------+


             AES-128 HW/SW Comparison 
             Enter Plaintext (32 hex chars): 01234567890123456789012345678901 
             13579135791357            Enter Key (32 hex chars): 98765432109876543210987654321098 
             8642086420864208 

             Hardware Ciphertext = 3CBBDFFDF030FB2628254B2E4441281B 
             Software Ciphertext = 3CBBDFFDF030FB2628254B2E4441281B 

             Verification = MATCH 

             Performance Results : 
             Hardware cycles = 1196 
             Software cycles = 39868 
             Hardware latency = 11.960 us 
             Software latency = 398.680 us 
             Hardware throughput = 10.702 Mbps 
             Software throughput = 0.321 Mbps 
             Speedup = 33.33x 

               END
+------------------------------------------------+---------------------------------------+

