function x = qrsolve(QR,b)
%
%function x = qrsolve(QR,b)
%risoluzione sistema lineare QRx=b
%Input:
%   -QR Matrice ottenuta dalla funzione myqr(A)
%   -b: vettore termini noti del sistema Ax = b
%Output:
%   -x: soluzione del sistema lineare QRx = b
% flops circa n^2

    [m,n] = size(QR);
    k = length(b);
    if (k ~= m)
        error("Dati input inconsistenti");
    end
    x = b(:);
    for i = 1 : n
        v = [1 : QR(i+1 : n,i)];
        beta = 2 / (v' * v);
        x(i : m) = x(i : m) - (beta * (v' * x(i : m)) * v);
    end
    x = x(1 : n);
    for i = n : -1 : 1
        x(i) = x(i) / QR(i,i);
        if(i > 1)
            x(1 : i-1) - x(i) * QR(i : i-1,i);
        end
    end
    return
end