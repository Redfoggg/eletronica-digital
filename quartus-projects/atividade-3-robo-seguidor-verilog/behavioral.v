module robot_behavioral(
    output a, r, q, nq,
    input h, l, clk, reset, preset
);
  reg a, r, q, nq; // q representa o state em que a máquina está, sendo ele a representação de 1 flip-flop.
// lógica de saída para (A) andar pra frente, a = nh(l + q)
// lógica da saída (R) rotacionar, a = h + nq.nh
  always @(posedge clk or posedge reset or posedge preset)
    begin
      nq <= ~q;
      if(reset)
      begin
        q <= 1'b0;
        nq <= 1'b1;
      end
      else if(preset)
      begin
        q <= 1'b1;
        nq <= 1'b0;
      end
      case(q)
          1'b0: // state 0
            begin
              if(h == 1'b1)
                begin
                  r <= 1'b1;
                  a <= 1'b0;
                  q <= 1'b0;
                end
              else if(h == 1'b0 && l == 1'b1)
                begin
                  a <= 1'b1;
                  r <= 1'b0;
                  q <= 1'b0;
                end
              else
                begin
                  a <= 1'b1;
                  r <= 1'b0;
                  q <= 1'b1;
                end
            end
          1'b1: // state 1
            begin
              if(h == 1'b0 && l == 1'b0)
                begin
                  r <= 1'b0;
                  a <= 1'b1;
                  q <= 1'b1;
                end
              else if(h == 1'b0 && l == 1'b1)
                begin
                  a <= 1'b1;
                  r <= 1'b0;
                  q <= 1'b0;
                end
              else
                begin
                  a <= 1'b0;
                  r <= 1'b1;
                  q <= 1'b0;
                end
            end
            default:
              begin
                a <= 1'b0;
                r <= 1'b1;
                q <= 1'b0;
                nq <= 1'b1;
              end
        endcase
     end
endmodule
