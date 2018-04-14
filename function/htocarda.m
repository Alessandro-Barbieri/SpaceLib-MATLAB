
function [q1,q2,qp1,qp2,qpp1,qpp2]=htocarda(m,W,H,i,j,k)

%HTOCARDA : Extract Euler/Cardan angles, velocity, acceleration from acceleration matrix.
%
% Function that extracts the Euler/cardan angles and their  first and second
% time derivative from position matrix M, velocity matrix W and acceleration
% matrix H respectively.
% Input parameters:
% M : Position matrix
% W : Velocity matrix
% H : Acceleration matrix
% i,j,k : Constants that defines the rotation sequence (they must be X,Y,Z)
%
% Output parameters:
% q1,q2     : Array of 3 real elements  that  contains  the two Euler/Cardan 
%	      angles set.
% qp1,qp2   : Array of 3 real  elements  that  contains the two Euler/Cardan 
% 	      angles set first time derivative.
% qpp1,qpp2 : Array of 3 real  elements  that  contains the two Euler/Cardan 
% 	      angles set second time derivative.
%
% Usage:
%
%		[q1,q2,qp1,qp2,qpp1,qpp2]=htocarda(m,W,H,i,j,k)
%
% © G.Legnani, C. Moiola 1998; adapted from: D.Amadori, P.Ghislotti G.Pugliese 1997
% bug fixed January 2003 g.Legnani
%__________________________________________________________________________ 


spheader

if ( i<X | i>Z | j<X | j>Z | k<X | k>Z | i==j | j==k )
	error(' Error in HTOCARDA: Illegal rotation axis ')
end

if (rem(j-i+3,3)==1)	sig=1;   % cyclic 
	else            sig=-1;  % anti cyclic
end

[q1,qp1,q2,qp2]=wtocarda(m,W,i,j,k);
%G=mmcopy(H,3);
G=H(1:3,1:3);
omegapto=gtomgapt(G);

alpha1=q1(1);	beta1 =q1(2);
alpha2=q2(1);	beta2= q2(2);

% Evaluates qpp1
Atil1=atilde(alpha1,beta1,sig,i,j,k);

qtilde(i)     = qp1(Y)*qp1(Z);
qtilde(j)     = qp1(X)*qp1(Z);
qtilde(6-i-j) = qp1(X)*qp1(Y);

prod=Atil1*qtilde';

aux(i)=prod(X); aux(j)=prod(Y); aux(6-j-i)=prod(Z);
aux1=omegapto-(aux)';

[Ai1,test]=inva(alpha1,beta1,sig,i,j,k);

if(test==OK)
	qpp1=Ai1*aux1;
else
	error('Error in HTOCARDA: There is a singular position ');
end

% Evaluates qpp2
Atil2=atilde(alpha2,beta2,sig,i,j,k);

qtilde(i)     = qp2(Y)*qp2(Z);
qtilde(j)     = qp2(X)*qp2(Z);
qtilde(6-i-j) = qp2(X)*qp2(Y);

prod=Atil2*qtilde';
aux(i)=prod(X); aux(j)=prod(Y); aux(6-j-i)=prod(Z);
aux2=omegapto-(aux)';

[Ai2,test]=inva(alpha2,beta2,sig,i,j,k);

if (test==OK)
	qpp2=Ai2*aux2;
else
	error('Error in HTOCARDA: There is a singular position ');
end

%qp1=qp1'; qp2=qp2'; jan 2003
qpp1=qpp1'; qpp2=qpp2';

