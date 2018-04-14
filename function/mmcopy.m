
function B=mmcopy(A,d1,d2)

%___________________________________________________________________________
%
% MMCOPY
%
% Questa funzione copia la sottomatrice d1*d1 della matrice A (di qualsiasi
% dimensione sia) nell'angolo in alto a sinistra della matrice B, di 
% dimensioni d2*d2..
% Si può chiamare questa funzione anche sulla stessa matrice A. 
% A=mmcopy(A,d1,d2) trasforma opportunamente la matrice dim1*dim1 in una 
% dim2*dim2.  
% Sintassi di chiamata:
%
%			B=mmcopy(A,d1,d2)
%
%___________________________________________________________________________

spheader

B=zeros(d2);

for i=X:1:d1
	for j=X:1:d1
		B(i,j)=A(i,j);
	end
end
