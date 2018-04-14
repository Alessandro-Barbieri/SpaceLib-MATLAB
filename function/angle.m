

function alfa=angle(P1,P2,P3)

%ANGLE (Spacelib) :  Angle between 3 points.
%
% Function  returning  the  angle  between  three  points which is the angle 
% between vectors(P1-P2) and (P3-P2).
% Usage:
%
%			alfa=angle(P1,P2,P3)			
%
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


a=vect(P1,P2);
a=unitv(a);

b=vect(P3,P2);
b=unitv(b);

dot3(a,b);

alfa=acos(dot3(a,b));



