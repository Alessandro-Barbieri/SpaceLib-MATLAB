
function C=crosstom(A1,A2)



%CROSSTOM (Spacelib): matrix cross product:
%         evaluate the cross produc of two vectors and store the result in a 3*3 matrix
%
%   A1 and A2 may be either two column vectors or 3*3 matrix representation of vectors
%
%    A1=[a1x; a1y; a1z];      A2=[a2x; a2y; a2z];
%    C=crosstom(A1,A2) % valid statement
%
%    A1=[0 -a1z a1y; a1z 0 -a1x; -a1y a1x 0];
%    A2=[0 -a2z a2y; a2z 0 -a2x; -a2y a2x 0];
%    C=crosstom(A1,A2) % valid statement
%
%   in both cases C is the matrix representation of A1 cross A2
%
% Usage:
%
%			c=crosstom(A1,A2)
%
% bug fixed G. Legnani November 2005
%___________________________________________________________________________

C=-A1*A2'+A2*A1';

