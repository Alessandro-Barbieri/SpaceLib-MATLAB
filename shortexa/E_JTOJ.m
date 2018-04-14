mass=15.71;
jxx=36.633; jyy=36.633; jzz=7.85;
jxy=0;      jyz=0;      jxz=0;
xg=0;       yg=0;       zg=0;
J=jtoj(mass,jxx,jyy,jzz,jyz,jyz,jxy,xg,yg,zg);
printm('The mass matrix is ',J);

mass=15.71;
jxx=36.633; jyy=36.633; jzz=7.85;
jxy=0;      jyz=0;      jxz=0;
xg=0;       yg=3;       zg=4;
J=jtoj(mass,jxx,jyy,jzz,jyz,jyz,jxy,xg,yg,zg);
printm('The mass matrix is ',J);
