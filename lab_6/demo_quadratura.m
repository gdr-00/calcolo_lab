function demo_quadratura

% funzione integranda
f = @(x) 1./(1+x);

% Intervallo di integrazione
a = 0; b = 1;
% Soluzione esatta
sol = log(2);

% Metodo trapezi
S_T = ((b - a)/2)*(f(a) + f(b)) ;
% Metodo di Simpson
c=(a+b)/2; % punto medio
S_CS =((b - a)/6)*(f(a) + 4*f(c) + f(b));

err_ass_T = abs(S_T - sol);
err_ass_CS =  abs(S_CS - sol);

fprintf('\n \t Errore assoluto Trapezi : %1.4e \n', err_ass_T);
fprintf('\n \t Errore assoluto Simpson : %1.4e \n', err_ass_CS);

end