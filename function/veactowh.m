
function [W,H]=veactowh(type,qp,qpp)

%VEACTOWH (Spacelib): Velocity  and acceleration  to W and H  matrices. 
%
% Builds both velocity and  acceleration  matrices in local  frame (W and H)  
% from  the  values of  the  joint  velocity  and acceleration  (qp and qpp) 
% and  the type of the joint 'jtype'. The  axis  of  the  movement is  the Z 
% axis of the local reference frame. 
% 'jtype' is an integer whose values must be either Rev or Pri. 
% Rev and Pri are constants defined in the header file spacelib.m. 
% Frames are assumed  to  be  positioned  using the Denavit and Hartenberg's 
% convention.
% Related functions: VACTOWH2, VACTOWH3.
% Usage:
%
%	           	[W,H]=veactowh(type,qp,qpp)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________


spheader

W=zeros(4);
H=zeros(4);

if ( (type~=Rev) && (type~=Pri) )
	error('Error in VEACTOWH: Illegal joint type ')
end

% Prismatic Joint 
if (type==Pri)   
	W(Z,U)=qp;
	H(Z,U)=qpp;
end

% Revolution joint
if (type==Rev) 

	W(X,Y)= -qp;
	W(Y,X)= -W(X,Y);
	
	H(X,Y)=	-qpp;
	H(Y,X)= -H(X,Y);
	H(X,X)=-qp^2;
	H(Y,Y)=H(X,X);
end
