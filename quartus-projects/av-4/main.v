module WaterPumpSystem(Clock, Reset, S1, S2, S3, S4, B1, B2);
input Clock, Reset, S1, S2, S3, S4;
output reg B1, B2;

reg [1:0] State, FutureState, State2, FutureState2;

parameter Empty = 2'b00,
          Filling = 2'b01,
          Full = 2'b10,
          Emptying = 2'b11;

always @ (S1 or S2 or State)
begin
    FutureState = Empty;
    B1 = 1'b0;

    case (State)
        Empty: case ({S2, S1})
                2'b00: begin
                    FutureState = Empty;
                    B1 = 1'b1;
                    B2 = 1'b0;
                end
                2'b01: begin
                    FutureState = Filling;
                    B1 = 1'b1;
                    B2 = 1'b1;
                end
                2'b10: begin
                    FutureState = Empty;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b11: begin
                    FutureState = Empty;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
            endcase
        Filling: case ({S2, S1})
                2'b00: begin
                    FutureState = Filling;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b01: begin
                    FutureState = Filling;
                    B1 = 1'b1;
                    B2 = 1'b1;
                end
                2'b10: begin
                    FutureState = Filling;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b11: begin
                    FutureState = Full;
                    B1 = 1'b0;
                    B2 = 1'b1;
                end
            endcase
        Full: case ({S2, S1})
                2'b00: begin
                    FutureState = Full;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b01: begin
                    FutureState = Emptying;
                    B1 = 1'b0;
                    B2 = 1'b1;
                end
                2'b10: begin
                    FutureState = Full;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b11: begin
                    FutureState = Full;
                    B1 = 1'b0;
                    B2 = 1'b1;
                end
            endcase
        Emptying: case ({S2, S1})
                2'b00: begin
                    FutureState = Empty;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b01: begin
                    FutureState = Emptying;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b10: begin
                    FutureState = Emptying;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                2'b11: begin
                    FutureState = Emptying;
                    B1 = 1'b0;
                    B2 = 1'b1;
                end
            endcase
        endcase
end

always @ (S1 or S3 or S4 or State2)
begin
    FutureState2 = Empty;
    B2 = 1'b0;

    case (State2)
        Empty: case ({S4, S3, S1})
                3'b001: begin
                    FutureState2 = Filling;
                    B2 = 1'b1;
                end
                3'b010: begin
                    FutureState2 = Empty;
                    B2 = 1'b0;
                end
                3'b011: begin
                    FutureState2 = Filling;
                    B2 = 1'b1;
                end
                3'b100: begin
                    FutureState2 = Empty;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                3'b101: begin
                    FutureState2 = Empty;
                    B1 = 1'b0;
                    B2 = 1'b0;
                end
                3'b110: begin
                    FutureState2 = Empty;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b111: begin
                    FutureState2 = Empty;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
            endcase
        Filling: case ({S4, S3, S1})
                3'b001: begin
                    FutureState2 = Filling;
                    B2 = 1'b1;
                end
                3'b010: begin
                    FutureState2 = Filling;
                    B2 = 1'b0;
                end
                3'b011: begin
                    FutureState2 = Filling;
                    B2 = 1'b1;
                end
                3'b100: begin
                    FutureState2 = Filling;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b101: begin
                    FutureState2 = Filling;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b110: begin
                    FutureState2 = Full;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b111: begin
                    FutureState2 = Full;
                    B2 = 1'b0;
                end
            endcase
        Full: case ({S4, S3, S1})
                3'b001: begin
                    FutureState2 = Full;
                    B2 = 1'b0;
                end
                3'b010: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                end
                3'b011: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                end
                3'b100: begin
                    FutureState2 = Full;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b101: begin
                    FutureState2 = Full;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b110: begin
                    FutureState2 = Full;
                    B2 = 1'b0;
                end
                3'b111: begin
                    FutureState2 = Full;
                    B2 = 1'b0;
                end
            endcase
        Emptying: case ({S4, S3, S1})
                3'b001: begin
                    FutureState2 = Empty;
                    B2 = 1'b0;
                end
                3'b010: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                end
                3'b011: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                end
                3'b100: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b101: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                    B1 = 1'b0;
                end
                3'b110: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                end
                3'b111: begin
                    FutureState2 = Emptying;
                    B2 = 1'b0;
                end
            endcase
        endcase
end

always @ (posedge Clock or negedge Reset)
begin
    if(!Reset)
        case({S4, S3, S2, S1})
            4'b0000: begin
                State <= Empty;
                State2 <= Empty;
            end
            4'b0001: begin
                State <= Filling;
                State2 <= Empty;
            end
            4'b0010: begin
                State <= Emptying;
                State2 <= Empty;
            end
            4'b0011: begin
                State <= Full;
                State2 <= Empty;
            end
            4'b0100: begin
                State <= Empty;
                State2 <= Filling;
            end
            4'b0101: begin
                State <= Filling;
                State2 <= Filling;
            end
            4'b0110: begin
                State <= Emptying;
                State2 <= Filling;
            end
            4'b0111: begin
                State <= Full;
                State2 <= Filling;
            end
            4'b1000: begin
                State <= Empty;
                State2 <= Emptying;
            end
            4'b1001: begin
                State <= Filling;
                State2 <= Emptying;
            end
            4'b1010: begin
                State <= Emptying;
                State2 <= Emptying;
            end
            4'b1011: begin
                State <= Full;
                State2 <= Emptying;
            end
            4'b1100: begin
                State <= Empty;
                State2 <= Full;
            end
            4'b1101: begin
                State <= Filling;
                State2 <= Full;
            end
            4'b1110: begin
                State <= Emptying;
                State2 <= Full;
            end
            4'b1111: begin
                State <= Full;
                State2 <= Full;
            end
        endcase
    else
    begin
        State <= FutureState;
        State2 <= FutureState2;
    end
end
endmodule
