`timescale 1ns/1ns
module dual_port_ram (
    input [7:0]data_in_a,
    input [7:0]data_in_b,
    input [5:0]addr_a,
    input [5:0]addr_b,
    input clock,
    input we_a,
    input we_b,
    output reg [7:0]q_a,
    output reg [7:0]q_b
);
    reg [7:0]ram[0:63];
    always @(posedge clock) 
    begin
       if (we_a) 
          ram[addr_a] <= data_in_a;
       else
          q_a <= ram[addr_a];       
    end

    always @(posedge clock) 
    begin
       if(we_b)
          ram[addr_b] <= data_in_b;
       else
          q_b <= ram[addr_b];   
    end
endmodule