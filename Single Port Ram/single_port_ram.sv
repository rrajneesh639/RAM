`timescale 1ns/1ns
module single_port_RAM (
    input [7:0]data_in,
    input [5:0]addr,
    input we,
    input clock,
    output reg [7:0]q
);
    reg [7:0]ram[0:63];
    always @(posedge clock) 
    begin
      if (we) 
      begin
        ram[addr] <= data_in;
      end    
      else
        q <= ram[addr];
    end
endmodule