module imgencr(outbyte,inbyte,threshold,value,select,clk);
// declaring the inputs and the outputs 
output reg [0:7] outbyte;
input wire [0:7] inbyte;
input wire [0:7] threshold;
input wire [0:7] value;
input wire [0:1] select;
input wire clk ;


always @(posedge clk)
begin 
case(select)
    2'b00: outbyte = (inbyte>(8'b11111111 - value )) ? (8'b11111111):(inbyte+value) ;
    2'b01: outbyte = (inbyte < value) ? (8'b00000000) : (inbyte-value) ;
    2'b10: outbyte = (inbyte > threshold) ? (8'b11111111) : (8'b00000000) ;
    2'b11: outbyte = 8'b11111111 - inbyte ;
endcase
end

endmodule