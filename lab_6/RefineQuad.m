function [integrale,I,step,flag]=RefineQuad(a,b,f,formula,tol,maxN)
% ---------------------------------------------
% Function che raffina il numero di subintervalli, incrementandoli finchè
% non si raggiunge una certa tolleranza o il numero massimo di iterazioni
% ---- input ----
% a,b     : estremi dell'intervallo di integrazione
% f       : funzione integranda
% formula : parametro per determinare il metodo da usare, 1-trapezi,
%           2-Simpson
% tol     : tolleranza 
% maxN    : N relativo alla suddivisione massima
% ---- output ----
% integrale : valore approssimato dell'integrale finale
% I         : vettore delle varie approssimazioni dell'integrale
% step      : residuo tra gli ultimi due raffinamenti
% flag      : 0 - non raggiungimento della la tolleranza; 1 - raggiungimento
% ----------------------------------------------

% Inizializzazione di N, variabile flag e variabile step
N=1;flag=0;
step=tol+1;
% Generazione dei pesi e dei nodi di quadratura
switch formula
    case 1
        [x,w]=trapezi_composta(a,b,N);
    case 2
        [x,w]=simpson_composta(a,b,N);
end
% Approssimazione dell'integrale
I=w'*f(x);
% Ciclo di raffinamento
while (step>tol) && (N<=maxN/2)
    % Raddoppio dei subintervalli
    N=2*N;
    % Generazione dei pesi e dei nodi di quadratura
    switch formula
        case 1
            [x,w]=trapezi_composta(a,b,N);
        case 2
            [x,w]=simpson_composta(a,b,N);
    end
    % Approssimazione dell'integrale
    I=[I,w'*f(x)];
    % Errore assoluto tra le ultime due iterate
    step=abs(I(end)-I(end-1));
end

% Integrale finale
integrale=I(end);
% Cambiamento del valore flag se raggiungimento della tolleranza
if (abs(step)<=tol)
    flag=1;
end

end