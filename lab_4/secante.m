function [x,xall,iter] = secante(f,x0,x1,tol,max_iter)

% Metodo delle secanti per la soluzione di equazioni nonlineari
% -------------- Input ---------------------------------------------------
%               f        funzione di cui vogliamo trovare il punto fisso
%               x0       valore iniziale
%               x1       secondo valore iniziale
%               tol      tolleranza per la condizione di arresto
%               max_iter numero massimo di iterazioni
% -------------- Output --------------------------------------------------
%               x        soluzione finale
%               xall     vettore con tutte le iterazioni
%               iter     numero di iterazioni
% ------------------------------------------------------------------------

%Primo incremento
dx = -f(x1)*(x1-x0)/(f(x1)-f(x0));
x = x1+dx;          %Prima iterazione
iter = 1;
xall(iter) = x;

while (abs(dx) > tol) && (iter < max_iter)           % ciclo iterativo
  x0 = x1;
  x1 = x;
  dx = -f(x1)*(x1-x0)/(f(x1)-f(x0));                  % nuovo incremento
  x = x1 + dx;                                        % nuova iterazione
  iter = iter + 1;                                    % nuovo numero di iterazione
  xall(iter) = x;
end

end

