/*******************************************
This codeblock is derived from:
https://www.youtube.com/watch?v=Qn6SvG-Kya0

More information can be found on Cagri Aksoy's 
github pg:
https://github.com/mcagriaksoy/simple-spi-vip/

*******************************************/

`include "uvm_macros.svh"
`include "my_testbench_pkg.svh"

module top;
  import uvm_pkg::*;
  import my_testbench_pkg::*;
  

  dut_if dut_if1();
  dut dut1(.dif(dut_if1));
  
  // Clock generator
  initial begin
    dut_if1.clock = 0;
    forever #5 dut_if1.clock = ~dut_if1.clock;
  end
  
  initial begin
    // Place the interface into the UVM configuration database
    uvm_config_db#(virtual dut_if)::set(null, "*", "dut_vif", dut_if1);
    
    
    // MY TEST START:
    run_test("my_test");
  end
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top);
  end
  
endmodule
