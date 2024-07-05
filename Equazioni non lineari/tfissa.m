function [x,iter,scarti]=tfissa(f,df,x0,tol,itmax)
%----------------------------------------------------------------
%  tfissa: Metodo delle tangenti per la ricerca degli zeri di una funzione
% INPUT:
%  Input:  f = funzione di cui si cerca lo zero
%  df = derivata della funzione f
%  x0 = punto inziale metodo iterativo
%  tol = tolleranza richiesta
%  itmax = numero massimo di iterazioni
%OUTPUT:
%  x = vettore contenente le approssimazioni dello zero
%  iter = numero di iterazioni effettuate
%  scarti = vettore contenente gli scarti tra due approssimazioni successive
%----------------------------------------------------------------

 xold=x0;
 x=[x0];
 scarti=[];
 dif =tol+1; 
 iter=0;
 dfx = feval(df,x0);
    if dfx == 0 
        disp('ERRORE: derivata nulla.'); return; 
    end
 while (abs(dif) > tol) && (iter < itmax)
    fx=feval(f,xold);
    if fx == 0 return; end
    iter=iter+1;
    dif=-fx/dfx;
    xnew=xold+dif;
    scarti=[scarti;dif];
    x=[x; xnew];
    xold=xnew;
 end
 if (iter >=itmax)
    disp('raggiunto il numero massimo di iterazioni')
 end
 fprintf('\n');

