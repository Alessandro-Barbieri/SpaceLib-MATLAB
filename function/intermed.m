
function P3=intermediate(P1,a,P2,b)

%INTERMEDIATE (Spacelib): Evaluates  the  middle point between two points with weights
% 
% 
% Input parameters
%	P1 = first point
%	P2 = second point
%	a  = weight relative at the first point
%	b  = weight relative at the second point
%
% Output parameters:
%	P3 = middle point
%
% NOTE: We have P3= (P1*a+P2*b) / ( a+b )
%       If a=b=1 P3 is exactly the middle point between P1 and P2.
%
% Related functions: MIDDLE
%
% (c) G.Legnani, C. Moiola 1998; adapted from: D.Amadori - G.Pugliese - Ghislotti
% bug fixed by g.legnani october 2003
% bug fixed by d.manara january 2005
%___________________________________________________________________________


% by g.legnani october 2003
% by d.manara january 2005
c=a+b;
if (c=0)
   fprintf(1,'intermediate: wrong weights');
   c=1;
end
P3=(a*P1+b*P2)/c;

% Homogeneus coordinates
P3(U)=1;

