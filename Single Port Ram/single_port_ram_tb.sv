`timescale 1ns/1ns
`include "single_port_ram.sv"

module single_port_RAM_tb;
reg [7:0]data;
reg [5:0]addr;
reg clock;
reg we;
wire [7:0]q;

single_port_RAM spr1(
    .data_in(data),
    .addr(addr),
    .we(we),
    .clock(clock),
    .q(q));

initial 
begin
  $dumpfile("ram_tb.vcd");
  $dumpvars(1,single_port_RAM_tb);

  clock = 1'b1;
  forever #5 clock = ~clock;    
end

initial 
begin
    data = 8'h01;
    addr = 6'd0;
    we = 1'b1;
    #10;

    data = 8'h02;
    addr = 6'd1;
    #10;

    data = 8'h03;
    addr = 6'd2;
    #10;

    addr = 6'd0;
    we = 1'b0;
    #10;

    addr = 6'd1;
    #10;

    addr = 6'd2;
    #10;

    data = 8'h04;
    addr = 6'd1;
    we = 1'b1;
    #10;

    addr = 6'd1;
    we = 1'b0;
    #10;
end

initial begin
    #80 $finish;
end
endmodule