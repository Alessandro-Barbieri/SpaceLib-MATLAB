
function dist=distpp(pl,P) 

%DISTPP (Spacelib): Evaluates the distance (with a sign) of point P from plane pl.
%
% Function that evaluates the distance (with a sign) of point P from plane pl
%
% Input parameters
%     pl : plane whose distance from P must be evaluated
%     P  : point whose distance from pl must be evaluated
%
% Output parameters:
%   dist : the distance between point P and plane pl
%
% Usage: 
%
%			dist=distpp(pl,P)
%___________________________________________________________________________

dist=dot2(pl,P);
