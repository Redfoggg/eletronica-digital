module state_flat(Clock, Reset, S1, S2, S3, S4, S5, S6, MT, AL, TFL);
  input Clock, Reset, S1, S2, S3, S4, S5, S6;
  output reg MT, AL, TFL;
  always @(posedge Clock)
    begin
      casez({S6, S5, S4, S3, S2, S1})
        6'b?0?001: begin
          $display("caso 1");
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
        end
        6'b11?001: begin
          $display("caso 2");
          MT = 1'b0;
          AL = 1'b0;
          TFL = 1'b0;
        end
        6'b?????1?: begin
          $display("caso 3");
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
        end
        6'b1????0: begin
          $display("caso 4");
          MT = 1'b0;
          AL = 1'b1;
          TFL = 1'b1;
        end
        6'b01??00: begin
          $display("caso 5");
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
        end
        6'b00?100: begin
          $display("caso 6");
          MT = 1'b1;
          AL = 1'b0;
          TFL = 1'b1;
        end
        6'b?10?01: begin
          $display("caso 7");
		  MT = 1'b0;
  		  AL = 1'b0;
		  TFL = 1'b0;
        6'b00?101: begin
          $display("caso 8");
		  MT = 1'b1;
  		  AL = 1'b0;
		  TFL = 1'b1;
        end
        6'b011?01: begin
          $display("caso 9");
		  MT = 1'b1;
  		  AL = 1'b0;
		  TFL = 1'b1;
        end
      endcase
    end
endmodule
