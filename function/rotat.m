
function R=rotat(u,phi);

%ROTAT (Spacelib): Builds the rotation matrix R.
%
% Builds the rotation matrix R from the unit vector u and the rotation angle 
% phi of the angular displacement; it stores the matrix in the 3×3
% matrix A.
% The function ROTAT performs the inverse operation than EXTRACT.
% Related functions : ROTAT2, ROTAT4
% Usage:
%                       R=rotat(u,phi)
%
% Example :
%
% R=rotat(u,phi)          Builds a 3×3 rotation matrix
% M(1:3,1:3)=rotat(u,phi) Builds a rotation matrix storing it in the 3×3
%                        left-upper part of matrix M.
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________


spheader

s=sin(phi);
v=1-cos(phi);

u=unitv(u); % patch by G.Legnani November 2001

R(X,X)= 1 + (u(X)^2-1)*v;
R(X,Y)= -u(Z)*s + u(X)*u(Y)*v;  
R(X,Z)= u(Y)*s + u(X)*u(Z)*v; 

R(Y,X)= u(Z)*s + u(X)*u(Y)*v;  
R(Y,Y)= 1 + (u(Y)^2-1)*v;
R(Y,Z)= -u(X)*s + u(Y)*u(Z)*v;

R(Z,X)= -u(Y)*s + u(X)*u(Z)*v;
R(Z,Y)= u(X)*s + u(Y)*u(Z)*v;
R(Z,Z)= 1 + (u(Z)^2-1)*v;


