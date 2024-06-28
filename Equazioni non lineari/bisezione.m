function [vc,k,semilunghezza,residuopesato]=bisezione(a,b,tolintv,tolres,maxit,f)
% [vc,k,semilunghezza,residuopesato]=bisezione(a,b,tolintv,tolres,maxit,f)
%----------------------------------------------------------------%
% Implementazione del Metodo di bisezione
%----------------------------------------------------------------%
% PARAMETRI
%----------------------------------------------------------------%
% IN OUTPUT:
% vc: vettore contenente la successione di punti medi
% K: numero di iterazioni effettuate
% semilunghezza: vettore contenente la successione di  semilunghezze
% residuopesato: vettore contenente la successione di residui pesati 
%----------------------------------------------------------------%
% IN INPUT:
% a,b : estremi dell'intervallo iniziale contente la radice cercata
% tolintv: tolleranza per il test sulla semilunghezza
% tolres: tolleranza per il test sul residuo pesato
% maxit: massimo numero di iterazioni permesse
% f: funzione di cui si cerca lo zero in [a,b]
%----------------------------------------------------------------%
vc=[];
semilunghezza=[];
residuopesato=[];

%-------------------------%
% AGGIUSTA ERRORI UTENTE
%-------------------------%
if b < a
    s=b; b=a; a=s;
end

fa=feval(f,a); fb=feval(f,b);
if fa*fb > 0
   k=0;
   disp('L''intervallo iniziale non e'' accettabile')
   return
end

%----------------------------------------------------------------%
% CONTROLLA CHE LA RADICE SIA UNO DEI DUE ESTREMI DELL'INTERVALLO
%----------------------------------------------------------------%
if fa == 0
    vc=a; k=0; semilunghezza=(b-a)/2; residuopesato=0; 
    return;
end

if fb == 0
   vc=b; k=0; semilunghezza=(b-a)/2; residuopesato=0; 
   return;
end

%-------------------------%
% INIZIA IL CICLO ITERATIVO
%-------------------------%
for index=1:maxit
%  calcola nuovo punto medio e il valore di f in esso
   c=(a+b)/2; fc=feval(f,c);
%  calcola semilunghezza del nuovo intervallo
   semilun=(b-a)/2; den=(fb-fa);
   if den == 0
       den=eps;
   end
%  calcola residuo pesato
   w=(b-a)/den; wres=abs(fc*w);
   vc=[vc;c];      
   semilunghezza=[semilunghezza;semilun];      
   residuopesato=[residuopesato;wres];      
%  effettua TEST DI ARRESTO
   if (wres < tolres) || ...
      (semilun < tolintv) || (fc == 0)
      k=index; fprintf('\n'); return;
   end
% calcolare il nuovo intervallo di lunghezza dimezzata
   if sign(fc) == sign(fa)
        a=c; fa=fc;  
            else
        b=c; fb=fc;  
   end
end
k=maxit; fprintf('\n');
                                                          
