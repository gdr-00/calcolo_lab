
% Valore massimo dei gradi n
Nmax = 25;

% Funzione di Runge
f = @(x) 1./(1+25*x.^2);

% Vettore per la valutazione di f e dei polinomi
s = linspace(-1,1,1000);

ff = f(s);
% Ciclo sul grado n
for n = 1:Nmax
    % Definizione dei nodi di interpolazione
    xe = linspace(-1,1,n+1);
    xcl = -cos([0:n]*pi/n);
    % Valutazione di f nei nodi
    ye = f(xe);
    ycl = f(xcl);
    % 
    te = interpol(xe,ye,s);
    tcl = interpol(xcl,ycl,s);

    ee(n) = max(abs(te - ff));
    ecl(n) = max(abs(tcl-ff));
end

figure(1)
semilogy(1:Nmax,ee,'ko-','MarkerFaceColor','g');
hold on;
semilogy(1:Nmax,ecl,'ro-','MarkerFaceColor','b')

