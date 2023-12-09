# Microwave-Project 
This project is a fully functional microwave on a NEXYS A7 FPGA board. 

# About
This microwave has most functions that can be found on any modern microwave. It includes 14 switches to adjust a maximum cook time of 63 minutes, five [buttons](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_buttonMaster.v) to cycle through the power/heat levels and start/stop the cooking, 
7 Seven Segment Displays to display the current power and timer, and VGA and LEDs to display the cooking process.

# Buttons
The [buttons](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_buttonMaster.v) are designed using a straightforward state machine, in which the states are the cooking status and the power/heat levels.

# Switches
The [switches](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_7segMaster.v) are the binary equivalent of the timer clock that is displayed on the Seven Segment Displays. 

# Seven Segment Displays
The [Seven Segment Displays](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_7segMaster.v) are used to display the power/heat level as well as the desired cooking time

# LEDs
The [LEDs](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_LEDMaster.v) on the board are used similarly to the cooking light in a modern microwave. When the microwave is currently cooking, the LEDs will bounce back and forth from right to left at a specific speed determined by the power/heat level.

# VGA
The [VGA](https://github.com/ishwo0/Microwave-Project/blob/main/Code/Design%20Files%20(RTL)/top_vgaMaster.v) output will display a Microwave image that is either ON or OFF depending on the state of the microwave on the board. This image is coded completely in hardware.
