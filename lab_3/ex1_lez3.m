clear all;
clc


x = linspace(-1e-10,1e-10, 2000);
y = 1;
c = ((1+x)-1)./x;

err = abs(c-y)/abs(y);

figure(1);
plot(x,c)
title('valore f(x)')

figure(2);
plot(x, err)