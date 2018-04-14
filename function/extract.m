function [u,phi]=extract(r)

%EXTRACT (Spacelib): Extracts unit vector and rotation angle from a rotation matrix.
%
%
% Extracts the  unit  vector  u of the screw axis and the rotation angle phi 
% from a rotation matrix stored in the 3*3 left-upper submatrix of a matrix R.  
% EXTRACT performs the inverse operation of ROTAT.
% Related functions: MTOSCREW, SCREWTOM, ROTAT
% Usage:
%			[u,phi]=extract(R)
%
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
% patched by g.legnani November 2001
%___________________________________________________________________________
 
spheader

u=[0 0 0]'; % u must be a column
a=0.5*(r(Z,Y)-r(Y,Z));
b=0.5*(r(X,Z)-r(Z,X));
c=0.5*(r(Y,X)-r(X,Y));
s=sqrt(a^2+b^2+c^2);
co=0.5*(r(X,X)+r(Y,Y)+r(Z,Z)-1);

phi=atan2(s,co);

co=min(1,max(-1,co)); 
v=1-co;

if (modulus(s)>0.1)
	u(X)=a/s;
	u(Y)=b/s;
	u(Z)=c/s;
elseif ( (phi~=0) & (co>0) )
	t=1/v;
	u(X)=sign(r(3,2)-r(2,3))*sqrt( abs((r(1,1)-co)*t));
	u(Y)=sign(r(1,3)-r(3,1))*sqrt( abs((r(2,2)-co)*t));
	u(Z)=sign(r(2,1)-r(1,2))*sqrt( abs((r(3,3)-co)*t));
elseif ( (phi~=0) & (co<0) )
	t=1/v;
	u(X)=sqrt( abs((r(1,1)-co)*t));
	u(Y)=sqrt( abs((r(2,2)-co)*t));
	u(Z)=sqrt( abs((r(3,3)-co)*t));

    if (   (u(X)>=u(Y)) & (u(X)>=u(Z)) )
          x=1;
    elseif ( (u(Y)>=u(X)) & (u(Y)>=u(Z)) )
          x=2;
	else
          x=3;
	end	
	y=rem(x,3)+1;
	z=rem(x+1,3)+1;
        if (r(z,y)-r(y,z))>=0
           s=1;    % segno
        else
           s=-1;
	end
	u(x)=u(x)*s;
	u(y)=u(y)*sign(r(y,x)+r(x,y))*s;
	u(z)=u(z)*sign(r(z,x)+r(x,z))*s;

else
  u=[0 0 0 ];    % rotation axis is undefined (phi==0)
end

