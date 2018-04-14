
function M=dhtom(type,theta,d,b,a,alfa,q)

%DHTOM (Spacelib): Denavit and Hartemberg parameters to Matrix (extended version).
%
% Builds  the  position  matrix  m  of  a link from the extended Denavit and 
% Hartemberg's  parameters  q, theta, d, b, a, alpha, the value of the joint 
% coordinate q and the type of the joint 'jtype'. 
% jtype is an integer whose value must be either Rev or Pri. Rev and Pri are 
% constants  defined  in  the  header  file  spheader.m.  If the joint type is 
% prismatic,  the  value  of q is added to d, while for revolute jopint q is 
% added to theta.
% If b==0 the extended D&H parameters coincide with the canonical ones.
%
%  theta  link rotation
%  d      link offset
%  b      shift
%  a      link length
%  alpha  link twist
% 
%  M=Rot(Z,theta)*Tras(Z,d)*Tras(X,a)*Tras(Y,b)*Rot(x,alpha)
% 
% see also function dhtomstd
%
% Usage:
%			M=dhtom(jtype,theta,d,b,a,alfa,q)
%
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________


spheader

% Check on the joint type
if ( type<Rev | type>Pri )
	error(' **** Error in DHTOM.M: Illegal joint type ****')
end

% Prismatic Joint
if (type==Pri)
	d=d+q;
	
else 
	theta=theta+q;
end      
  
ca=cos(alfa);		sa=sin(alfa);
ct=cos(theta);		st=sin(theta);


M(X,X)=ct;   M(X,Y)=-st*ca;	M(X,Z)=st*sa;	M(X,U)=a*ct-b*st;
M(Y,X)=st;   M(Y,Y)=ct*ca;      M(Y,Z)=-ct*sa;  M(Y,U)=a*st+b*ct;
M(Z,X)=0;    M(Z,Y)=sa;         M(Z,Z)=ca;      M(Z,U)=d;
M(U,X)=0;    M(U,Y)=0;          M(U,Z)=0;       M(U,U)=1;

