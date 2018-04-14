
function Atil=atilde(alpha,beta,sig,i,j,k)

%ATILDE (Spacelib): Function  that  builds  the matrix A tilde.
%
% Is useful in order to evaluate the second time derivative of the Euler/Cardan angles. 
% 
% Input parameters:
%
% alpha,beta : the first two Euler/Cardan angles
% sig   : parameters that define the sign of some elements in matrix A tilde
% i,j,k : constants that define the rotation sequence (they must be X,Y,Z).
%
% Output parameters:
%
% Atil       : it's the matrix where A tilde is stored.
% Usage:
%
%			Atil=atilde(alpha,beta,sig,i,j,k)
%___________________________________________________________________________
 

spheader

sa=sin(alpha);	sb=sin(beta);
ca=cos(alpha);	cb=cos(beta);

if (i~=k)	      % Cardan convention 

	Atil(X,i)= sig*cb;    	Atil(X,j)= 0;
	Atil(Y,i)= sig*sa*sb; 	Atil(Y,j)= (-sig)*ca*cb;
	Atil(Z,i)= -ca*sb;    	Atil(Z,j)= -sa*cb;

	Atil(X,k)=0;
	Atil(Y,k)= -sa;
	Atil(Z,k)= sig*ca;

else		     % Euler convention

	l=6-i-j;
	Atil(X,i)= -sb;          Atil(X,j)= 0;
	Atil(Y,i)= sa*cb;        Atil(Y,j)= ca*sb;
	Atil(Z,i)= (-sig)*ca*cb; Atil(Z,j)= sig*sa*sb;

	Atil(X,l)=0;
	Atil(Y,l)=-sa;
	Atil(Z,l)=sig*ca;
end 

