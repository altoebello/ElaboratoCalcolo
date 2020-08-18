f = @(x)(cos((pi*x.^2)/2));
f1 = @(x)(-pi*x.*sin((pi*x.^2)/2));
x = linspace(-1, 1, 101);
equierrors = zeros(1, 20);
chebyerrors = zeros(1,  20);
for n = 1:20
    xequi = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);
    fequi = hermite(xequi,f(xequi),f1(xequi),x);
    fchebyshev = hermite(xcheby,f(xcheby),f1(xcheby),x);
    equierrors(n) = max(abs(f(x) - fequi));
    chebyerrors(n) = max( abs(f(x) - fchebyshev));
end
semilogy(equierrors);
hold on;
semilogy(chebyerrors);
legend("equidistanti","chebyshev");
xlabel("ascisse");
ylabel("errore");