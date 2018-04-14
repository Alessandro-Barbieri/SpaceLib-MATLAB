
function [W,H]=vactowh3(jtype,a,qp,qpp,O)


%VACTOWH3 (Spacelib): Velocity and position matrix
%  
% Function  that  builds the velocity and acceleration matrices of a body moving 
% around an axis parallel to an axis of the reference frame.
%
% Input parameters:
% - jtype = defines the joint type: Prismatic or Revolute (Pri or Rev).
% - a     = defines the axis of the reference frame parallel to  the  moving 
%	    axis (X,Y, or Z).
% - qp    = module of the angular velocity vector.
% - qpp   = module of the angular acceleration vector.
% - O     = point of the motion  axis  considered as origin of the reference 
% 	    frame put on the moving body. 
%
% Output parameters:
% - W = velocity matrix.
% - H = acceleration matrix.
%
% Usage:
%
%			[W,H]=vactowh3(jtype,a,qp,qpp,O)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: D.Amadori P.Ghislotti G.Pugliese 1997
%___________________________________________________________________________


spheader

[W,H]=vactowh2(jtype,a,qp,qpp);

if (jtype==Rev)
	x= (rem(a  ,3)) +1;
	y= (rem(a+1,3)) +1;
	z= a;
	omega=[0 0 0 ];	omegapto=[0 0 0 ];
	omega(z)=qp;
	omegapto(z)=qpp;

	vel=	cross(omega,O(1:3));
	a_norm=	cross(omega,vel);	% Evaluates the normal component of the 
	acc=	cross(omegapto,O(1:3));	% acceleration vector

	acc=a_norm+acc; 		% Evaluates the tangential component of the acceleration 

	W(x,U)=-vel(x);		W(y,U)=-vel(y);		W(z,U)=-vel(z);
	H(x,U)=-acc(x);		H(y,U)=-acc(y);		H(z,U)=-acc(z);
end;

