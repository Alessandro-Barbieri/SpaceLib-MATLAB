
function Hg=gtom(gx,gy,gz)

%GTOM (Spacelib): Builds the gravity acceleration matrix Hg.
%
% Builds the gravity matrix  Hg  starting from the components gx,gy,gz of the  
% gravity  acceleration.  Usually  the z axis is vertical and points upwards 
% and so the acceleration  vector components  are gx=0, gy=0; gz=-9.81 m/s^2 
% Usage: 
%
% 			Hg=gtom(gx,gy,gz)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________


spheader

Hg=NULL4;

Hg(X,U)=gx;
Hg(Y,U)=gy;
Hg(Z,U)=gz;



