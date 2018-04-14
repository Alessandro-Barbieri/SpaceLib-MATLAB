
function FI=actom(fx,fy,fz,cx,cy,cz)

%ACTOM (Spacelib):  Actions to matrix.
%
% Builds the action matrix FI  from the components of the forces fx, fy, fz 
% and the torque (or couples) cx, cy, cz.
% Usage:
%
% 			FI=actom(fx,fy,fz,cx,cy,cz)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%_________________________________________________________________________


spheader

FI(X,X)=0;	FI(X,Y)= -cz;	FI(X,Z)= cy;	FI(X,U)= fx;

FI(Y,X)= cz;	FI(Y,Y)=0;	FI(Y,Z)= -cx;	FI(Y,U)= fy;

FI(Z,X)= -cy;	FI(Z,Y)= cx;	FI(Z,Z)=0;	FI(Z,U)= fz;

FI(U,X)= -fx;	FI(U,Y)= -fy;   FI(U,Z)= -fz;	FI(U,U)=0;

