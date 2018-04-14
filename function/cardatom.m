
function M=cardatom(q,i,j,k,O)


%CARDATOM (Spacelib): Cardan angles to position matrix.
%
% Builds  the  position  matrix M of a frame whose origin is the point O and 
% whose orientation is specified  by a Euleric/Cardanic convention.
% The  parameters  i, j, k  specify   the   sequence   of  the rotation axes 
% (their value must be the constant (X,Y or Z). 
% j must be different from i and k, k could be equal to i.
% q:   3-element vector containing the 1st, 2nd and 3rd angle.
% The rotation angles must be < PI.
% Usage:
%
%			M=cardatom(q,i,j,k,O)	
%
% Related functions: CARDATOR, MTOCARDA
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader
M=NULL4;
M=cardator(q,i,j,k);
M(U,X:Z)=[0 0 0];
M(:,U)=O(:);

