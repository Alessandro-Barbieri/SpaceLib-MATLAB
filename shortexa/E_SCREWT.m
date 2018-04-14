
% Sample program: e_screwt.m

spheader

phi=PIG_2;
u=Zaxis_n;
P=[1 -1 0 1]';
h=0;
Q=screwtom(u,phi,P,h);

printm('The rotatranslation matrix Q obtained with function SCREWTOM is:',Q)

