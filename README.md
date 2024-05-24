# Image-control-verilog
Controls and basic functions on manipulation of images
Here we are going to implement a verilog code to manipulate image brightness by increasing,decreasing,thersholding and inverting an image based on select statement.
We are also going to implement 2 functions namely read and open seperately if we are processing in vscode as default library does'nt contain the functions.
we can proceed without them in other softwares such as VIVADO XLINX

For running this code in VS CODE run the following commands in power shell after adding the imgencr,imgencr_tb files:
iverilog -o imgencr_tb.vvp imgencr_tb.v
vvp imgencr_tb.vvp
