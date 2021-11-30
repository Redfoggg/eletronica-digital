module state_lifting(Clock, Reset, S1, S2, S3, S4, S5, S6, MT, AL, TFL);
  input Clock, Reset, S1, S2, S3, S4, S5, S6;
  output reg MT, AL, TFL;
  always @(posedge Clock)
    begin
      casez({S6, S5, S4, S3, S2, S1})
        6'b1?????: begin
          $display("Caso 1");
          FutureState = Lifting;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
        end
        6'b?????1: begin
          $display("Caso 2");
          FutureState = Lifting;
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
        end
        6'b00?100: begin
          $display("Caso 3");
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
        end
        6'b01??00: begin
          $display("Caso 4");
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
        end
        6'b00?010: begin
          $display("Caso 5");
          FutureState = Lifting;
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
        end
        6'b00?110: begin
          $display("Caso 6");
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b1;
        end
        6'b01??10: begin
          $display("Caso 7");
          FutureState = Uprigth;
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b1;
        end
      endcase
    end
endmodule
