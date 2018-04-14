
function [q1,qp1,q2,qp2]=wtocarda(m,W,i,j,k)

%WTOCARDA (Spacelib): Extracts Euler/Cardan parameters from velocity matrix
%
% Function  that  extracts  the  Euler/Cardan  angles  and  their first time 
% derivative from position matrix m and velocity matrix W respectively.
% Input parameters:
% m    : Position matrix
% W    : Velocity matrix
% i,j,k: Constants that define the rotation sequence (they must be X,Y,or Z)
%
% Output parameters:
% q1,q2  : arrays of 3  real  that  contains the two Euler/Cardan angles set  
% qp1,qp2: arrays of 3  real  that  contains the two Euler/Cardan angles set 
% 	   first time derivative
%
% Usage:
%
%			[q1,qp1,q2,qp2]=wtocarda(m,W,i,j,k)
%
% NOTE: The first time derivative of Euler/Cardan angles is evaluated using 
% 	the relation :
%
%			qpx=omega*Ainverse
%
% where qpx can be either qp1 or qp2.
%
% © G.Legnani, C. Moiola 1998; adapted from: D.Amadori, P.Ghislotti G.Pugliese 1997
%___________________________________________________________________________

spheader

if ( i<X | i>Z | j<X | j>Z | k<X | k>Z | i==j | j==k )
	error('	Error in WTOCARDA: Illegal rotation axis');
end

if ( rem(j-i+3,3)==1 )	sig=1;  % cyclic rotations 
	else 	        sig=-1;	% anticyclic rotations
end

[q1,q2]=mtocarda(m,i,j,k);
omega=mtov(W);

alpha1= q1(1);
beta1 = q1(2);
alpha2= q2(1);
beta2 = q2(2);

[Ai1,test1]=inva(alpha1,beta1,sig,i,j,k);

if (test1==OK)
	qp1=Ai1*omega;
    qp1=qp1';
else
	error('Error in WTOCARDA: There is a singular position	');
end

[Ai2,test2]=inva(alpha2,beta2,sig,i,j,k);

if (test2==OK)
	qp2=Ai2*omega;
    qp2=qp2';
else
	error('Error in WTOCARDA: There is a singular position	');
end
