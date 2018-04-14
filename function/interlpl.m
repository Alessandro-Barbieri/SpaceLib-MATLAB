
 function [I,intype]=interlpl(l,pl) 

%INTERSLPL (Spacelib): find the intersection of a line l with a plane pl.
%
% Function that finds the intersection of a line l with a plane pl.
%
% Input parameters
%      l       : line whose intersection must be found
%      pl      : plane whose intersection must be found
%
% Output parameters
%      I       : point where the intersection is stored
%      inttype : defines which kind of intersection was found
%		 1 = the line is coincident with the plane (the intersection
%		     is the line itself)
%		-1 = the line is parallel to the plane (no intersection)
%		 0 = there is only one intersection
%
% Usage:
%
%			[I,intype]=interlpl(l,pl) 
%
% © G.Legnani, C. Moiola 1998; adapted from: AMADORI,GHISLOTTI,PUGLIESE 1997
% bug fixed by g.legnani January 2003
%_____________________________________________________________________________

spheader

zero=zerom;
par=dot3(pl,l(:,Y));
v=l(:,1)';
%lie=dot2(pl,v)
lie=pl*l(:,1); %bug fixed Jan 2003
if(abs(par)<zero)	            	    % l is parallel to pl (%bug fixed Jan 2003)         
    if(lie<zero)     	    % pl passes through l.P 
		intype=1;    	    % the intersection is the line itself
        I=pl(:,1);          % bug fixed Jan 2003   
    else			        % pl does not pass through point l.P  
		intype=-1;          % no intersection 
        I=[0,0,0,0]';       % fictitious (%bug fixed Jan 2003)
    end
else			    	    % line and plane are incident  
	
	intype=0;	     	    % there is only one intersection  (%bug fixed Jan 2003)
	alpha=(-lie) / par;
	v=vector(l(:,Y),alpha);
	v(U)=1;
	I=v+l(:,X);       	    % I=alpha*l.dir+l.P
	I(U)=1;
end
