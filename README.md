# Microwave-Project 
This project focused on working a virtual microwave, displayed via Video Graphics Array (VGA), using an FPGA.  
Team members: Brian Lam, Michael Tolmajian, Sarah Su, Michael Nava

# About

This microwave has most functions that can be found on any modern microwave. It includes 14 switches to adjust a maximum cook time of 63 minutes, five [buttons](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_buttonMaster.v) to cycle through the power/heat levels and start/stop the cooking, 
7 Seven Segment Displays to display the current power and timer, and VGA and LEDs to display the cooking process.

### Resources
This project used both software and hardware.
1) Software
   - Xilinx Vivado Design Suite
   - Verilog Hardware Description Language
2) Hardware
   - Digilent Nexys A7-100T Trainer Board
   - External monitor for VGA use

### Peripherals
Using Xilinx's Vivado Design Suite, the group programmed the microwave controller via 6 of the FPGA's peripherals:
1) Buttons
2) Switches
3) Light-emitting diodes (LEDs)
4) Seven-segment displays
5) Video Graphics Arrays (VGAs)
6) Universal Asynchronous Receiver/Transmitter (UART)


# Buttons
The [buttons](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_buttonMaster.v) are designed using a straightforward state machine, in which the states are the cooking status and the power/heat levels.

Three of Nexys A7's five buttons were used to switch between and activate three different modes: Low, Normal, and High. A debouncing mechanic was integrated using Mealy finite state machines to remove excessive clicking/pressing. Debouncing is done by detecting the rising edge of a button-pressing signal and syncing it with the Nexys A7's internal clock.

# Switches
The [switches](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_7segMaster.v) are the binary equivalent of the timer clock that is displayed on the Seven Segment Displays. 

Twelve of the sixteen available switches were used to set the timer displayed. The 6 right side switches represent the timer's 'second' value, as the 6 left side switches represent the timer's 'minute' value. To choose the desired decimal number for each parameter, the switches must be configured in binary (base-2) representation.

# Seven Segment Displays
The [Seven Segment Displays](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_7segMaster.v) are used to display the power/heat level as well as the desired cooking time.

Six of the available eight seven-segment displays were used for display. The group allocated two to the mode status and four to the microwave timer. For the mode status, two seven-segment displays will display "Lo", "--", or "Hi" for Low, Normal, and High, respectively. For the timer, the four displays are split in half with one to represent minutes and the other to represent seconds. The timer updates every second, but the set of displays (or anodes) refreshes at 400 Hz.

# LEDs
The [LEDs](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_LEDMaster.v) on the board are used similarly to the cooking light in a modern microwave. When the microwave is currently cooking, the LEDs will bounce back and forth from right to left at a specific speed determined by the power/heat level.

All sixteen available unicolor diodes were used to give the Microwave Controller the "active" aesthetic. Using an up/down counter and 4-bit decoder, only one of the sixteen LEDs is set with the rest cleared. The counter allows the decoder to choose the emitting LED's adjacent as the next one. At a high clock rate, the user can view a "dot" moving from one side to the other endlessly across the 16 LEDs. 

# VGA
The [VGA](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_vgaMaster.v) output will display a Microwave image that is either ON or OFF depending on the state of the microwave on the board. This image is coded completely in hardware.

The one VGA adapter was used to display a picture of a two-dimensional microwave's interface. The screen was colored using the horizontal and vertical counting method. Boundaries for each microwave component, such as the segment display and microwave door, were identified using if-else statements. 

# UART
The [UART](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_UART.v) port was used to transmit data from the keyboard to the Nexys A7 FPGA. The UART peripheral use was rather simple. The project senses, using a terminal, when the user presses the 'Space' key on the keyboard. This would transmit the UART as an ASCII character of 8 bits in serial manner.
