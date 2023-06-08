function demo_quadratura2

% funzione integranda
f = @(x) 1./(1+x);

% Intervallo di integrazione
a = 0; b = 1;
% Soluzione esatta
sol = log(2);

Nmax = 20;

for n = 1:Nmax
    [xT,wT] = trapezi_composta(a,b,n);
    [xS,wS] = simpson_composta(a,b,n);
    S_T(n) = f(xT)'*wT;
    S_CS(n) = f(xS)'*wS;
end

% Errori assoluti
err_ass_T = abs(S_T - sol);
err_ass_CS =  abs(S_CS - sol);

% Grafico in scala semilogaritmica
figure(1)
semilogy(1:Nmax,err_ass_T,'ko-');
hold on;
semilogy(1:Nmax,err_ass_CS,'ro-');

end