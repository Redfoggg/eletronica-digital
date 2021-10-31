// Tudo com "n" na frente significa o sinal em contexto porém negado;
// ex: q é o valor de q, nq seria o mesmo q ~q;

module ffd_structural (
    output q, nq,
    input clk, d, reset, preset
);
    //saidas das portas lógicas
    wire nand1, nand2, nand3, nand4, nand5, nand6, nclk, nnclk, nd;

    wire nreset, npreset;
    not(nreset, reset);
    not(npreset, preset);
    not(nclk, clk);
    not(nnclk, nclk);
    not(nd, d);

    //------------------------------- latch principal
    nand(nand1, d, nclk);
    nand(nand2, nand1, nclk);

    //latch1
    nand(nand3, nand1, nand4);
    nand(nand4, nand3, nand2);
    //-------------------------------

    //------------------------------ Child
    nand(nand5, nand3, nnclk);
    nand(nand6, nand5, nnclk);

    //latch 2
    nand(q, nand5, nq, npreset);
    nand(nq, nand6, q, nreset);
    //------------------------------
endmodule


module robot_structural(
    output a, r, q, nq,
    input h, l, clk, reset, preset
);

    wire d, reset, preset;
    wire nh, nl;

    wire or1; // porta OR que faz parte da lógica da saia A
    wire and1; // porta AND que faz da lógica da saída R
    wire or2; // porta OR que faz parte da lógica da saia R

    ffd_structural ffd( .q(q), .nq(nq), .clk(clk), .d(d), .reset(reset), .preset(preset));

    // fios de entradas negadas
    not(nh, h);
    not(nl, l);


    // lógica de entrada para o ffd, controla os dois possíveis estados.
    nor(d, h, l);

    // lógica de saída para A, A = nH(L + q)
    or(or1, l, q);
    and(a, or1, nh);

    // lógica da saída R, R = H + nq.nH
    and(and1, nl, nq);
    or(r, h, and1);


endmodule
