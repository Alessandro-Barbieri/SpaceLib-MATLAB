
function [W,H]=vactowh2(type,a,qp,qpp)

%VACTOWH2 (Spacelib): Build velocity and acceleration matrices.
%
% Velocity and  acceleration  to W and H matrices.  Builds both velocity and 
% acceleration  matrices  (W and H)  from  the  values  of  the velocity and 
% acceleration (qp and qpp) of the link around the axis 'a'. The motion axis
% is coincident with x,y or z of the local reference frame. This function is 
% equivalent to VACTOWH excepts that the movement axis can be specified. 'a'
% is  an  integer  whose value must be either X,Y, or Z. X,Y,Z are constants 
% defined in the header file spheader.m. 
% The following statement:
%
%			 [W,H]=vactowh2(type,Z,qp,qpp)
%
% is equivalent to:
%	
%			[W,H]=vactowh(type,qp,qpp)
% 
% Related functions: VEACTOWH, VACTOWH3
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

spheader
 
W=zeros(4);
H=zeros(4);


if ( (type~=Rev) && (type~=Pri) )
	error('**** Error in VACTOWH2 : Illegal joint type  ****')
end

if ( a<X || a>Z )
	error('**** Error in VACTOWH2 : Illegal rotation axis ****')
end


x= (rem(a,3) ) + 1;
y= (rem(a+1,3)) +1;
z=a;

% Prismatic joint 
if (type==Pri)   
	W(z,U)=qp;
	H(z,U)=qpp;
end

% Revolution joint
if (type==Rev) 
	W(x,y)= -qp;
	W(y,x)= -W(x,y);
	H(x,y)=	-qpp;
	H(y,x)= -H(x,y);
	H(x,x)=-qp^2;
	H(y,y)=H(x,x);
end

