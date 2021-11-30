module testWaterPumpSystem;

  reg  Clock,S1,S2,S3,S4,Reset;
  wire B1,B2;

  WaterPumpSystem DUT(.Clock(Clock),
         .Reset(Reset),
          .S1(S1),
          .S2(S2),
          .S3(S3),
          .S4(S4),
          .B1(B1),
          .B2(B2));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

  	Clock = 0;
    S1 = 0;
    S2 = 0;
    S3 = 0;
    S4 = 0;
    toggle_Clock;
    $display("Sensors'0000 B1: %0h, B2: %0h",
      B1, B2);

    S1 = 1;
    toggle_Clock;
    $display("Sensors'0001 B1: %0h, B2: %0h",
      B1, B2);

    S1 = 1;
    S2 = 1;
    toggle_Clock;
    $display("Sensors'0011 B1: %0h, B2: %0h",
      B1, B2);

    S1 = 1;
    S2 = 1;
    S3 = 1;
    toggle_Clock;
    $display("Sensors'0111: %0h, B2: %0h",
      B1, B2);

    S1 = 1;
    S2 = 1;
    S3 = 1;
    S4 = 1;
    toggle_Clock;
    $display("Sensors'1111: %0h, B2: %0h",
      B1, B2);

    S1 = 0;
    S2 = 1;
    S3 = 0;
    S4 = 1;
    toggle_Clock;
    $display("Sensors'1010: %0h, B2: %0h",
      B1, B2);

    S1 = 0;
    S2 = 0;
    S3 = 0;
    S4 = 1;
    toggle_Clock;
    $display("Sensors'1000: %0h, B2: %0h",
      B1, B2);



   end

  task toggle_Clock;
    begin
      #5 Clock = ~Clock;
      #5 Clock = ~Clock;
    end
  endtask

endmodule
