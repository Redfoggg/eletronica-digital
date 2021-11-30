module state_upright_test;

  reg  Clock,S1,S2,S3,S4, S5, S6,Reset;
  wire MT, AL, TFL;

  state_upright DUT(.Clock(Clock),
         .Reset(Reset),
         .S1(S1),
         .S2(S2),
         .S3(S3),
         .S4(S4),
         .S5(S5),
         .S6(S6),
         .MT(MT),
         .AL(AL),
         .TFL(TFL));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

  	Clock = 0;
    S1 = 1'b0;
    S2 = 1'b0;
    S3 = 1'b0;
    S4 = 1'b0;
    S5 = 1'b0;
    S6 = 1'b1;
    toggle_Clock;
    $display("Sensors'100000 MT: %0h, AL: %0h, TFL: %0h", MT, AL, TFL);

	S1 = 1'b0;
    S2 = 1'b1;
    S3 = 1'b1;
    S4 = 1'b0;
    S5 = 1'b1;
    S6 = 1'b0;
    toggle_Clock;
    $display("Sensors'010110 MT: %0h, AL: %0h, TFL: %0h", MT, AL, TFL);

    S1 = 1'b1;
    S2 = 1'b1;
    S3 = 1'b0;
    S4 = 1'b0;
    S5 = 1'b0;
    S6 = 1'b0;
    toggle_Clock;
    $display("Sensors'000011 MT: %0h, AL: %0h, TFL: %0h", MT, AL, TFL);

    S1 = 1'b0;
    S2 = 1'b1;
    S3 = 1'b1;
    S4 = 1'b0;
    S5 = 1'b0;
    S6 = 1'b0;
    toggle_Clock;
    $display("Sensors'000110 MT: %0h, AL: %0h, TFL: %0h", MT, AL, TFL);

	S1 = 1'b0;
    S2 = 1'b0;
    S3 = 1'b0;
    S4 = 1'b1;
    S5 = 1'b1;
    S6 = 1'b0;
    toggle_Clock;
    $display("Sensors'000110 MT: %0h, AL: %0h, TFL: %0h", MT, AL, TFL);

   	S1 = 1'b0;
    S2 = 1'b0;
    S3 = 1'b0;
    S4 = 1'b0;
    S5 = 1'b0;
    S6 = 1'b0;
    toggle_Clock;
    $display("Sensors'000000 MT: %0h, AL: %0h, TFL: %0h", MT, AL, TFL);


   end

  task toggle_Clock;
    begin
      #5 Clock = ~Clock;
      #5 Clock = ~Clock;
    end
  endtask

endmodule
