
function J = jtoj (m,jxx,jyy,jzz,jxy,jyz,jxz,xg,yg,zg)

%JTOJ (Spacelib): Builds  the  inertia  matrix  J  of a body.
%
% Inertia moments and mass to inertia matrix. 
% Builds  the  inertia  matrix  J  of a body from  the values  of  his  mass
% m, its baricentral moment of inertia jxx, jyy, jzz, jxy, jyz, jxz, and the 
% position of  its  center of mass, xg, yg, zg. The  baricentral  frame must
% be parallel to the reference frame.
% The  elements  of the  J  matrix are  not  the  usual  baricentral moments
% (see the SPACELIB Manual for other informations)
% Usage:
%
% 		J=jtoj(m,jxx,jyy,jzz,jxy,jyz,jxz,xg,yg,zg)
%
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
% patched by g.legnani (2003)
%___________________________________________________________________________

 
spheader

J=NULL4;

J(X,X)= (jzz+jyy-jxx)/2;
J(Y,Y)= (jxx-jyy+jzz)/2;
J(Z,Z)= (jxx+jyy-jzz)/2;

for i=1:1:U
        if J(i,i) < -1e-10
           beep
          fprintf(1,'**** Error in JTOJ : Illegal value of the inertia moments **** element (%d,%d) is negative: %f',i,i,J(i,i))
          fprintf('\n hit any key \n');
          pause
	end
        if J(i,i) < 0
           J(i,i)=0;
        end
end

J(X,X)= J(X,X) + m*xg^2;
J(Y,Y)= J(Y,Y) + m*yg^2;
J(Z,Z)= J(Z,Z) + m*zg^2;

J(Y,X)= -jxy + m*xg*yg;
J(X,Y)=J(Y,X);

J(X,Z)= -jxz + m*xg*zg;
J(Z,X)=J(X,Z);

J(Y,Z)= -jyz + m*yg*zg;
J(Z,Y)=J(Y,Z);

J(U,U)=m;

J(X,U)= m*xg;
J(U,X)=J(X,U);

J(Y,U)= m*yg;
J(U,Y)=J(Y,U);

J(Z,U)= m*zg;
J(U,Z)=J(Z,U);

