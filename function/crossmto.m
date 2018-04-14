
function C=crossmto(A1,A2)



%CROSSMTO (Spacelib): matrix cross product: performs the operation: C=A2'*A1-A1'*A2 
%
% If matrices A1 and A2 express two vectors a1 and a2 in the matricial form,
% this operation is equivalent to their cross product c = a1 x a2 but the
% result is stored in a 3x3 skew-symmetric matrix.
% Usage:
%
%			c=crossmtom(A1,A2)
%
% bug fixed G. Legnani January 2003
%___________________________________________________________________________

C=A2'*A1-A1'*A2;

