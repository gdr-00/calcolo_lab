
% Fisso il grado massimo del polinomio interpolante
n = 5;
% Genero n+1 punti di chebyshev da usare come nodi
x = -cos((0:n)*pi/n);

% Funzione da interpolare
f = @(x) 1/3*exp(-2*x) + x.^2 + 7*x.^3;
% Valutazione della funzione sui nodi
y = f(x);

% Punti di valutazione del polinomio
s = linspace(-1,1,500);

% Valutazione del polinomio nei punti s attraverso la funzione interpol
t = interpol(x,y,s);

% Figura con sovrapposti la funzione e il polinomio interpolante
figure(1)
plot(s,f(s),'b')
hold on;
plot(s,t,'r--')

% Errore massimo di interpolazione
err = max(abs(t-f(s)));

fprintf('\n \t Errore di interpolazione %2.5e \n', err)

