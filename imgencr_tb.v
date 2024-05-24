`timescale 1ns/1ns
`include "imgencr.v"
module testbench_1();
reg [0:7] inbyte;
reg [0:7] threshold;
reg [0:7] value;
reg [0:1] select;
reg clk ;
wire [0:7] outbyte;
integer i=0;
integer fd;
reg [0:7] data_in [0:102399];
reg [0:7] data_out [0:102399];

pixel_operator po1(outbyte,inbyte,threshold,value,select,clk);

initial 
begin 
// code for the output file 
fd=$fopen("outputa.txt","w");
//instantiation clk 
clk = 1'b0;
// this is for reading the input text file 
$readmemh("ichip22_ps1_image_text.txt", data_in);
end

always 
begin 
#10 clk=~clk ;
end

initial 
begin 
i=0;
value=60;
threshold=160;
select=3;
//looping through all data

while(i<102399)

begin
inbyte=data_in[i];
#20
data_out[i]=outbyte;
i=i+1;

end

i=0;
//looping for saving all data
while(i<102399)
begin
$fwriteh(fd,data_out[i]);
$fwrite(fd," ");
i=i+1;
end
 
$finish;
end

endmodule
