class my_transaction extends uvm_sequence_item;

  `uvm_object_utils(my_transaction)

  rand bit ss;
  rand int mosi;
  rand int miso;

  //constraint c_addr { addr >= 0; addr < 256; }
  //constraint c_data { data >= 0; data < 256; }

  function new (string name = "");
    super.new(name);
  endfunction

endclass: my_transaction

class my_sequence extends uvm_sequence#(my_transaction);

  `uvm_object_utils(my_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  task body;
    repeat(8) begin
      req = my_transaction::type_id::create("req");
      start_item(req);

      if (!req.randomize()) begin
        `uvm_error("MY_SEQUENCE", "Randomize failed.");
      end

      
      finish_item(req);
    end
  endtask: body

endclass: my_sequence
