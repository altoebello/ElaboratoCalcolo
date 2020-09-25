f = @(x)(cos((pi*x.^2)/2));
x = linspace(-1, 1, 100000);
erroriEquidistanti = zeros(1, 40);
erroriChebyshev = zeros(1, 40);
for n = 1:40
    xequi = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);
    fequi = lagrange(xequi,f(xequi),x);
    fchebyshev = lagrange(xcheby,f(xcheby),x);
    erroriEquidistanti(n) = max(abs(f(x) - fequi));
    erroriChebyshev(n) = max( abs(f(x) - fchebyshev));
end
semilogy(erroriEquidistanti);
hold on;
semilogy(erroriChebyshev);
title("Grafico errori con polinomio interpolante in forma di Lagrange");
legend("equidistanti","chebyshev");
xlabel("ascisse di interpolazione");
ylabel("errore commesso");
