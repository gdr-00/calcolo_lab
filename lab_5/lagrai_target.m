function l = lagrai_target(z,x,i)
%------------------------------------------------
% Calcola l’i-esimo pol. elementare di Lagrange su un vettore di punti di valutazione
%------------------------------------------------
% z = nodi di interpolazione
% x = vettore (colonna!) di punti di valutazione su cui valutare l_i
% i = indice del polinomio
% l = vettore dei valori di l_i sui targets
%------------------------------------------------
n = length(z); m = length(x);
l = prod(repmat(x,1,n-1)-repmat(z([1:i-1,i+1:n]),m,1),2)/...
prod(z(i)-z([1:i-1,i+1:n]));
end