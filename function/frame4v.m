
function M=frame4V(P1,V1,V2,a1,a2)

%FRAME4V (Spacelib): Frame from a point and two vectors.
%
% Builds  a 4*4 position M matrix  describing  the  position and orientation
% of a frame attached to two vectors and one point. The origin is in point P1
% axis a1 is directed as vector V1, axis a2 is directed as V2 (if possible). 
% Axis a1 has priority.
% The third axis is directed as V1xV2. The second axis is directed  as a3*a1
% Axes a1 and a2 must be either the constants X, Y or Z, defined in spacelib.m. 
% a1 must be different from a2. 
% P1 must be in homogeneus coordinates.
% Usage:
%
%			M=frame4V(P1,V1,V2,a1,a2)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

M=NULL4;
M(1:3,1:3)=framev(V1,V2,a1,a2);
M(:,U)=P1(:);
