
% Sample  program: e_gtom.m

gx=0;
gy=0;
gz=-9.81;
Hg=gtom(gx,gy,gz);
printm('The gravity matrix Hg obtained with function GTOM is :',Hg)

