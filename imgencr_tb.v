`timescale 1ns/1ns
`include "imgencr.v"
module imgencr_tb();
reg[0:7] ibyte;
wire [0:7] obyte;
reg clk;
reg [0:7] threshold;
reg [0:7] value;
reg [0:1] select;
integer i=0;
integer fd;
reg [0:7] data_in [0:250000];
reg [0:7] data_out[0:250000];
imgencr uut (obyte,ibyte,threshold,value,select,clk);
initial
begin
    fd=$open("output.txt","w");
    clk=1'b0;
    $readmeh("image_teta.txt",data_in);
end

always
begin

#10 clk=~clk;
end

initial
begin

i=0;
value=60;
threshold=120;
select=3;

while (i<250000) begin

ibyte = data_in[i]; // Accessing data_in[i] as a 1D array

#20
data_out[i]=obyte;
i=i+1;
end
i=0;
while(i<250000)
begin
    $fwriteh(fd,data_out[i]);
    $fwrite(fd," ");
    i=i+1;
end
$finish;
    
end
endmodule
