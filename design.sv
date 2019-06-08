// This is the SystemVerilog interface that we will use to connect
// our design to our UVM testbench.
interface dut_if;
  logic clock, reset;
  logic ss;
  logic [7:0] mosi;
  logic [7:0] miso;
endinterface

`include "uvm_macros.svh"

// This is our design module.
// 
// It is an empty design that simply prints a message whenever
// the clock toggles.

module dut(dut_if dif);
  import uvm_pkg::*;
  always @(posedge dif.clock)
    if (dif.reset != 1) begin
 	dif.miso = dif.mosi;	//simple loopback
      `uvm_info("DUT",
                $sformatf("--SLAVE SIDE--Received data from pin mosi: 0x%2h the miso pin will be: 0x%2h",dif.mosi, dif.miso), UVM_MEDIUM)

    end
endmodule
