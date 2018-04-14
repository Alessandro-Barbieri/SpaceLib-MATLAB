
function W=cardatow(q,qp,a1,a2,a3,O)

%CARDATOW (Spacelib):  Cardan angles to velocity matrix.
%
% Builds  the  velocity  matrix  W of a frame whose origin is in O and whose 
% orientation is specified by a Euleric/Cardanic convention.
% The  parameters i, j, k  specify the sequences of the rotation axes (their
% value must be the constant X,Y or Z). 
% j must be different from i and k, k could be equal to i.
% q:   3-element vector containing the 1st, 2nd and 3rd angle.
% qp : 3-element vector containing the time derivative of q.
% CARDATOW performs the inverse operation then WTOCARDAN.
% Usage:
%
%			W=cardatow(q,qp,i,j,k,O)
%
% Related functions: CARDATOH
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

W=cardtome(q,qp,a1,a2,a3); 

for i=X:1:Z
	W(i,U)=0;
	for j=X:1:Z 
		W(i,U) = W(i,U)-W(i,j)*O(j);
	end
end

W(U,:)=[0 0 0 0];
