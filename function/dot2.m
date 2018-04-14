
function c=dot2(v1,v2)

%DOT2 (Spacelib): evaluates the dot product between two row (or column) vectors. 
%
% Function that evaluates the dot product of two element vectors 
%
% Input parameters:
% v1,v2 : vectors whose dot product must be evaluated
% 
% NOTE: This function can be considered an extension of dot function 
% because it is non limited to the dot product of 3 elements vectors.
% For the a correct result, pl and P must be both ROW or COL vector.
% Usage:
%
%			c=dot2(v1,v2)
%_________________________________________________________________________

c=0;
c=sum(v1.*v2);



