
function v=mtov(M)

%MTOV (Spacelib): Extracts  a column vector v from a matrix A.
%
% Matrix to vector.
% Extracts  a column vector v from the 3×3 left-upper skew-symmetric submatrix 
% of a matrix M.
% MOTV performs the inverse operation then VTOM.
%
%			v=mtov(M)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990 
%___________________________________________________________________________

spheader

v=0.5*[(M(Z,Y)-M(Y,Z))	(M(X,Z)-M(Z,X))	(M(Y,X)-M(X,Y)) ]';
