

function R=framep(P1,P2,P3,a1,a2)

%FRAMEP (Spacelib): rotation matrix from 3 points.
%
% Builds  a  rotation  matrix  describing  the  angular  position of a frame 
% attached from three points.
% The origin  is in P1, axis a1 points from P1 toward point P2, axis a2 from 
% P1 toward point P3 (if possible). Axis a1 has priority on a2.
% Axis a1 is directed as (P2-P1).
% Axis a3 is directed as (P2-P1) x (P3-P1).
% Axis a2 is directed as Axis a3 x Axis a1.
% a1 and a2 (the axes)  must  be  either the constants X, Y or Z, defined in  
% spacelib.m. a1 must be different from a2. The rotation matrix is stored in 
% the 3×3 matrix A.
% Usage:
%
%                       A=framep(P1,P2,P3,a1,a2)
%
% Related functions: FRAME4P.
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

if (a1==a2) || (min(a1,a2)<X) || (max(a1,a2)>Z)
	error(' Error in FRAMEP: illegal axis ')
end

a=P2(1:3)-P1(1:3);
b=P3(1:3)-P1(1:3);

R=framev(a,b,a1,a2);

