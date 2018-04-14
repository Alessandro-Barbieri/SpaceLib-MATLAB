
function L=makel2(type,a,pitch,P)

%MAKEL2 (Spacelib): Builds a L matrix - version 2.
%
% Builds a L matrix - version 2.
% This  function  builds  a  L  matrix describing a rotation or a traslation 
% about an axis parallel to the frame axis 'a' and passing through the point 
% 'P'.
% 		
% - 'a' is the axis of rototraslation it must be the constant X,Y or Z.
% - 'pitch' is the pitch of the screw.
% - 'type' specifies the  type of the motion. It must be either the constant 
%   Pri for prismatic joints or Rev for revolute or screw joints. 
%   X,Y,Z,Pri and Rev are constants defined in spheader.m. 
%   If type==Pri the pitch is 
%   ignored.
%
% Usage:
% 			L=makel2(type,a,pitch,P)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

L=NULL4;

if (a<X)|(a>Z)
	error('Error in MAKEL2: Illegal rotation axis ');
end


if (type==Pri) 
	
	L(a,U)=1;

elseif (type==Rev)

x=rem(a,3)+1;
y=rem(a+1,3)+1;
z=a;

L(y,x)= 1;
L(x,y)=-1;
L(x,U)= P(y);
L(y,U)=-P(x);
L(z,U)= pitch;

else 
	error('Error in MAKEL2: Illegal joint type ');
end

