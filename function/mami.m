
function A2=mami(A1,M)

%MAMI (Spacelib): Transforms a matrix by the rule M*A*inv(M).
%
% Performs the matrix operation A2=M*A1*inv(M) useful in change of reference
% of Q, L,W and H matrices. A1 and A2 are square matrices. 
% M is a transformation matrix.
% MAMI performs the inverse operatin then MIAM.
% Usage:
% 
%			A2=mami(A1,M)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________


A2=(M*A1)*(invers(M));

