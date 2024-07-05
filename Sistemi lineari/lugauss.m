function[L,U] = lugauss(A)
% -----------------------------------------------------------------
% lugauss: calcola la fattorizzazione LU di una matrice quadrata A
% -----------------------------------------------------------------
% [L,U] = lugauss(A)
% -----------------------------------------------------------------
% INPUT:
% A = matrice quadrata
% OUTPUT:
% L = matrice triangolare inferiore
% U = matrice triangolare superiore
% -----------------------------------------------------------------

size_A = size(A);
% Controllo se la matrice è quadrata
if size_A(1) != size_A(2)
    display('Matrice non quadrata'); 
    return;
endif
n = size_A(1);

L = eye(n); U = A;
% controllo di essere sotto ipotesi del teorma di esistenza della fattorizzazione LU
% verifico che tutte le sottomatrici principali di testa fino a ordine n - 1 siano non singolari

for i=1:n-1
    if det(A(1:i, 1:i)) == 0
        fprintf('Minore principale di testa di ordine %d singolare\n', i);
        return;
    endif
endfor

for k=1:n-1
    for i=k+1:n
        L(i,k) = U(i,k)/U(k,k); % calcolo i moltiplicatori
        for j = k:n
            U(i,j)=U(i,j)-L(i,k)*U(k,j); % calcolo la nuova riga i
        endfor
    endfor
endfor
