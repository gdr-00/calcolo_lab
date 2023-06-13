function sistema_perturbato(A, b, Aap, bap)
    x = A\b;
    xap = Aap\bap;

    condA = cond(A);

    Ndeltax = norm(xap-x);
    NdeltaA = norm(Aap-A);
    Ndeltab = norm(bap-b);

    if (condA*NdeltaA/norm(A)>=1)
       error('Non è possibile applicare la stima perchè k(A)||deltaA||/||A||>=1')
end

Stima = condA/(1-condA*NdeltaA/norm(A))*(NdeltaA/norm(A)+Ndeltab/norm(b));

fprintf('Il valore %1.2e è infatti minore di %1.2e \n',Ndeltax/norm(x),Stima);


end