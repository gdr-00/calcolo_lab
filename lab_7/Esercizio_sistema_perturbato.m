
% Definisco una matrice attraverso il comando magic che genera una matrice
% che, sommando ogni riga oppure ogni colonna, resituisce lo stesso valore
A = magic(5);
% Come detto sopra
sum(A,1)
sum(A,2)

% Definisco b come il risultato del sistema lineare che ha come soluzione
% un vettore di tutti 1
b = A*ones(5,1);

% Perturbo i valori di A e b con la funzione rand che genera valori random
% uniformi tra 0 e 1
Aap = A + 0.1*rand(5);
bap = b + 0.1*rand(5,1);

% Richiamo la funzione creata su questi valori
sistema_perturbato(A,b,Aap, bap)