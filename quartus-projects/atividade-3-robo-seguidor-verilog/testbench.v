module tb;

  // Inputs
  reg h, l, clk, reset, preset;

  // Outputs
  wire a, r, q, nq;

  // Instancia Unit Under Test, para testar em cada modelagem basta modificar
  // o tipo para modelo desejado, os casos de teste são os mesmos para cada
  // modelagem assim como as entradas e saídas, todos devem funcionar do mesmo modo.
  robot_behavioral uut(
    .a(a),
    .r(r),
    .q(q),
    .nq(nq),
    .h(h),
    .l(l),
    .clk(clk),
    .reset(reset),
    .preset(preset)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);

    $display("Start:");
    reset = 1;
    preset = 0;
    h = 0;
    l = 0;
    clk = 0;
    print_outputs;

    $display("Deve mover para frente e vai para o state 1");
    reset = 0;
    preset = 0;
    h = 0;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("Deve mover para frente e manter state 1");
    h = 0;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("...mantem...");
    print_outputs;

    $display("Deve rotacionar e voltar para o state 0");
    h = 1;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("...mantem...");
    print_outputs;

    $display("Deve mover para frente e manter state 0");
    h = 0;
    l = 1;
    toggle_clock;
    print_outputs;

    $display("Deve rotacionar e manter state 0");
    h = 1;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("Deve mover para frente e vai para state 1");
    h = 0;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("Deve rotacionar e voltar para o state 0");
    h = 1;
    l = 1;
    toggle_clock;
    print_outputs;

    $display("Deve mover para frente e vai para state 1");
    h = 0;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("Deve rotacionar e voltar para o state 0");
    h = 1;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("Deve mover para frente e vai para state 1");
    h = 0;
    l = 0;
    toggle_clock;
    print_outputs;

    $display("Deve mover para frente e vai para state 0");
    h = 0;
    l = 1;
    toggle_clock;
    print_outputs;

    #10000 $finish;
  end

  task print_outputs;
    #10 $display("H:%0h, L:%0h, A:%0h, R:%0h, State:%0h, nq:%0h \n",
      h, l, a, r, q, nq);
  endtask

  task toggle_clock;
    begin
     #10 clk = ~clk;
     #10 clk = ~clk;
    end
  endtask

endmodule
