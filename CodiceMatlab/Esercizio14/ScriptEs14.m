A = rot90(vander(1:10));
A = A(:,1:8);
x = (1:8)'; 
b = A*x;

disp(A\b);

disp((A'*A)\(A'*b));
