function [f, a, b, toll] = mybisezione(f, a, b, toll)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=0;
while (b-a) > toll
    x=(a+b)./2;
    if f(a).*f(x) < 0
        b=x;
    else
        a=x;
    end
    n=n+1;
end
