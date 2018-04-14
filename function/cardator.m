
function R=cardator(q,i,j,k)

%CARDATOR (Spacelib): Cardan (or Euler) angles to rotation matrix.
%
% Builds  a  rotation  matrix  starting  from the Cardan or Euler angles
% 
% Input parameters:
% i, j, k :  specify the sequence of the rotation axes (their value must be 
%	     the constant X,Y or Z). j must be different from i and k, 
%            k could be equal to i.
% q:   3-element row vector containing the 1st, 2nd and 3rd angle.
%
% Output parameters:
% A	  : Square natrix
%
% CARDATOR performs the inverse operation then RTOCARDA.
% Usage:
% 
%                       A=cardator(q,i,j,k)
%
% Related functions: CARDATOM.
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

alfa= q(1);
beta= q(2);
gamma=q(3);


sa=sin(alfa);	sb=sin(beta);	sc=sin(gamma);
ca=cos(alfa);	cb=cos(beta);	cc=cos(gamma);

if ( i<X | i>Z | j<X | j>Z | k<X | k>Z | i==j | j==k )
	error('	Error in CARDATOR: Illegal rotation axis ');
end

if ( rem(j-i+3,3)==1 )	sig=1;  % cyclic 
	else 	        sig=-1;	% anticyclic
end


% Cardanic Convention 
if (i~=k)

	R(i,i)=cb*cc;
		R(i,j)=-sig*cb*sc;
			R(i,k)=sig*sb;

	R(j,i)= sa*sb*cc + sig*ca*sc;
		R(j,j)= -sig*sa*sb*sc + cc*ca;
			R(j,k)= -sig*sa*cb;

	R(k,i)= -sig*ca*sb*cc + sa*sc;
		R(k,j)= ca*sb*sc + sig*sa*cc;
			R(k,k)= ca*cb;  

% Eulerian Convention
else
l=6-i-j;
	
R(i,i)= cb;
	R(i,j)= sb*sc;
		R(i,l)= sig*sb*cc;

R(j,i)= sa*sb;
	R(j,j)= -sa*cb*sc + ca*cc;
		R(j,l)= -sig*(ca*sc + sa*cb*cc);

R(l,i)= -sig*ca*sb;
	R(l,j)= sig*(ca*cb*sc + sa*cc);
		R(l,l)= -sa*sc + ca*cb*cc;

end


