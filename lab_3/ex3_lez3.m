clear all;
clc;

n = 1e+2;

Sn1=zeros(n, 1);
Sn1(1)=1;
for i=2:n
    Sn1(i) = Sn1(i-1) + 1/i^2;
end

Sn2 = cumsum(1./((1:n)./2));

SN1 = sqrt(6*Sn1);
SN2 = sqrt(6*Sn2);

err_relSn1 = abs(SN1-pi)/pi;
err_relSn2 = abs(SN2-pi)/pi;

diff_errZero = err_relSn2 - err_relSn1;
figure;
plot(1:n, diff_errZero)

figure;
semilogy(1:n, err_relSn1, '-.k')

x(1) = 2;
for i=3:n
    x(i-1) = 2^((i-1)-1/2)*sqrt(1-4^(1-(i-1))*x(i-2)^2);
end

y(1) = 2;
for i = 3:n
    y(i-1) = sqrt(2)*y(i-2)/sqrt(1+sqrt(1-4^(1-(i-1))*y(i-2)^2));
end

err_rel1 = abs(x-pi)/pi;
err_rel2 = abs(y-pi)/pi;

hold on;
semilogy(1:(n-1), err_rel1,'-r')
semilogy(1:(n-1), err_rel2, '--b')
hold off;