
% Sample program e_framev.m

spheader

v1=[0 2 1];
v2=[0 1 2];
r01=framev(v1,v2,X,Y);

printm('The rotation matrix is :',r01)