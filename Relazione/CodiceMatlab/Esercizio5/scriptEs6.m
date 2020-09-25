f = @(x) x-cos(x);
f1 = @(x) 1+sin(x);
a = 0;
b = 1;
tol = 10^-12;

%[x, i] = newton(f,f1,a,tol);

%[x, i] = bisezione(f,a,b,tol);

%[x, i] = corde(f,f1,a,tol);

[x , i] = secanti(f,a,b,tol);

disp(x);
disp(i);