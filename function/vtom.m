
function A=vtom(v)

%VTOM (Spacelib): Creates a skew-symmetric matrix from a vector v.
%
% Vector to matrix.
%
% Creates a 3*3 skew-symmetric sub-matrix from a vector v and stores it in
% matrix A. 
% VTOM performs the inverse operation then MTOV.
% Usage:
%
%                               A=vtom(v)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990 
%___________________________________________________________________________


spheader

A(X,Y)=-v(Z);
A(X,Z)= v(Y);
A(Y,Z)=-v(X);
  
A(Y,X)= v(Z);
A(Z,X)=-v(Y);
A(Z,Y)= v(X);
 

