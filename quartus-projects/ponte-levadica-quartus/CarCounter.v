module CarCounter(CarIn, CarOut, ExistCar, Clk, Reset);
  input CarIn, CarOut, Clk, Reset;
  output reg ExistCar;

  reg [3:0] Cars;

  initial begin
    Cars = 4'b0000;
  end

  always @(posedge Clk)
    begin
      if(!Reset)
          Cars = 0;
      else
      begin
          case({CarIn, CarOut})
            2'b10: Cars = Cars + 4'b0001;
            2'b01:
              begin
                if(Cars == 4'b0000)
                  begin
                    ExistCar = 1'b0;
                    Cars = 4'b0000;
                  end
                else
                    Cars = Cars - 4'b0001;
              end
            2'b00: Cars = Cars;
            2'b11: Cars = Cars;
          endcase
      end

      if(Cars == 4'b0000)
          ExistCar = 1'b0;
      else
          ExistCar = 1'b1;
    end
endmodule