`include "CarsCounter.v"

module DrawBridge(Clk, Reset, CAIN, CAO, MD, PB, BS, H, L, MT, AL, TFL);
input Clk, Reset, CAIN, CAO, CIB, MD, PB, BS, H, L; // mode, powerButton, boatSensor, high, low
output reg MT, AL, TFL; // motor, alarm, trafficLigth
wire CIB; // carsInBridge

reg [1:0] State, FutureState;

parameter Flat = 2'b00,
          Lifting = 2'b01,
          Uprigth = 2'b10,
          Lowering = 2'b11;

CarCounter carCounter(.CarIn(CAIN), .CarOut(CAO), .ExistCar(CIB), .Clk(Clk), .Reset(Reset));

always @ (State)
begin
  FutureState = Flat;
  MT = 1'b0;
  AL = 1'b0;
  TFL = 1'b0;

  case (State)
    Flat: casez ({CIB, MD, PB, BS, H, L})
      6'b?0?001: begin
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
      end
      6'b11?001: begin
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
      end
      6'b?10?01: begin
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
      end
      6'b?????1?: begin
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b1????0: begin
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b00?101: begin
          FutureState = Flat;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b011?01: begin
          FutureState = Flat;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b01??00: begin
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b00?100: begin
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
    endcase
    Lifting: casez ({CIB, MD, PB, BS, H, L})
      6'b1?????: begin
          FutureState = Lifting;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b?????1: begin
          FutureState = Lifting;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b00?100: begin
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b01??00: begin
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b00?010: begin
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b00?110: begin
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b01??10: begin
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b1;
      end
    endcase
    Uprigth: casez ({CIB, MD, PB, BS, H, L})
      6'b1?????: begin
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b010110: begin
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b?????1: begin
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b00?110: begin
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b00?010: begin
          FutureState = Uprigth;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b011?10: begin
          FutureState = Uprigth;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b01??00: begin
          FutureState = Lowering;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b00?000: begin
          FutureState = Lowering;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
    endcase
    Lowering: casez ({CIB, MD, PB, BS, H, L})
      6'b1?????: begin
          FutureState = Lowering;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b0???1?: begin
          FutureState = Lowering;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b00?000: begin
          FutureState = Lowering;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b?0?100: begin
          FutureState = Lowering;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b01?000: begin
          FutureState = Lowering;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b00?001: bgin
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
      end
      6'b01??01: begin
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
      end
    endcase
  endcase
end

always @ (posedge Clk or negedge Reset)
begin
    if(!Reset)
        casez({CIB, MD, PB, BS, H, L})
            6'b1???01: State <= Flat;
            6'b0??100: State <= Lifting;
            6'b0???10: State <= Uprigth;
            6'b0??000: State <= Lowering;
            default: State <= Flat;
        endcase
    else
    begin
        State <= FutureState;
    end
end
endmodule
