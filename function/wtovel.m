
function [axis,omega,vel,P]=wtovel(W)

%WTOVEL (Spacelib): Velocity matrix to screw parameters.
%
% Extracts the screw parameters from a velocity matrix W.
%
% Output parameters:
% - axis : axis of rotation (unit vector).
% - omega: angular speed around axis (scalar).
% - vel  : linear velocity along axis.
% - P    : a point of the axis (the closest to the origin).
%
% If omega ==0 (pure translation) the origin is assumed as P. 
% If ( omega==0 and vel==0) u is undefined.
% Usage:
%
%			 [axis,omega,vel,P]=wtovel(W)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

u=zeros(3,1);
u(X)=W(Z,Y); 
u(Y)=W(X,Z); 
u(Z)=W(Y,X);

[axis omega]=unitv(u);

if (omega~=0)
	
	v(X)=W(X,U);
	v(Y)=W(Y,U);
	v(Z)=W(Z,U);

        axis
        v

        P=cross(axis,v');

	P=P'/omega;
	P(U)=1;	
	vel=dot3(axis,v);

else 
	u(X)=W(X,U);
	u(Y)=W(Y,U);
	u(Z)=W(Z,U);
	P=[ 0 0 0 1]';

	[axis vel]=unitv(u);
end

