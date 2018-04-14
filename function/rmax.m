
function [rmaxx,im,jm]=rmax(mat,idim,jdim,imin,imax,jmin,jmax)

%___________________________________________________________________________
%
%
% E' una subroutine per l'utilizzo di dyn_eq.m  e linears.m
%
% Restituisce (con segno) l'elemento di modulo massimo di una matrice di
% imax*jmax memorizzata in un array di idim*jdim.
% La matrice non viene scandita tutta, ma solo gli elementi di coordinate 
% maggiori o uguali a IMIN,JMIN.
% Fornisce le coordinate IM,JM dell'elemento di modulo massimo.
% IM=JM indica un errore.
% Usage:
%		[rmaxx,im,jm]=rmax(mat,idim,jdim,imin,imax,jmin,jmax)
%___________________________________________________________________________


rmaxx=0;

im=1;	jm=1;

if (imin > imax) | (imax>idim) | (jmin > jmax) | (jmax>jdim) 
	return
end 

rmaxx=0;

for i=imin:1:imax
	for j=jmin:1:jmax
		if ( abs(mat(i,j)) > abs(rmaxx) ) 
			rmaxx=mat(i,j);
			im=i;
			jm=j;
		end
	end
end

