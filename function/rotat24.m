
function m=rotat24(a,phi,O)

%ROTAT24 (Spacelib):  Rotation matrix around an axis with origin in a point.
% 
% This function builds a position matrix m of a frame whose origin is stored  
% in point 'O' and rotated of angle 'phi' around axis 'a'. 
% - O : homogeneous coordinates of origin.
% - a : must be the constant X, Y, Z, U.
% If a=U, the rotation is assumed null (3×3 identity matrix generated).
% Usage:
%
% 			m=rotat24(a,phi,O)
%
% Related functions : ROTAT, ROTAT2
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

if ( a<X | a>U )
	error('Error in ROTAT24: Illegal rotation axis ');

elseif O(U)~=1
	error('Error in ROTAT24: Illegal point "o" ');
 
end

m=rotat2(a,phi);
m(U,X:Z)=[0 0 0];
m(:,U)=O(:);
