
function H=cardatoh(q,qp,qpp,i,j,k,O)


%CARDATOH (Spacelib): Cardan angles to acceleration matrix.
%
% Builds the acceleration  matrix  H  of  a   frame  whose  origin is  in  O
% and whose orientation is specified by a Euleric/Cardanic convention.
% The parameters i, j, k  specify  the sequences of the rotation axes (their
% value must be the constant X,Y or Z). 
% j must be different from i and k, k could be equal to i.
% q:   3-element vector containing the 1st, 2nd and 3rd angle.
% qp : 3-element vector containing the time derivative of q.
% qpp: 3-element vector containing the 2nd time derivative of q.
% Usage:
%
%			H=cardatoh(q,qp,qpp,i,j,k,O)
%
% Related functions : CARDATOW
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

H=cardatog(q,qp,qpp,i,j,k);

for i=X:1:Z
	H(i,U)=0;
	for j=X:1:Z
		H(i,U)=H(i,U)-H(i,j)*O(j);
	end
end
H(U,:)=[0 0 0 0];

