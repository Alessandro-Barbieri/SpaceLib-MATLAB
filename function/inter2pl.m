
 function [l,test]=inter2pl(pl1,pl2)

%INTER2PL (Spacelib): find the intersection between two planes.
%
% Input parameters
%    pl1 : first plane
%    pl2 : second plane
%
% Output parameters
%     l   : line structure where the intersection is stored
%   test  : Returns NOTOK when pl1 is parallel to pl2 (no intersection)
%
% Usage:
%
%			[l,test]=inter2pl(pl1,pl2)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: AMADORI,GHISLOTTI,PUGLIESE 1997
% patched by G. Legnani November 2001
%_____________________________________________________________________________

spheader

zero=zerom;

ppl1=[pl1(X) pl1(Y) pl1(Z)];
ppl2=[pl2(X) pl2(Y) pl2(Z)];

par=cross(ppl1,ppl2);
par=par';
par(U)=0;
l=zeros(4,2);

% planes are not parallel 
%if (abs(par(X)) > zero | abs(par(Y)) > zero | abs(par(Z)) > zero)
if (modulus(par) > zero)
	l(:,Y)=par;
	d=dot3(ppl1,ppl2);
	alpha= (-pl1(U)+d*pl2(U)) / (1-d^2);
	beta = (d*pl1(U)- pl2(U)) / (1-d^2);
		for i=X:1:Z
			l(i,X)=alpha*pl1(i)+beta*pl2(i);
		end
	l(U,X)=1;
	test=OK;

% planes are parallel 
else                 
	test=NOTOK;
end

