
function [u,fi,p,h]= mtoscrew(m)

%MTOSCREW (Spacelib): Extracts from a matrix the parameters of the screw displacement
%
% Matrix to screw. 
% Extracts  from  a  rototraslation  matrix  Q the  parameters of the  screw 
% displacement  (axis u, rotation  angle fi, displacement h along u, a point 
% of the axis  P).  Point   P  is the point of the screw axis nearest to the 
% origin of the reference frame.
% MTOSCREW performs the inverse operation than SCREWTOM.
% Usage:
%
%			[u,fi,P,h]= mtoscrew(m)
%
% Related functions: EXTRACT, ROTAT, SCREWTOM. 
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990 
%___________________________________________________________________________


spheader

toll=10e-10; % value of translation h below this value are considered null
             % by g. legnani november 2001
             
p=[0 0 0 1]'; % P must be a column!
u=[0 0 0]';   % u must be a column!
a=0.5*(m(Z,Y)-m(Y,Z));
b=0.5*(m(X,Z)-m(Z,X));
c=0.5*(m(Y,X)-m(X,Y)); 
s=sqrt(a^2+b^2+c^2);
co=0.5*(m(X,X)+m(Y,Y)+m(Z,Z)-1);

fi=atan2(s,co);

co=min(1,max(-1,co));
v=1-co;

% Calcolo della traslazione lungo l'asse (h)

[u fi]=extract(m(1:3,1:3));

%h=u(X)*m(X,U)+u(Y)*m(Y,U)+u(Z)*m(Z,U);

if(abs(v)==0)
    p=[0 0 0 1]'; %pure translation
    h=modulus(m(X:Z,U));
    u=unitv(m(X:Z,U));
    if(h==0)
        u=unitv([1 1 1]');   %axis undefined. conventionally assigned to [1 1 1]
    end
else
    h=u(X:Z)'*m(X:Z,U);
    p(X:Z)=0.5/v*(eye(3,3)-m(X:Z,X:Z)')*m(X:Z,U);
end
%if (abs(h) <toll) 
%	h=0;
%end

%if(v==0)            % if v==0 the rotation is 180° degrees
%	p=[0 0 0 1]';
%else
%	t1= 0.5/v;
%	for i=X:1:U
%		t=0;
%		for j=X:1:U
%			t=t-m(j,i)*m(j,U);
%		end
%	p(i)=(t+m(i,U))*t1;
%	end
%    p(U)=1;
%end 


