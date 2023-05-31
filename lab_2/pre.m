function [] = pre(b)

e=1; k=0;

while(e+1>1 && k=<1000)
    e=e/b; k=k+1;
end

e=e.*b

k-1