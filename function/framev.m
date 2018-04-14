
function R=framev(V1,V2,a1,a2)

%FRAMEV (Spacelib): rotation matrix from 2 vectors.
%
% Builds  a  rotation  matrix  describing  the  angular position  of a frame 
% attached to two vectors.
% axis a1 is directed as V1, axis a2 is directed as V2 (if possible). 
% Axis a1 has priority.
% The third axis is directed as V1xV2. The second axis is directed  as a3*a1
% Axes a1 and a2 must be either the constants X,Y or Z,defined in spacelib.m. 
% a1 must be different from a2. 
% The rotation matrix is stored in the 3×3 matrix A.
% Usage:
%
%                       A=framev(V1,V2,a1,a2)
%
% Related functions: FRAME4V
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
% patch G.Legnani January 2004
%___________________________________________________________________________



spheader

a3=6-a1-a2; 

R=NULL3;

if ( (a1==a2) || (min(a1,a2)<X) || (max(a1,a2)>Z) )
	error(' Error in FRAMEV: illegal axis ');
end

a=unitv(V1);

if (a1==X & a2==Y) || (a1==Y & a2==Z) || (a1==Z & a2==X)
	c=cross(a,V2); 
        c=unitv(c);    
	b=cross(c,a);  
else
	c=cross(V2,a);
        c=unitv(c);
	b=cross(a,c);
end

for i=X:1:Z
	R(i,a1)=a(i);
	R(i,a2)=b(i);   
	R(i,a3)=c(i);
end
