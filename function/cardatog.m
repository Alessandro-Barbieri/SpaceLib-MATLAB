function G=cardatog(q,qp,qpp,i,j,k)

%CARDATOG (Spacelib):  Cardan angles to angular acceleration matrix.
%
% Evaluates the angular acceleration matrix of a moving frame from the three
% Cardan(or Euler) angles  q and their first  and second time derivatives qp
% and qpp.
% The parameters i, j, k  specify  the sequences of the rotation axes (their
% value must be the constant X,Y or Z). 
% j must be different from i and k, k could be equal to i.
% q:   3-element vector containing the 1st, 2nd and 3rd angle.
% qp:  3-element vector containing the first time derivative of q.
% qpp: 3-element vector containing the second time derivative of q. 
% A:   Matrix where the result  must be stored. 
%       G =dw/dt + w^2.
% CARDATOG performs the inverse operation than  GTOCARDA.
% Usage:
%
%                       A=cardatog(q,qp,qpp,i,j,k)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

mat=cardatol(q,i,j,k);

omega=mat*qp';

mat1=cardtowp(q,i,j,k);

wprod(X) = qp(Y)*qp(Z);
wprod(Y) = qp(X)*qp(Z);
wprod(Z) = qp(X)*qp(Y);


buffer = mat*qpp';
buffer1=mat1*wprod';

OMEGAPTO=buffer+buffer1; 

G=vtom(OMEGAPTO);

G(X,X) = G(X,X) -omega(Y)^2 - omega(Z)^2;
G(Y,Y) = G(Y,Y) -omega(X)^2 - omega(Z)^2;
G(Z,Z) = G(Z,Z) -omega(X)^2 - omega(Y)^2;

for i=X:1:Z
	for j=X:1:Z;
		if (i~=j)
			G(i,j)=G(i,j)+omega(i)*omega(j);
		end
	end
end
