clear all;

% Creo i punti x con i valori della funzione in quei punti con l'aggiunta
% della perturbazione
x = linspace(0,1,20);
y = 2*x + 0.2 + 0.1*rand(size(x)); y = y';

% Genero la matrice di Vandermonde (quadrata) relativa ai nodi x, con grado
% la lunghezza dei punti - 1
V = fliplr(vander(x));

% Cercando una approssimazione di primo grado allora tronco la matrice alle
% prime due colonne (quelle relative a grado 0 e grado 1)
A = V(:,1:2);

coeff = (A'*A)\(A'*y); % Coefficienti del polinomio di primo grado della retta approssimante

% Discretizzazione dell'intervallo per fare il plot della retta
% approssimante
s = linspace(0,1,100);
% Valori della retta nei punti s
y_approx = coeff(1) + coeff(2)*s;

figure(1)
plot(x,y','ko','MarkerFaceColor','g');
hold on;
plot(s,y_approx,'b');
grid on;