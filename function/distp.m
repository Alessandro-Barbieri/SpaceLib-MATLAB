
function d=distp(P1,P2)

%distp (Spacelib): Distance between two points.
%
% Function returning the distance between two points.
% Usage:
%
%                       d=distp(P1,P2)     
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
% patched by G. Legnani November 2001
% patched by G. Legnani January 2003
%
% replaces the function dist(P1,P2) of the previous spacelib versions in order
% to avoid conflicts with new system functions contained in the new
% versions of MATLAB.
%___________________________________________________________________________
 
spheader
d=modulus(P1-P2);

