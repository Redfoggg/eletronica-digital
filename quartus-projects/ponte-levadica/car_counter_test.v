module testCarCout;

  reg  CarIn, CarOut, Clk, Reset;
  wire ExistCar;

  CarCounter DUT (
    .CarIn(CarIn),
    .CarOut(CarOut),
    .ExistCar(ExistCar),
    .Clk(Clk),
    .Reset(Reset)
  );



  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
	Reset = 1;
  	Clk = 0;
    CarIn = 0;
    CarOut = 0;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);


    CarIn = 1;
    CarOut = 0;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);

    CarIn = 1;
    CarOut = 0;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);



    CarIn = 1;
    CarOut = 0;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);

    CarIn = 0;
    CarOut = 0;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);

    CarIn = 0;
    CarOut = 0;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
     CarIn, CarOut, ExistCar);



    CarIn = 0;
    CarOut = 1;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);

    CarIn = 0;
    CarOut = 1;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);

    CarIn = 0;
    CarOut = 1;

    toggle_Clock;
    $display("carIn: %0h, carOut: %0h, existCar: %0h",
      CarIn, CarOut, ExistCar);
   end

  task toggle_Clock;
    begin
      #5 Clk = ~Clk;
      #5 Clk = ~Clk;
    end
  endtask

endmodule
