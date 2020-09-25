f = @(x)(cos((pi*x.^2)/2));
x = linspace(-1, 1, 1000);
erroriEquidistanti = zeros(1, 100);
erroriChebyshev = zeros(1, 100);
for n = 4:100
    xequi = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);
    fequi = spline(xequi,f(xequi),x);
    fchebyshev = spline(xcheby,f(xcheby),x);
    erroriEquidistanti(n) = max(abs(f(x) - fequi));
    erroriChebyshev(n) = max( abs(f(x) - fchebyshev));
end
semilogy(erroriEquidistanti);
hold on;
semilogy(erroriChebyshev);
legend("equidistanti","chebyshev");
xlabel("ascisse di interpolazione");
ylabel("errore commesso");
