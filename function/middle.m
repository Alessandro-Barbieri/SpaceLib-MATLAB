
function c=middle(a,b)

%MIDDLE (Spacelib): Function evaluates the middle point between two points.
%
% This function evaluates the middle point c bettween two points 
% a and b.
% Calling sintax: 
%			c=middle(a,b)
%
% The function returns the point c in homogeneous coordinates
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________

spheader

c=(.5*(a+b));

c(U)=1;
