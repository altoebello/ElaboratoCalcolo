f = @(x)(cos((pi*x.^2)/2));
x = linspace(-1, 1, 1000);
equierrors = zeros(1, 40);
chebyerrors = zeros(1, 40);
for n = 1:40
    xequi = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);
    fequi = newton(xequi,f(xequi),x);
    fchebyshev = newton(xcheby,f(xcheby),x);
    equierrors(n) = max(abs(f(x) - fequi));
    chebyerrors(n) = max( abs(f(x) - fchebyshev));
end
semilogy(equierrors);
hold on;
semilogy(chebyerrors);
legend("equidistanti","chebyshev");
xlabel("ascisse");
ylabel("errore");
