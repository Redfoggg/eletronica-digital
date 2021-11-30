module drawbridge_test;

  reg  Clk, CAIN, CAO, MD, PB, BS, H, L, Reset;
  wire MT, AL, TFL;
  wire [1:0] State;
  
  DrawBridge DUT(.Clk(Clk),
         .Reset(Reset),
         .CAIN(CAIN),
         .CAO(CAO),
         .MD(MD),
         .PB(PB),
         .BS(BS),
         .H(H),
         .L(L),
         .MT(MT),
         .AL(AL),
         .TFL(TFL),
         .State(State));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    //init
    Clk = 0;
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    Reset = 1'b1;
    toggle_Clock;
    $display("Sensors'0000001 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    
    //---------------------------- Automatic flow test run begin ----------------------------------------
    //One car goes on the bridge
    CAIN = 1'b1;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    toggle_Clock;
    $display("Sensors'1000001 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //One cars left the bridge and a boat shows up, on Flat state begining to lift the bridge
    CAIN = 1'b0;
    CAO = 1'b1;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b0;
    L = 1'b1;
    toggle_Clock;
    $display("Sensors'0100101 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Transition from Flat to Lifting state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000100 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Mantain Lifting state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000100 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Transition from Lifting to Upright state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000110 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    
    //Mantain Upright state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000110 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //boat goes through it's path, on Uprigth state begining to lift the bridge
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000010 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Transition from Uprigth to Lowering state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000000 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    
    //Mantain Lowering state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000000 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Alarm, impossible high sensor active on Lowering state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0000010 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    
    //Transition from Lowering to Flat state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b0;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    toggle_Clock;
    $display("Sensors'0000000 MT: %0h, AL: %0h, TFL: %0h, State: %d \n", MT, AL, TFL, State);
    
    //---------------------------- Automatic flow test run end ------------------------------------------
    
    $display("End automatic flow \n");
        
    //---------------------------- Manual flow test run begin ----------------------------------------
    
    $display("Begin manual flow \n");
    //init
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    Reset = 1'b1;
    toggle_Clock;
    $display("Sensors'0010001 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //One car goes on the bridge, and the power button is pressed
    CAIN = 1'b1;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b1;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    toggle_Clock;
    $display("Sensors'0010101 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);

    //With car on the bridge, the power button is pressed
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b1;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    toggle_Clock;
    $display("Sensors'0010101 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //One cars left the bridge and the power button is pressed, on Flat state begining to lift the bridge
    CAIN = 1'b0;
    CAO = 1'b1;
    MD = 1'b1;
    PB = 1'b1;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    toggle_Clock;
    $display("Sensors'0111001 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Transition from Flat to Lifting state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0010000 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Mantain Lifting state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0010100 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Transition from Lifting to Upright state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0010110 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    
    //Mantain Upright state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b1;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0010110 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //boat goes through it's path, on Uprigth state begining to lift the bridge
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b1;
    BS = 1'b0;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0011010 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Transition from Uprigth to Lowering state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0010000 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    
    //Mantain Lowering state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0010000 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    //Alarm, impossible high sensor active on Lowering state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b1;
    L = 1'b0;
    toggle_Clock;
    $display("Sensors'0010010 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    
    
    //Transition from Lowering to Flat state
    CAIN = 1'b0;
    CAO = 1'b0;
    MD = 1'b1;
    PB = 1'b0;
    BS = 1'b0;
    H = 1'b0;
    L = 1'b1;
    toggle_Clock;
    $display("Sensors'0010001 MT: %0h, AL: %0h, TFL: %0h, State: %d", MT, AL, TFL, State);
    $display("End manual flow \n");
    //---------------------------- Manual flow test run end ------------------------------------------
    
   end
  
  task toggle_Clock;
    begin
      #5 Clk = ~Clk;
      #5 Clk = ~Clk;
    end
  endtask
  
endmodule