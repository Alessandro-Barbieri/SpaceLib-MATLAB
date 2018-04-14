
function [I,d]=projponl(l,P1) 

%PROJPONL (Spacelib): finds the projection I of the point P on the line l.
%
%
% Input parameters
%     P1  : point that has to be projected on line
%     l   : line that contains the projection point I
%
% Output parameters
%     I   : projection point of the given point P1
%     d   : the distance between point P1 and line l
%
% Usage:
%
%			[I,dist]=projponl(l,P1)
%
% patched on january 2003 by g.Legnani
%           (call to function 'dist' replaced to 'distp
%            for compatibility with new matlab releases)
%___________________________________________________________________________

spheader

pl=plane2(P1,l(:,Y)); 		% builds plane pl 

[I,d]=project(l(:,X),pl);    % finds I
d=distp(P1,I);  % patch january 2003 for compatibility with the new matlab versions
                % (avoid name conflicts)

