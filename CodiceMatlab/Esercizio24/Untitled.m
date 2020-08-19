a = -1;
b = 1.1;
f = @(x)tan(x);
n = 100; % scelto un valore a caso.

trapezi = zeros(1,n);
simpson = zeros(1,n);

for i = 1 : n
    trapezi(i) = trapecomp(f,a,b,2*i);  %2*i perchè deve essere pari
    simpson(i) = simpcomp(f,a,b,2*i);
end

trapezi = trapezi(:);
disp("Trapezi: ");
disp(trapezi);
disp("Simpson Composite:");
simpson = simpson(:);
disp(simpson);