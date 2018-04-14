
function C=skew(A,B)

%SKEW (Spacelib): Performs  the matrix operation  C=SKEW{A,B}=A*B-B'*A'.
%
% Performs  the matrix operation  C=SKEW{A,B}=A*B-B'*A' applicable to square 
% matrices of identical dimensions.
%
%			C=skew(A,B)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

C= (A*B)-(A*B)';

