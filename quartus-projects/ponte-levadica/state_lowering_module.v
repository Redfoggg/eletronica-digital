module state_lowering(Clock, Reset, S1, S2, S3, S4, S5, S6, MT, AL, TFL);
  input Clock, Reset, S1, S2, S3, S4, S5, S6;
  output reg MT, AL, TFL;
  always @(posedge Clock)
    begin
      6'b1?????: begin
        $display("Caso 1");
          FutureState = Lowering;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b0???1?: begin
        $display("Caso 2");
          FutureState = Lowering;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b00?000: begin
        $display("Caso 3");
          FutureState = Lowering;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b?0?100: begin
        $display("Caso 4");
          FutureState = Lowering;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
      end
      6'b01?000: begin
        $display("Caso 5");
          FutureState = Lowering;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
      end
      6'b00?001: begin
        $display("Caso 6);
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
      end
      6'b01??01: begin
        $display("Caso 7");
          FutureState = Flat;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
      end
      endcase
    end
endmodule
