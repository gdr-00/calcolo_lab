plot(f(linspace(0,1,100)), linspace(0,1,100))

fprintf('%1.0f\n', sign(f(0)*f(1)))

[x, xall, iter] = bisezione(f, 0, 1, 10e-8, 10e6);


function y = f(x)
    y = exp(x)-2+x;
end