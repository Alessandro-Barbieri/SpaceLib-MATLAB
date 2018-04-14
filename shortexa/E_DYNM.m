clear
spacelib

Wp=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
disp('------------------')
J=[19.,  -2, -2., 20.0;
   -2,    1,  0,   0;
   -2,    0,  1,   0;
   20.0,  0,  0,  20]

fx=0;
fy=8.334;
fz=0;

cx=0.8334;
cy=0;
cz=8.35;

F=[[  0, -cz, cy, fx],
   [ cz,  0, -cx, fy],
   [-cy, cx,  0 , fz],
   [-fx,-fy,-fz, 0]]

var=[[1,1,1,1,1,1],
     [0,0,0,0,0,0]]

[Wp,f2,ex_status]=dyn_eq(J,Wp,F,var)
skew(Wp,J)
pause
disp('------------------')
jxx=1.01;
jyy=1.02;
jzz=1.03;

jxy=0.1;
jxz=0.2;
jyz=0.3;
xg=0.11;
yg=0.22;
zg=0.33;

m=10;

J=jtoj(m,jxx,jyy,jzz,jxy,jyz,jxz,xg,yg,zg)


fx=1;
fy=2;
fz=3;

cx=1.1;
cy=1.2;
cz=1.3;

F=[[  0, -cz, cy, fx],
   [ cz,  0, -cx, fy],
   [-cy, cx,  0 , fz],
   [-fx,-fy,-fz, 0]]

var=[[1,1,1,1,1,1],
     [0,0,0,0,0,0]]

Wp=0;
[Wp,f2,ex_status]=dyn_eq(J,Wp,F,var)
skew(Wp,J)



disp('0====')
var=[[0,0,0,0,0,0],
     [1,1,1,1,1,1]] 

F=0;
[Wp,f2,ex_status]=dyn_eq(J,Wp,F,var)
skew(Wp,J)

disp('1====')
pause
F=f2;
var=[[0,1,0,1,0,1],
     [1,0,1,0,1,0]]

Wp(Z,X)=999; Wp(X,Z)=999;
Wp(X,U)=999;
Wp(Z,U)=999;

F(Y,Z)=999; F(Z,Y)=999;
F(Y,X)=999; F(X,Y)=999;
F(Y,U)=999;

[Wp,f2,ex_status]=dyn_eq(J,Wp,F,var)

skew(Wp,J)

disp('2====')
pause
var=[[1,0,1,1,0,1],
     [0,1,0,0,1,0]]

Wp(Y,Z)=999; Wp(Z,Y)=999;
Wp(Y,X)=999; Wp(X,Y)=999;
Wp(X,U)=999;
Wp(Z,U)=999;

F(X,Z)=999; F(Z,X)=999;
F(Y,U)=999;



[Wp,f2,ex_status]=dyn_eq(J,Wp,f2,var)

skew(Wp,J)

disp('3====')
pause
var=[[0,1,0,0,1,0],
     [1,0,1,1,0,1]]

Wp(X,Z)=999; Wp(Z,X)=999;
Wp(Y,U)=999;

F(Y,Z)=999; F(Z,Y)=999;
F(X,Y)=999; F(Y,X)=999;
F(X,U)=999;
F(Z,U)=999;



[Wp,f2,ex_status]=dyn_eq(J,Wp,f2,var)

skew(Wp,J)

