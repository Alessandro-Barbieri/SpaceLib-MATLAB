
function M=frame4P(P1,P2,P3,a1,a2)

%FRAME4P (Spacelib): Frames from three points.
%
% Builds  a  4*4 position  matrix  m describing  the  position and orientation
% of a frame attached from three points.
% The origin  is in P1, axis a1 points from P1 toward point P2, axis a2 from 
% P1 toward point P3 (if possible). Axis a1 has priority on a2.
% Axis a1 is directed as (P2-P1).
% Axis a3 is directed as (P2-P1) x (P3-P1).
% Axis a2 is directed as Axis a3 x Axis a1.
% The axes a1 and a2 must   be   either  the constants X, Y or Z, defined in  
% spacelib.m. 
% a1 must be different from a2. 
% Usage:
%
%			M=frame4P(P1,P2,P3,a1,a2)
%
% Related functions: FRAMEP
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

M=framep(P1(1:3),P2(1:3),P3(1:3),a1,a2);

P1(U)=1; % Homogeneus coordinates

M(1:4,U)=P1(1:4);

