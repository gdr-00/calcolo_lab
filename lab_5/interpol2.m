function t=interpol2(x,y,s)
% Input:
%         x,y  vettori di ascisse cui si associa il polinomio interpolatore "p_n"
%         s    vettore di ascisse in cui valutare il polinomio interpolatore
% Output:
%         t    vettore di valutazioni "p_n(s)"

% Preallocamento del vettore t
t=zeros(size(s));

% Vettore colonna contenente tutti i l_i(s(j))
L=zeros(length(x),1);

for j=1:length(s)
    for i=1:length(x)
        % Calcolo di l_i(s(j)), componente i-esima di L
        L(i)=(prod(s(j)-x(1:i-1))*prod(s(j)-x(i+1:end)))/(prod(x(i)-x(1:i-1))*...
            prod(x(i)-x(i+1:end)));
    end
    % Prodotto scalare equivalente alla somma di tutti l_i(s(j))*y_i 
    t(j)=y*L;
end
