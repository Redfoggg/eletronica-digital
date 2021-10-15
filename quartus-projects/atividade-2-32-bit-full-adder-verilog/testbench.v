module tb_fulladd_32_bits;
  reg [31:0] a;
  reg [31:0] b;
  reg cin;
  wire [31:0] sum;
  integer i;

  full_adder_32_bits fa32 (.a (a),
                .b (b),
                .cin (cin),
                .cout (cout),
                .sum (sum));

  initial begin
    a <= 0;
    b <= 0;
    cin <= 0;

    $monitor ("a=%32b b=%32b cin=%32b cout=%32b sum=%32b", a, b, cin, cout, sum);

    for (i = 0; i < 10; i = i+1) begin
      #10 a <= $random;
      b <= $random;
      cin <= $random;
    end

    $dumpfile("dump.vcd");
    $dumpvars;
    #10000 $finish;
  end
endmodule
