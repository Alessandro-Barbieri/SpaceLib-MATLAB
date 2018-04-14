
function M=dhtomstd(theta,d,a,alfa)

%DHTOMstd (Spacelib): Denavit and Hartenberg parameters to Matrix. (standard definition)
%
% Builds  the  position  matrix  m  of  a link from the  standard Denavit and Hartenberg's  
% parameters  theta, d, a, alpha. 
%
%  theta  link rotation
%  d      link offset
%  a      link length
%  alpha  link twist
%
% for revolute joint, the joint coordinate is theta,
% for prismatic joint, the joint coordinate is d
%
% see also function dhtom
% 
%  M=Rot(Z,theta)*Tras(Z,d)*Tras(X,a)*Rot(x,alpha)
% 
% Usage:
%			M=dhtomstd(theta,d,a,alfa)
%
%
% © G.Legnani 2005
%___________________________________________________________________________
  
spheader

ca=cos(alfa);		sa=sin(alfa);
ct=cos(theta);		st=sin(theta);


M(X,X)=ct;   M(X,Y)=-st*ca;	 M(X,Z)=st*sa;    M(X,U)=a*ct;
M(Y,X)=st;   M(Y,Y)=ct*ca;     M(Y,Z)=-ct*sa;   M(Y,U)=a*st;
M(Z,X)=0;    M(Z,Y)=sa;        M(Z,Z)=ca;       M(Z,U)=d;
M(U,X)=0;    M(U,Y)=0;         M(U,Z)=0;        M(U,U)=1;

