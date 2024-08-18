`timescale 1ns/1ns
`include "dual_port_ram.sv"

module dual_port_ram_tb;
reg [7:0]data_a;
reg [7:0]data_b;
reg [5:0]addr_a;
reg [5:0]addr_b;
reg clock;
reg we_a;
reg we_b;
wire [7:0]q_a;
wire [7:0]q_b;
dual_port_ram dpr1(
    .data_in_a(data_a),
    .data_in_b(data_b),
    .addr_a(addr_a),
    .addr_b(addr_b),
    .clock(clock),
    .we_a(we_a),
    .we_b(we_b),
    .q_a(q_a),
    .q_b(q_b));

initial 
begin
  $dumpfile("dual_port_ram_tb.vcd");
  $dumpvars(0,dual_port_ram_tb);  

  clock = 1'b1;
  forever #5 clock = ~clock;   
end

initial 
begin
  data_a = 8'h33; 
  data_b = 8'h44; 
  addr_a = 6'h00;
  addr_b = 6'h01;
  we_a = 1'b1;
  we_b = 1'b1;
  #10;

  data_a = 8'h55;
  addr_a = 6'h02;
  addr_b = 6'h01;
  we_b = 1'b0;
  #10;

  addr_a = 6'h02;  
  addr_b = 6'h03;    
  we_a = 1'b0;
  #10;
  
  addr_a = 6'h01;
  data_b = 8'h77;
  addr_b = 6'h02;
  we_b = 1'b1;
  #10;    
end

initial 
begin
   #40 $finish; 
end    
endmodule