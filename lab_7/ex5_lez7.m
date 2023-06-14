clear all;

% Creo i punti x con i valori della funzione in quei punti con l'aggiunta
% della perturbazione
A = magic(10);
b = A*[1 : 10]';

x_exact = A\b;

x = lu_solver(A,b);
dif = norm(x-x_exact);

fprintf('%1.5e\n', dif);