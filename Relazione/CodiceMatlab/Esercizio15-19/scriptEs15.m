f = @(x)(cos((pi*x.^2)/2));
x = linspace(-1, 1, 1000);
erroriEquidistanti = zeros(1, 40);
erroriChebyshev = zeros(1, 40);
for n = 1:40
    xequi = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);
    fequi = newton(xequi,f(xequi),x);
    fchebyshev = newton(xcheby,f(xcheby),x);
    erroriEquidistanti(n) = max(abs(f(x) - fequi));
    erroriChebyshev(n) = max( abs(f(x) - fchebyshev));
end
semilogy(erroriEquidistanti);
hold on;
semilogy(erroriChebyshev);
legend("equidistanti","chebyshev");
xlabel("ascisse di interpolazione");
ylabel("errore commesso");
