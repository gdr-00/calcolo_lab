x=1;
fig1 = figure;
for n = 1:500
    x = x.*((2*n./(2*n - 1)).*(2*n./(2*n + 1)));
    hold on
    plot(n, 2*x, 'r*')
end
hold off

x=1;
fig2 = figure;
for n = 1:500
    x = x.*((2*n./(2*n - 1)).*(2*n./(2*n + 1)));
    error = abs(pi-x); %./abs(pi)
    hold on
    semilogy(n, error, 'r+')
end
hold off