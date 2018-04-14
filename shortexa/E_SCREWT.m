
% Sample program: e_screwt.m

spheader

fi=PIG_2;
u=Zaxis_n;
P=[1 -1 0 1]';
h=0;
Q=screwtom(u,fi,P,h);

printm('The rotatraslation matrix Q obtained with function SCREWTOM is:',Q)

