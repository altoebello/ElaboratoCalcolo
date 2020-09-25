f = @(x)(cos((pi*x.^2)/2));
f1 = @(x)(-pi*x.*sin((pi*x.^2)/2));
x = linspace(-1, 1, 101);
erroriEquidistanti = zeros(1, 20);
erroriChebyshev = zeros(1,  20);
for n = 1:20
    xequi = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);
    fequi = hermite(xequi,f(xequi),f1(xequi),x);
    fchebyshev = hermite(xcheby,f(xcheby),f1(xcheby),x);
    erroriEquidistanti(n) = max(abs(f(x) - fequi));
    erroriChebyshev(n) = max( abs(f(x) - fchebyshev));
end
semilogy(erroriEquidistanti);
hold on;
semilogy(erroriChebyshev);
legend("equidistanti","chebyshev");
xlabel("ascisse di interpolazione");
ylabel("errore commesso");