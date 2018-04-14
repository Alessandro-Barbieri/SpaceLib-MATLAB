%_____________________________________________________________________________________________
%
%                                       PROGRAM TEST_NEW.M
%
% " Program for the trajectory prediction of a two-link system floating in the space".
%
% This program demonstrates the use of dyn_eq function for the solution of the direct dynamic
% problem of a two-link system floating in the 3-D space. The program predicts the trajectory
% of the system. This is an improved version of Test.m. The angular moment of the system should
% be constant, but inaccuracy in the integration method corrupt it. In this version, some
% statements have been added to preserve the total angular momentum obtaining an improved final
% accuracy. At each integration step the angular momentum is evaluated and a velocity dW is
% added to the system in order to set the value of the angular momentum equal to its initial
% value (G=Go for t==0.) The program reads from a file (TEST.DAT) the links description (mass,
% inertias, the coordinates of the centre of mass) and from another file (TEST.MOT) the motion
% of the motors, and prints on the screen the trajectory of the two links.
%
% © G.Legnani and C.Moiola 1998 adapted from G.Legnani and R.Faglia 1990
%_____________________________________________________________________________________________

spheader
clc
                                                    % Initializations
Zax=Zaxis;
O=ORIGIN;
var=[1 1 1 1 1 1 ;
     0 0 0 0 0 0];
Wp=NULL4;
W0=NULL4;
                                                    % Open description file
fil=fopen([spc_lib_dir_b,filesep,'TEST.DAT'],'r');
if (fil==-1)
        error('Error on input file TEST.DAT ')
end
out=input('output to screen? (1=yes)');
if (out~=1)
   outfile=[spc_lib_dir_b,filesep,'TESTOUT.OUT'];
   out=fopen(outfile,'wt');
end;
if (out==-1)
        error('Error in TEST.M: Unable to open output file ')
end
                                                    % Read description of the links step(1)
m=  fscanf(fil,'%f',1);
jxx=fscanf(fil,'%f',1); jyy=fscanf(fil,'%f',1); jzz=fscanf(fil,'%f',1);
jxy=fscanf(fil,'%f',1); jyz=fscanf(fil,'%f',1); jxz=fscanf(fil,'%f',1);
xg= fscanf(fil,'%f',1); yg= fscanf(fil,'%f',1); zg= fscanf(fil,'%f',1);
                                                    % Builds Inertia Matrix of link 1
J1=jtoj(m,jxx,jyy,jzz,jxy,jyz,jxz,xg,yg,zg);
m=  fscanf(fil,'%f',1);
jxx=fscanf(fil,'%f',1); jyy=fscanf(fil,'%f',1); jzz=fscanf(fil,'%f',1);
jxy=fscanf(fil,'%f',1); jyz=fscanf(fil,'%f',1); jxz=fscanf(fil,'%f',1);
xg= fscanf(fil,'%f',1); yg= fscanf(fil,'%f',1); zg= fscanf(fil,'%f',1);
                                                    % Builds Inertia Matrix of link 2
J2=jtoj(m,jxx,jyy,jzz,jxy,jyz,jxz,xg,yg,zg);
                                                    % Read initial condition of the system
W1= fscanf(fil,'%f',[4 4]);                         % Read velocity matrix of link 1
W1=W1';
m1= fscanf(fil,'%f',[4 4]);                         % Read position matrix of link 1
m1=m1';
                                                    % Open motion file
fil=fopen([spc_lib_dir_b,filesep,'TEST.MOT'],'r');
if (fil==-1)
        error('Error on motion file TEST.MOT ')
end
dt=fscanf(fil,'%f',1);                              % Read integration step "dt"
for t=0:dt:(~feof(fil))                             % Loop for each instant of time step(2)
        q  =fscanf(fil,'%f',1);                     % Read motion of motor (a)
        qp =fscanf(fil,'%f',1);
        [qpp,count]=fscanf(fil,'%f',1);
                            % Check end of motion file. If motion file is empty -> end of loop
        if (count~=1)
                return
        end
        m12=screwtom(Zax,q,O,0);                    % Relative position of link 1 & 2 (b)
        m2=m1*m12;                                  % Absolute position of link 2     (c)
                                                    % step (d) moved forward
        [W12,H12]= vactowh2(Rev,Z,qp,qpp);          % Relative velocity & acceleration of link 1&2 (e)
        W12O=mami(W12,m1);                          % (f)
        H12O=mami(H12,m1);
        W12O(1:3,1:3)=normskew(W12O(1:3,1:3),SKEW_);% normalization reducing numerical error
        W2=W1+W12O;                                 % Absolute velocity  of link 2 (g1)
                                            % evaluation of partial acceleration moved forward
        J1O=mamt(J1,m1);                            % Refer inertia moments to absolute frame
        J2O=mamt(J2,m2);
        J1O=normskew(J1O,SYMM_);                    % normalization reducing numerical error
        J2O=normskew(J2O,SYMM_);                    % normalization reducing numerical error
        Jtot=J1O+J2O;                               % Total inertia (i)
%---- preserve total angular momentum
                G1=skew(W1,J1);
                G2=skew(W2,J2);
                G=G1+G2;
                if (t==0) Go=G; end;
                [dW,G,exitcode]=dyn_eq(Jtot,W0,G-Go,var);
                W1=W1-dW;                           % correct velocity
                W2=W2-dW;
%----
                H1=W1^2;                            % Partial acceleration of link 1 (d)
        H2=coriolis(H1,H12O,W1,W12O);               % Partial acceleration of link 2 (g2)
        F1=skew(H1,J1O);                            % Evaluate inertia actions (j)
        F2=skew(H2,J2O);
        F=F1+F2;
        [Wp,ff,exitcode]=dyn_eq(Jtot,Wp,F,var);     % Evaluate Wp (k)
        if (exitcode==NOTOK)
                fprintf('\n\n exitcode= %d \n\n',exitcode);
                return;
        end
        H1=H1-Wp;
        H2=H2-Wp;                                   % Absolute acceleration of link 1 & 2 (l)
% ------------  Print  output  results ----------
        fprintf(out,'\n\n---  time:%4.3f    q: %9.6E   qp: %6.5E  qpp: %6.4f\n\n',t,q,qp,qpp);
        fprintm(out,' Position matrix of link 1',           m1);
        fprintm(out,' Absolute position matrix of link 2',  m2);
        fprintm(out,' Velocity matrix of link 1',           W1);
        fprintm(out,' Absolute velocity matrix of link 2',  W2);
        fprintm(out,' Acceleration matrix of link 1',       H1);
        fprintm(out,' Absolute acceleration matrix of link 2',H2);
        if (out==1)
          pause;
        else
          fprintf(1,'\n---  time:%4.3f   q: %9.6E  qp: %6.5E  qpp: %6.4f\n',t,q,qp,qpp);
        end
                                             % Builds matrix dm = [1] + Wdt + 1/2 H dt^2  (m)
        dm=UNIT4 + W1*dt + 0.5 * H1*dt^2;
        dm=normal(dm);
        m1=dm*m1;                                  % New position of link 1 (n)
        W1 =W1+Wp*dt;                              % New velocity of link 1 (o)
end                                                % end of main loop
fclose('all')
