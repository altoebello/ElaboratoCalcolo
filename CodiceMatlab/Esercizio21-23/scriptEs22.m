condiz = zeros(50,1);
for i = 1 : 50
    condiz(i) = (1/i)*sum(abs(pesiNewtonCotes(i)));
end
semilogy(condiz);
xlabel = ("grado formula newton cotes");
ylabel = ("condizionamento");
