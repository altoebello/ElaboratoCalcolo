f = @(x)(cos((pi*x.^2)/2));
x = linspace(-1, 1, 1000);
equierrors = zeros(1, 100);
chebyerrors = zeros(1, 100);
for n = 4:100
    xequi = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);
    fequi = spline(xequi,f(xequi),x);
    fchebyshev = spline(xcheby,f(xcheby),x);
    equierrors(n) = max(abs(f(x) - fequi));
    chebyerrors(n) = max( abs(f(x) - fchebyshev));
end
semilogy(equierrors);
hold on;
semilogy(chebyerrors);
legend("equidistanti","chebyshev");
xlabel("ascisse");
ylabel("errore");
