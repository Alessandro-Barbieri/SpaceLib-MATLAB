%_______________________________________________________________________________________________
%                                        ELB_D_PA.M
% Program for the DIRECT kinematics of ELBOW robot. Frames assigned according to Denavit and
% Hartenberg conventions. The output of this program is compatible with the input of elb_i_dh.m
% The input  of this program is compatible with the output of elb_i_dh.m
% Input file:  ELBOW.DAT and  JOINT.MOT.                               Output file: GRIPPER.MOT
% (c) G. Legnani, C. Moiola 1998
%_______________________________________________________________________________________________

spheader
MAXLINK=6;
clc
axis=[U Z X X X Z X U];
ii=X;                 % Euler/Cardan convention
jj=Y;                 % for gripper
kk=Z;                 % angular position
a  =zeros([1,MAXLINK+2]);                             % Denavit & Hartemberg's parameters (D&H)
O  =zeros([MAXLINK+2,U]);
                                                    % Matrices initializations and declarations
mabs   =zeros(4,4*(MAXLINK+2));     % array containing abs. pos. mat. of frame (i) in frame (0)
Wabs   =zeros(4,4*(MAXLINK+2));     % array containing abs. vel. mat. of frame (i) in frame (0)
Habs   =zeros(4,4*(MAXLINK+2));     % array containing abs. vel. mat. of frame (i) in frame (0)
mreli_1=zeros(4,4*(MAXLINK+2));   % array containing pos. mat. of frame (i) seen in frame (i-1)
Wreli_1=zeros(4,4*(MAXLINK+2)); % array containing rel.vel.mat.of frame (i) seen in frame (i-1)
Hreli_1=zeros(4,4*(MAXLINK+2)); % array containing rel.acc.mat.of frame (i) seen in frame (i-1)
Wrel0  =zeros(4,4*(MAXLINK+2));   % array containing rel.vel.mat.of frame (i) seen in frame (0)
Hrel0  =zeros(4,4*(MAXLINK+2));   % array containing rel.acc.mat.of frame (i) seen in frame (0)

string1=input('Digit the name of the input DATA FILE: ','s');
data=fopen(string1,'r');
if (data==-1)
      error('Error in ELB_D_DH.M, unable to open DATA FILE ')
end
string2=input('Digit the name of the input MOTION FILE: ','s');
motion=fopen(string2,'r');
if (motion==-1)
      error('Error in ELB_D_DH.M, unable to open the MOTION FILE ')
end
string3=input('Digit the name of the OUTPUT FILE (S=Screen): ','s');
string3=upper(string3);
if (string3=='S')
      out=1;
else
      out=fopen(string3,'wt');
end
if (out==-1)
      error('Error in ELB_D_DH.M, unable to open OUTPUT FILE ')
end

for i=2:1:MAXLINK+1                                          % read link lenghts from data file
      a(i)=fscanf(data,'%f',1);
end
O(1,X)=0.;   O(1,Y)=0.;   O(1,Z)=0.;   O(1,U)=1.;           % rel. origin of frame (i) in (i-1)
O(2,X)=0.;   O(2,Y)=0.;   O(2,Z)=a(2); O(2,U)=1.;
O(3,X)=0.;   O(3,Y)=a(3); O(3,Z)=0.;   O(3,U)=1.;
O(4,X)=0.;   O(4,Y)=a(4); O(4,Z)=0.;   O(4,U)=1.;
O(5,X)=0.;   O(5,Y)=a(5); O(5,Z)=0.;   O(5,U)=1.;
O(6,X)=0.;   O(6,Y)=0.;   O(6,Z)=0.;   O(6,U)=1.;
O(7,X)=a(7); O(7,Y)=0.;   O(7,Z)=0.;   O(7,U)=1.;
Aus=UNIT4;
mabs(:,1:4)=UNIT4;
dt=fscanf(motion,'%f',1);                                     % read time step from motion file
fprintf(out,'\n%f',dt);                                                  % write dt to out file
fprintf(out,'\n%d %d %d\n\n',ii-1,jj-1,kk-1);             % write Cardan convention to out file
time=0;
while ~feof(motion)
      for i=1:1:MAXLINK
            p=4*i-3;
            pp=[p:p+3];
            q=fscanf(motion,'%f',1);                                        % read joint motion
            qp=fscanf(motion,'%f',1);
            [qpp,count]=fscanf(motion,'%f',1);
            if count~=1 break, end
            mreli_1(:,pp)=rotat24(axis(i+1),q,O(i,X:U));      % Builds relative position matrix
                           % Builds relative velocity and acceleration matrix in local frame(4)
            [ Wreli_1(:,pp),Hreli_1(:,pp) ]=vactowh3(Rev,axis(i+1),qp,qpp,O(i,X:U));
            mabs(:,pp+4)=mabs(:,pp)*mreli_1(:,pp);      % Absolute position matrix of frame (i)
            Wrel0(:,pp)=mami(Wreli_1(:,pp),mabs(:,pp));         % W and H matrices in frame (i)
            Hrel0(:,pp)=mami(Hreli_1(:,pp),mabs(:,pp));
            Wabs(:,pp+4)=Wabs(:,pp)+Wrel0(:,pp);           % Evaluates absolute velocity matrix
                                                       % Evaluates absolute acceleration matrix
            Habs(:,pp+4)=coriolis(Habs(:,pp),Hrel0(:,pp),Wabs(:,pp),Wrel0(:,pp));
      end                                                                 % end on MAXLINK loop
    if count~=1 break, end
      mreli_1(:,pp+4)=UNIT4;
      mreli_1(X,p+7)=O(7,X);
      Wreli_1(:,pp+4)=NULL4;
      Hreli_1(:,pp+4)=NULL4;
      mabs(:,pp+8)=mabs(:,pp+4)*mreli_1(:,pp+4);
      Wrel0(:,pp+4)=mami(Wreli_1(:,pp+4),mabs(:,pp+4));         % W and H matrices in frame (i)
      Hrel0(:,pp+4)=mami(Hreli_1(:,pp+4),mabs(:,pp+4));
      Wabs(:,pp+8)=Wabs(:,pp+4)+Wrel0(:,pp+4);            %  Evaluates absolute velocity matrix
                                                       % Evaluates absolute acceleration matrix
      Habs(:,pp+8)=coriolis(Habs(:,pp+4),Hrel0(:,pp+4),Wabs(:,pp+4),Wrel0(:,pp+4));
                               % extracts Cardan angles (and their time derivatives) of gripper
      [q1,q2,qp1,qp2,qpp1,qpp2]=htocarda(mabs(:,pp+8),Wabs(:,pp+8),Habs(:,pp+8),ii,jj,kk);
      Aus(X,U)=mabs(X,p+11);
      Aus(Y,U)=mabs(Y,p+11);
      Aus(Z,U)=mabs(Z,p+11);
      Waus=miam(Wabs(:,pp+4),Aus);                                         % transform velocity
      Haus=miam(Habs(:,pp+4),Aus);                         % and acceleration in ausiliar frame
                               % extracts Cardan angles (and their time derivatives) of gripper
      [q1,q2,qp1,qp2,qpp1,qpp2]=htocarda(mabs(:,pp+8),Waus,Haus,ii,jj,kk);
      fprintf(1,'\nTime=%f\n',time);                  % Print Output Results only on the screen
      printm('The position matrix of the gripper is:',mabs(:,pp+8));
      printm('The velocity matrix of the gripper is:',Waus);
      printm('The acceleration matrix of the gripper is:',Haus);
      fprintf('\nPress any key to continue\n\n');
      pause;
    fprintf(out,'\n');                        % Print Output Results on the screen or in a FILE
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',  q1(X),  q1(Y),  q1(Z));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f', qp1(X), qp1(Y), qp1(Z));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',qpp1(X),qpp1(Y),qpp1(Z));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',mabs(X,p+11),mabs(Y,p+11),mabs(Z,p+11));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',  Waus(X,U),Waus(Y,U),Waus(Z,U));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',Haus(X,U),Haus(Y,U),Haus(Z,U));
    time=time+dt;
end                                                                             % end main loop
fclose('all');
