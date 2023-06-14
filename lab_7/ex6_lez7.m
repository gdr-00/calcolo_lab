f = @(x) sin(2.*x)-x.^2;   % Funzione da approssimare
n = 100;
d = 8;

t = linspace(-5,5,1000);
x = linspace(-5,5,n); % Nodi di approssimazione
y = f(x);   % Valori funzionali sui nodi
y = y + 0.5*rand(size(y)); % aggiunta di rumore

true_fun = f(t);


%% Primo metodo: polyfit/polyval
fprintf('\n \t Metodo polyfit/polyval \n')

coeffs_poly = polyfit(x,y,d); % Calcolo i coefficienti attraverso la funzione polyfit
rec_poly = polyval(coeffs_poly,t); % Valuto il pol in 1000 punti su [-5,5]

figure(1)
plot(x,y,'ob')
hold on
plot(t,true_fun,'-r','LineWidth',2)
plot(t,rec_poly,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: polyfit/polyval')

%% Secondo metodo: equazioni normali
fprintf('\n \t Metodo equazioni normali \n')

%V = vander(x);
%A = V(:,end-d:end);
%coeffs_normal = (A'*A)\(A'*y'); % Calcolo i coeff con le eq normali

%rec_normal = polyval(coeffs_normal(1:end),t); %uso in ordine i
%coefficienti tanto non ho invertito la matrice

V = fliplr(vander(x));
A = V(:,1:d+1);
coeffs_normal = (A'*A)\(A'*y'); % Calcolo i coeff con le eq normali

rec_normal = polyval(coeffs_normal(end:-1:1),t); % Valuto il pol sui 1000 pti in [-5,5]
% Inverto i coefficienti per come vuole il vettore dei coefficienti la
% funzione polyval, infatti avendo usato la matrice V con le colonne ordinate
% da sx a dx dal grado 0 al grado d allora avrò che il vettore coeff avrà i
% coefficienti relativi al grado 0 in alto e quelli relativi al grado d in
% basso, il contrario di quello che vuole polyval in entrata

fprintf('\n \t Condizionamento della matrice A^t A: %1.2e \n', cond(A'*A))

figure(2)
plot(x,y,'ob')
hold on
plot(t,true_fun,'-r','LineWidth',2)
plot(t,rec_normal,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: equazioni normali')

%% Terzo metodo: scomposizione QR di A
fprintf('\n \t Metodo QR su A \n')
% Matrice di Vandermonde
V = fliplr(vander(x));
A = V(:,1:d+1);
% Decomposizione QR
[Q,R] = qr(A);

% Restringo le matrici
Q1 = Q(:,1:d+1);
R1 = R(1:d+1,1:d+1);

b = Q1'*y';
coeffs_qr = R1\b; % Calcolo i coefficienti con QR

rec_qr = polyval(coeffs_qr(end:-1:1),t); % Si veda sopra

fprintf('\n \t Condizionamento della matrice R: %1.2e \n', cond(R1))

figure(3)
plot(x,y,'ob')
hold on
plot(t,true_fun,'-r','LineWidth',2)
plot(t,rec_qr,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: scomposizione QR')
