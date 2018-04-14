
function [lmindist,mindist,pl,I,inttype]=intersec(l1,l2)

%INTERSEC (Spacelib): finds the intersection of two lines. 
%
% It builds also (if possible) the plane which contains the two lines. 
% Builds the minimum distance line and evaluates the distance between 
% the lines.
%
% Input parameters
%      l1,l2    : line structures whose intersection must be evaluated
% Output parameters
%      lmindist	: is a line orthogonal to l1 and l2 which has the minimum
%		 distance from l1 and l2
%      mindist	: the module of the minimum distance between l1 and l2
%      pl	: plane that contains l1 and l2
%      I	: intersection point of l1 and l2
%      inttype	: defines which kind of intersection was found
%		  1 = point I is not real intersection, only middle point
%		      between two oblique lines. Plane pl does not contain
%		      really l1 and l2
%		  0 = point I is the intersection of l1 and l2. Plane pl
%		      contains the two lines
%		 -1 = there are infinite intersections (l1==l2). Plane pl is
%		      undefined
%		  2 = there aren't any intersections because l1 and l2 are
%		      parallel . Plane pl can be found
%
% Usage:
%
%		[lmindist,mindist,pl,I,inttype]=intersec(l1,l2)
%
% © G.Legnani, C. Moiola 1998; adapted from: AMADORI,GHISLOTTI, PUGLIESE 1997
% patched by G. Legnani November 2001
% patched on January 2003 by G.Legnani
%           (call to function 'dist' replaced to 'distp
%            for compatibility with new MATLAB releases)
%_____________________________________________________________________________

spheader

lmindist=zeros(4,2);
zero = zerom;           		% machine zero 
deltap=vect(l2(:,X),l1(:,X));  		% deltap=(P2-P1) 
% To avoid problems with cross
dir1=l1(1:3,Y);
dir2=l2(1:3,Y);
u3=cross(dir1,dir2);			% u3 is orthogonal to l1 and l2
u3(U)=0;				% l1 and l2 are not parallel 

if (abs(u3(X)) > zero | abs(u3(Y)) > zero | abs(u3(Z)) > zero)
	
		c1 = dot3(l1(:,Y),deltap);     % c1=U1t*(P2-P1)
		c2 = dot3(l2(:,Y),deltap);     % c2=U2t*(P2-P1) 
		a =  dot3(l1(:,Y),l2(:,Y));    % a=U1t*U2
		alpha = (a*c2-c1) / (a^2-1);
		beta  = (c2-a*c1) / (a^2-1);
		v1=vector(l1(:,Y),alpha);     % builds vector l1.P->A
		v2=vector(l2(:,Y), beta);     % builds vector l2.P->B
		A=l1(:,X)+v1;                 % point A in the reference frame
		B=l2(:,X)+v2;                 % point B in the reference frame
		A(U)=1; B(U)=1;
       %mindist = dist(A,B);          % minimum distance between l1, l2
        mindist = distp(A,B);          % patch January 2003 for compatibility with the new MATLAB versions
                                              % (avoid name conflicts)

		I=middle(A,B);                % middle point between A and B  
		lmindist(:,X)=I;              % origin of minimum distance line  
		lmindist(:,Y)=u3;             % u3 is the direction of this line  
		lmindist(:,Y)=unitv(lmindist(:,Y));
		pl=plane2(I,u3);              % builds the minimum distance pl.  
		if ( mindist > zero )         % l1 and l2 are oblique lines  
			intype=1;             % intersection is middle point
		else			      % l1 and l2 are incident lines
			mindist=0;
			inttype=0;            % I is the real intersection
		end
else                                          % l1 is parallel to l2
		v1=cross(deltap,l1(:,Y));
		mindist = modulus(v1);	      %  minimum distance between l1, l2
		if ( mindist < zero)          % l1==l2
			inttype = -1;
		else 			      % l1!=l2
			inttype = 2; 	      % no intersection between l1, l2
			v1=cross(deltap,l1(:,Y)); % direction of minimum distance line
			v2=cross(v1,l1(:,Y));
			lmindist(:,Y)=unitv(v2);
			lmindist(:,X)=l1(:,X);
			v1
			pl=plane2(l1(:,X),v1); 	% plane containing l1,l2
		end
end

