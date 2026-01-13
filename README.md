1. Overview

This project implements a hardware approximation unit for the exponential function using the CORDIC algorithm, designed in VHDL at RTL level.

The design adopts an FSMD architecture, separating the Datapath and the Finite State Machine (FSM) to improve clarity, scalability, and verification efficiency.

The system operates on 16-bit fixed-point Q3.13 format, making it suitable for resource-constrained FPGA/ASIC designs and ML/DSP workloads such as activation functions and normalization layers.

2. FSMD
<img width="766" height="1296" alt="cordic-Trang-7 drawio (1)" src="https://github.com/user-attachments/assets/78abd050-dc58-4d58-8bb9-0438114587bb" />

3. Datapath
<img width="2291" height="2529" alt="cordic-Trang-2 drawio (7)" src="https://github.com/user-attachments/assets/ac5b6578-9632-405c-8862-dfd2929f0999" />

4. FSM
<img width="706" height="1276" alt="cordic-Trang-6 drawio (2)" src="https://github.com/user-attachments/assets/ed220f86-77b1-4826-97f0-f590a59be05f" />
