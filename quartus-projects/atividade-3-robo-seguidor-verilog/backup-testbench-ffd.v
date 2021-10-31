module DFF_tb;

  // Inputs
  reg d, clk, reset, preset;

  // Outputs
  wire q, notq;

  ffd ffd(
    .q(q),
    .notq(notq),
    .d(d),
    .clk(clk),
    .reset(reset),
    .preset(preset)
  );

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);

    $display("Reset flop.");
    clk = 0;
    d = 1'bx;
    preset = 0;
    reset = 1;
    display_change_in_clock;

    $display("Release reset.");
    d = 1;
    clk = 1;
    reset = 0;
    display_change_in_clock;

    $display("Toggle clk.");
    clk = 1;
    d = 0;
    display_change_in_clock;

    $display("Change D but not clock.");
    clk = 0;
    d = 1;
    display_change_in_clock;

    #10000 $finish;
  end

  task display_change_in_clock;
    #10 $display("d:%0h, q:%0h, nq:%0h",
      d, q, nq);
  endtask

endmodule
