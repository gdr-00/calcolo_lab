%EQ2GR Script per la risoluzione di un’equazione
% di secondo grado (solo soluzioni reali)
% con i coefficienti a, b e c non nulli
% FORMULE INSTABILI
%
% Settare il formato di visualizzazione
% Scrivere a video "Risoluzione eq. secondo grado"
% Chiedere all’utente di inserire i coefficienti a, b, c
% Controllare che siano tutti NON nulli
% se è così calcolare le radici,
% altrimenti dare un messaggio di errore
%CALCOLO DELLE RADICI
% calcolo del discriminante delta
% se delta<0 nessuna sol. reale (output video)
% se delta = 0 due sol. reali coincidenti(output video)
% altrimenti x1 e x2 reali e distinte (output video)

clear all

fprintf('Risoluzione di eq. secondo grado')
a = input('Insert coeff a: ');
b = input('Insert coeff b: ');
c = input('Insert coeff c: ');

if ~(a && b && c)
    error('One or more values are zero')
end
delta = sqrt((b.^2)-4*a*c);
fprintf('%1.16f\n', delta)

if delta<0
    fprintf('No solution in R\n')
else 
    if delta==0
        x=(-b)./(2*a);
        fprintf('coincident solution %1.0f\n', x)
    else
        x1=(-b-delta)./(2*a);
        x2=(-b+delta)./(2*a);
        fprintf('2 solutions in r %1.0f %1.0f\n', x1, x2)
    end
end
