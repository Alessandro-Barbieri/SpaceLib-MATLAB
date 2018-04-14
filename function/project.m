
function [I,d]=project(P,pl)

%PROJECT (Spacelib): Finds the projection I of the point P on the plane pl.
%
% Function that finds the projection I of the point P on the plane pl.
%
% Input parameters:
% 	P :  point that has to be projected on plane
%	pl:  plane that contains the projection point I.
%
% Output parameters:
%	I : projection point of the given point P.
%     dist: the distance between point P and plane pl.
%
% Usage:
%		 [I,dist]=project(P,pl)
%
% patch G.Legnani January 2004
%___________________________________________________________________________
 
spheader

% Homogeneous Coordinates
d=dot(P,pl');
I(1:3)=P(1:3)-d*pl(1:3)';
I(U)=P(U);
I=I';

