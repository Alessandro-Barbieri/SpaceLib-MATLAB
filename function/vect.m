
function V=vect(a,b)

%VECT (Spacelib): Function that builds a vector between two points.
%
% This function builds a vector between two points a and b. 
% Usage:
%
%		V=vect(a,b)	
%
% The points must be specified in homogeneus coordinates:
%
% 		a=[x1 y1 z1 1]'		b=[x2 y2 z2 1]'
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.legnani and R.Adamini 1993
%___________________________________________________________________________

spheader

V=(a(1:3)-b(1:3));


