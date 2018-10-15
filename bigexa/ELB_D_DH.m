%______________________________________________________________________________________________
%
%                                                 ELB_D_DH.M
% Program for the DIRECT kinematics of ELBOW robot. Frames assigned according to Denavit and
% Hartenberg conventions. The output of this program is compatible with the input of elb_i_dh.c
% The input  of this program is compatible with the output of elb_i_dh.c
% Input file:  ELBOW.DAT and  JOINT.MOT.
% Output file: GRIPPER.MOT
%                                                                © G. Legnani, C. Moiola 1998
%______________________________________________________________________________________________

spheader
MAXLINK=6;
clc

ii=X;                 % Euler/Cardan convention
jj=Y;                 % for gripper
kk=Z;                 % angular position
theta=zeros([1,MAXLINK+1]);                           % Denavit & Hartenberg's parameters (D&H)
d    =zeros([1,MAXLINK+1]);
a    =zeros([1,MAXLINK+1]);
b    =zeros([1,MAXLINK+1]);
phi   =[0 PIG_2 0 0 3*PIG_2 PIG_2 0];
                                                   % Matrices initializations and declarations
mabs   =zeros(4,4*(MAXLINK+1)); % array containing absolute position matrix of frame (i) in frame (0)
Wabs   =zeros(4,4*(MAXLINK+1)); % array containing absolute velocity matrix of frame (i) in frame (0)
Habs   =zeros(4,4*(MAXLINK+1)); % array containing absolute velocity matrix of frame (i) in frame (0)
mreli_1=zeros(4,4*(MAXLINK+1)); % array containing position matrix of frame (i) seen in frame (i-1)
Wreli_1=zeros(4,4*(MAXLINK+1)); % array containing rel velocity matrix of frame (i) seen in frame (i-1)
Hreli_1=zeros(4,4*(MAXLINK+1)); % array containing relative acceleration matrix of frame (i) seen in frame (i-1)
Wrel0  =zeros(4,4*(MAXLINK+1)); % array containing rel velocity matrix of frame (i) seen in frame (0)
Hrel0  =zeros(4,4*(MAXLINK+1)); % array containing relative acceleration matrix of frame (i) seen in frame (0)
Last =[0 1 0 0;       % transformation matrix from frame (6) to gripper  element Z-U is in a[7]
       0 0 1 0;
       1 0 0 0;
       0 0 0 1 ];
first=ORIGIN;                    % origin of frame 0 with respect to base,Z value is in a[1]
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
a(1)=0;
for i=2:1:MAXLINK+1                           %MAXLINK+1    % read link lengths from data file
      a(i)=fscanf(data,'%f',1);
end
first(Z)=a(2);
mabs(:,1:4)=rotat24(Z,PIG_2,first);           % position matrix of frame 0 from base frame */
Last(Z,U)=a(7);                               % gripper position in frame 6
Aux=UNIT4;
a(2)=0;                                       % D&H parameter 'a' of link 1 and link 6 are zero
a(7)=0;
dt=fscanf(motion,'%f',1);                     % read time step from motion file
fprintf(out,'\n%f',dt);                       % write dt to out file
fprintf(out,'\n%d %d %d\n\n',ii-1,jj-1,kk-1); % write Cardan convention to out file
time=0;
while ~feof(motion)
      for i=1:1:MAXLINK
            p=4*i-3;
            pp=[p:p+3];
             q=         fscanf(motion,'%f',1);                              % read joint motion
             qp=        fscanf(motion,'%f',1);
            [qpp,count]=fscanf(motion,'%f',1);
            if count~=1 break, end
                                                              % Builds relative position matrix
            mreli_1(:,pp)=dhtom(Rev,theta(i),d(i),b(i),a(i+1),phi(i+1),q);
                           % Builds relative velocity and acceleration matrix in local frame(4)
            [ Wreli_1(:,pp),Hreli_1(:,pp) ]=veactowh(Rev,qp,qpp);
            mabs(:,pp+4)=mabs(:,pp)*mreli_1(:,pp);      % Absolute position matrix of frame (i)
            Wrel0(:,pp)=mami(Wreli_1(:,pp),mabs(:,pp));         % W and H matrices in frame (i)
            Hrel0(:,pp)=mami(Hreli_1(:,pp),mabs(:,pp));
            Wabs(:,pp+4)=Wabs(:,pp)+Wrel0(:,pp);           % Evaluates absolute velocity matrix
                                                       % Evaluates absolute acceleration matrix
            Habs(:,pp+4)=coriolis(Habs(:,pp),Hrel0(:,pp),Wabs(:,pp),Wrel0(:,pp));
      end                                                                 % end on MAXLINK loop
    if count~=1 break, end
      gripper=mabs(:,pp+4)*Last;                               % gripper position mabs(:,pp+4)
      Aux(X,U)=gripper(X,U);
      Aux(Y,U)=gripper(Y,U);
      Aux(Z,U)=gripper(Z,U);
      Waux=NULL4; Haux=NULL4;
      Waux=miam(Wabs(:,pp+4),Aux);                                         % transform velocity
      Haux=miam(Habs(:,pp+4),Aux);                      % and acceleration in auxiliary frame
                               % extracts Cardan angles (and their time derivatives) of gripper
      [q1,q2,qp1,qp2,qpp1,qpp2]=htocarda(gripper,Waux,Haux,ii,jj,kk);
      fprintf(1,'\nTime=%f\n',time);                  % Print Output Results only on the screen
      printm('The position matrix of the gripper is:',gripper);
      printm('The velocity matrix of the gripper is:',Waux);
      printm('The acceleration matrix of the gripper is:',Haux);
      fprintf('\n\nPress any key to continue\n\n');
      pause;
      fprintf(out,'\n');                      % Print Output Results on the screen or in a FILE
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',  q1(X),  q1(Y),  q1(Z));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f', qp1(X), qp1(Y), qp1(Z));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',qpp1(X),qpp1(Y),qpp1(Z));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',gripper(X,U),gripper(Y,U),gripper(Z,U));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',Waux(X,U),Waux(Y,U),Waux(Z,U));
      fprintf(out,'\n%7.6f      %7.6f      %7.6f',Haux(X,U),Haux(Y,U),Haux(Z,U));
    time=time+dt;
end                                                                            % end main loop
fclose('all');
