
function [Ai,test]=inva(alpha,beta,sig,i,j,k)

%INVA (Spacelib): builds the inverse of a matrix A (Euler/Cardan velocity). 
%
% It is useful in order to evaluate the first time derivative of the 
% Euler/Cardan angles.
%
% Input parameters:
% alpha, beta : the first two Euler/Cardan angles
% sig  :  parameters that defines the sign of some elements in the 
%	  inverse  of A.
% i,j,k: constants that define the rotation sequence (they musy be X,Y or Z)
%
% Output parameters:
% Ai : it's the  matrix where the inverse of A is stored.
% test: it could be the value OK or NOTOK, that value indicates if there are 
%       singular positions
% Usage:
%			[Ai,test]=inva(alpha,beta,sig,i,j,k)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: AMADORI,GHISLOTTI, PUGLIESE 1997
% bug fixed january 2003 (g.legnani) for compatibility with new matlab release
%___________________________________________________________________________


spheader

sa=sin(alpha);		ca=cos(alpha);	
sb=sin(beta);		cb=cos(beta);

if ( ((i~=k)&(cb==0)) | ((i==k)&(sb==0)) ) % There is a singularity %bug fixed jan 2003
	test=NOTOK
	fprintf(1,'Warning: singular position ');
	% return
end 

if i~=k
	Ai(X,i)=1; 	Ai(X,j)=sa*sb/cb;	Ai(X,k)=-sig*ca*sb/cb;
	Ai(Y,i)=0;	Ai(Y,j)=ca;		Ai(Y,k)=sig*sa;
	Ai(Z,i)=0;	Ai(Z,j)=-sig*sa/cb;	Ai(Z,k)=ca/cb;

else 
	l=6-i-j;
	Ai(X,i)=1; 	Ai(X,j)=-sa*cb/sb;	Ai(X,l)=sig*ca*cb/sb;
	Ai(Y,i)=0;	Ai(Y,j)=ca;		Ai(Y,l)=sig*sa;
	Ai(Z,i)=0;	Ai(Z,j)=sa/sb;		Ai(Z,l)=-sig*ca/sb;
	
end

test=OK;


