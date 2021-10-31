module ffd_dataflow (
    output q, nq,
    input clk, d, reset, preset
);
    assign q = preset ? 1 :
            reset ? 0 : clk ? d : q;
    assign nq = ~q;
endmodule


module robot_dataflow(
    output a, r, q, nq,
    input h, l, clk, reset, preset
);
  wire d, reset, preset;

  ffd_dataflow ffd( .q(q), .nq(nq), .clk(clk), .d(d), .reset(reset), .preset(preset));

  assign d = ~(h | l);

  assign a = ~h & (l | q); // lógica de saída para A, A = nH(L + q)
  assign r = h | (~l & nq); // lógica da saída R, R = H + nq.nH

endmodule
