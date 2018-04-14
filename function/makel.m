
function L=makel(type,u,pitch,P)

%MAKEL (Spacelib): Builds a L matrix.
%
% This  function   builds a L matrix  describing a rotation  or a traslation  
% about an  axis  which  passes  through   the   point   P  and  whose  unit 
% vector is u.
% Input parameters:
%
% - 'pitch' is the pitch of the screw.
% - 'type' specifies the  type of the motion. It must be either the constant 
%   Pri for prismatic joints or Rev for revolute or screw joints. 
%   Pri and Rev are constants defined in spheader.m. If type==Pri the pitch is 
%   ignored.
%
% Output parameters:
% - L : 4*4 matrix
%
% Usage:
%
% 			L=makel(type,u,pitch,P)
%
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
% patched by G. Legnani November 2001
%___________________________________________________________________________


spheader

L=zeros(4);

%if (modulus(u)>1.001)
%        error('Error in MAKEL: Illegal unit vector :');
%end 
u=unitv(u);

if (type==Pri) 
	L(X,U)=u(X);
	L(Y,U)=u(Y);
	L(Z,U)=u(Z);
elseif (type==Rev)

	L(Y,Z)=-u(X);
	L(Z,Y)=-L(Y,Z);
	
	L(Z,X)=-u(Y);
	L(X,Z)=-L(Z,X);
	
	L(X,Y)=-u(Z);
	L(Y,X)=-L(X,Y);

	v=cross(u,P(1:3));
	
	if (v==[]) 
		v=[ 0 0 0]; 
	end
	
	L(X,U)=-v(X)+pitch*u(X);
	L(Y,U)=-v(Y)+pitch*u(Y);
	L(Z,U)=-v(Z)+pitch*u(Z);
	
else 
	error('Error in MAKEL : Illegal rotation axis ');
end

