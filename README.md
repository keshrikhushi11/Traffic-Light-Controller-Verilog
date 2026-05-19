# Traffic-Light-Controller-Verilog
FSM-based traffic light controller with emergency vehicle override simulation designed in Verilog.

# Traffic Light Controller with Emergency Override

A smart, Finite State Machine (FSM)-based traffic management system designed using Verilog HDL. This hardware logic prioritizes emergency vehicle lanes while maintaining an efficient cycle for regular traffic.

## Project Features
- **Automatic FSM Control:** Smoothly cycles through normal operations (Green → Yellow → Red).
- **Emergency Override:** Instantly triggers green signals for emergency vehicles (e.g., ambulances, fire trucks), forcing opposing roads to a safe red signal state.
- **Resource Optimized:** Fully synchronous architecture ideal for modern VLSI implementation.

## Architectural Design
- **Inputs:** Clock (`clk`), Reset (`rst`), Emergency Signal (`emergency`)
- **Internal Units:** 4-bit Counter Timer, FSM Sequencing Controller
- **Outputs:** Highway Lights (`highway [2:0]`), Side Road Lights (`side_road [2:0]`)

## Simulation and Waveform Results
The project logic was fully simulated and verified online via **EDA Playground** using the **Icarus Verilog** simulator.

### Verified Simulation Output Waveform:


## Verification Environment
- **Development Tool:** EDA Playground
- **Language:** Verilog HDL
- **Simulation Engine:** Icarus Verilog
- **Waveform Viewer:** EPWave
-
