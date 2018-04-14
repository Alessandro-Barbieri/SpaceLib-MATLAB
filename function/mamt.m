
function A2=mamt(A1,M)

%MAMT (Spacelib): Transforms by the rule M*A1*M(t)   (t=transpose).
%
% Performs  the matrix operation  A2=M*A1*M(t) useful in change of reference 
% of J and FI matrices. A1 and A2 are square matrices. 
% M is a transformation matrix. 
% MAMT performs the inverse operation then MIAMIT.
% Usage:
%
%			A2=mamt(A1,M)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

A2=M*A1*M';

