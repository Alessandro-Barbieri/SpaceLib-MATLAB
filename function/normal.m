
function N=normal(A)

%NORMAL(Spacelib): normalize (orthogonalize) the 3×3 upper left part of a matrix.
%
% Makes orthogonal  the 3×3 upper left submatrix of matrix A 
%
% 			B=normal(A)
%
% NOTE: a  square  matrix  is  orthogonal  if  its transpose and its inverse coincide
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________
N=A;
N(1:3,1:3)=normal3(A(1:3,1:3));


