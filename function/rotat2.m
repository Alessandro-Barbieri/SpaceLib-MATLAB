
function R=rotat2(a,phi)

%ROTAT2 (Spacelib): Build a rotation matrix.
%
% Rotation around a frame axis.
% This function builds a 3*3 rotation matrix R describing a rotation of angle 
% 'phi', around axis 'a'. Axis 'a' must be the constant X, Y, Z, U.
% The rotation  matrix  is  stored  in  the 3*3 matrix R.
% If a=U, the rotation is assumed null (3*3 identity matrix generated).
% Usage:
%
%                       A=rotat2(a,phi)
%
% Related functions: ROTAT, ROTAT24.
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

if ( a<X | a>U )
	error('**** Error in ROTAT2 : Illegal rotation axis ****');
end

% Only translation
if (a==U) 
	R=eye(3);  % Unit matrix 3*3 

else 
	x=rem(a,3)+1;	y=rem(a+1,3)+1;	z=a;

	c=cos(phi);	s=sin(phi);
	R(x,x)= c;	R(x,y)=-s;	R(x,z)= 0;
	R(y,x)= s;	R(y,y)= c;	R(y,z)= 0;
	R(z,x)= 0;	R(z,y)= 0;	R(z,z)= 1;

end 


