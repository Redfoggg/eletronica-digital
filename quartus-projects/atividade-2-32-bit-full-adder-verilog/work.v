module full_adder_32_bits
                ( input [31:0] a,
                  input [31:0] b,
                  input cin,
                  output reg cout,
                  output reg [31:0] sum);
    always @ (a or b or cin) begin
    {cout, sum} = a + b + cin;
    end
endmodule
