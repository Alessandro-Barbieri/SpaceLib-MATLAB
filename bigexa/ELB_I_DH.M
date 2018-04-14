%_______________________________________________________________________________________________
%               ELB_I_DH.m program for the INVERSE kinematics of ELBOW robot.
%
% Frames assigned according to Denavit and Hartenberg conventions. The output of this program
% is compatible with the input  of elb_d_dh.m The input  of this program is compatible with the
% output of elb_d_dh.m
%   Input file:   ELBOW.DAT GRIPPER.MOT GUESS.1ST                       Output file:  JOINT.MOT
% (c) G. Legnani, C. Moiola 1998
%_______________________________________________________________________________________________

clear
spheader
MAXLINK=6;
theta= zeros(1,MAXLINK+1);                                  % Denavit & Hartemberg's parameters
d    = zeros(1,MAXLINK+1);
b    = zeros(1,MAXLINK+1);
fi   = [0 PIG_2 0 0 3*PIG_2 PIG_2 0];
a    = zeros(1,MAXLINK+1);
q    = zeros(1,MAXLINK);                                    % joint angles
qp   = zeros(1,MAXLINK);                                    % array of joint vel. variables
qpp  = zeros(1,MAXLINK);                                    % array of jint acc. variables
%ds   = zeros(1,MAXLINK);                                   % sol. of the eq. J*dq=ds
dq   = zeros(1,MAXLINK);                                    % sol. of Newton/Raphson alg. step
buf  = zeros(1,MAXLINK);
toll=0.0005;                                                % precision of the solution
maxiter=15;                                                 % max. num. of iter. in N-R alg.
orig=ORIGIN;
mrelp_1=zeros(4,4*(MAXLINK+1));    % array containing pos. mat. of frame(p) seen in frame (p-1)
Wrelp_1=zeros(4,4*(MAXLINK+1));  %array containing rel.vel.mat.of frame (p) seen in frame (p-1)
Hrelp_1=zeros(4,4*(MAXLINK+1));  %array containing rel.acc.mat.of frame (p) seen in frame (p-1)
mabs=zeros(4,4*(MAXLINK+1));       % array containing abs. pos. mat. of frame (p) in base frame
Wabs=zeros(4,4*(MAXLINK+1));       % array containing abs. vel. mat. of frame (i) in base frame
Habs=zeros(4,4*(MAXLINK+1));       % array containing abs. acc. mat. of frame (i) in base frame
mabsinv=NULL4;    % invers position matrix of the frame positioned in the center of the gripper
Lrelp=NULL4;                       % L relative matrix of p-th joint seen in frame (p-1)
Lrel0=NULL4;                       % L relative matrix of p-th joint seen in base frame
Wrel0=zeros(4,4*(MAXLINK+1));    % array containing rel.vel.mat.of frame (p) seen in base frame
Hrel0=zeros(4,4*(MAXLINK+1));    % array containing rel.acc.mat.of frame (p) seen in base frame
Wtar=NULL4;                        % target velocity matrix
Htar=NULL4;                        % target acceleration matrix
dH=NULL4;                          % Htar - H~    H~ is the acceleration evaluated with qpp=0
Aus =UNIT4;
Waus=NULL4;
Haus=NULL4;
Wabs(:,1:4)=NULL4;
Habs(:,1:4)=NULL4;
gripper=zeros(4,4);
Last =[ 0 1 0 0 ;                  % transformation matrix from
        0 0 1 0 ;                  % frame (6) to gripper
        1 0 0 0 ;                  % element Z-U is in a(6)
        0 0 0 1 ];
first=ORIGIN;                      % origin of frame 0 with respect to base, Z value is in a(1)

string1=input('Digit the name of the input DATA FILE: ','s');
data=fopen(string1,'r');
if (data==-1)
      error('Error in ELB_I_DH.M, unable to open DATA FILE ')
end
string2=input('Digit the name of the input MOTION FILE: ','s');
motion=fopen(string2,'r');
if (motion==-1)
      error('Error in ELB_I_DH.M, unable to open the MOTION FILE ')
end
string3=input('Digit the name of the GUESS  FILE ','s');
guess=fopen(string3,'r');
if (guess==-1)
      error('Error in ELB_I_DH.M, unable to open 1ST_GUESS FILE ')
end
string4=input('Digit the name of the OUTPUT  FILE (S=Screen): ','s');
string4=upper(string4);
if (string4=='S')
      out=1;
else
      out=fopen(string4,'wt');
end
if (out==-1)
      error('Error in ELB_I_DH.M, unable to open OUTPUT FILE ')
end

for p=2:1:MAXLINK+1
            a(p)=fscanf(data,'%f',1);       % read robot description
end
for p=1:1:MAXLINK
            q(p)=fscanf(guess,'%f',1);      % 1st guess for q
end

Jac=zeros(MAXLINK,MAXLINK);                 % Matrices initialization
first(Z)=a(2);
mtar=NULL4;
dH=NULL4;
mabs(:,1:4)=rotat24(Z,PIG_2,first);         % pos. mat. of frame 0 from base frame
Last(Z,U)=a(7);                             % gripper position in frame 6
a(2)=0;                                     % D&H parameter 'a' of link 1 and link 6 are zero
a(7)=0;
dt=fscanf(motion,'%f',1);                   % read time step
ii=fscanf(motion,'%d',1)+1;                 % read Cardan convention
jj=fscanf(motion,'%d',1)+1;
kk=fscanf(motion,'%d',1)+1;
fprintf(out,'\n %f \n',dt);
t=0;
while       ~feof(motion)                   % main loop
      [q1(1),count]=fscanf(motion,'%f',1);  % read joint motion
      if count~=1 break, end
      q1(2)  = fscanf(motion,'%f',1);
      q1(3)  = fscanf(motion,'%f',1);
      qp1(1) = fscanf(motion,'%f',1);
      qp1(2) = fscanf(motion,'%f',1);
      qp1(3) = fscanf(motion,'%f',1);
      qpp1(1)= fscanf(motion,'%f',1);
      qpp1(2)= fscanf(motion,'%f',1);
      qpp1(3)= fscanf(motion,'%f',1);
      O(X)   = fscanf(motion,'%f',1);
      O(Y)   = fscanf(motion,'%f',1);
      O(Z)   = fscanf(motion,'%f',1);
      O(U)=1;
      vel(1) = fscanf(motion,'%f',1);
      vel(2) = fscanf(motion,'%f',1);
      vel(3) = fscanf(motion,'%f',1);
      acc(1) = fscanf(motion,'%f',1);
      acc(2) = fscanf(motion,'%f',1);
     [acc(3),count]=fscanf(motion,'%f',1);
      if (count~=1)
            break;
      end
      mtar=cardatom(q1,ii,jj,kk,O);                             % builds target position matrix
      mtar= vmcopy(O,3,4,Col,mtar,4,4);
      for k=1:1:maxiter
            for i=1:1:MAXLINK
                  p=4*i-3;
                  pp=[p:p+3];
                                                                      % builds rel. pos. matrix
                  mrelp_1(:,pp)=dhtom(Rev,theta(i),d(i),b(i),a(i+1),fi(i+1),q(i));
                  mabs(:,pp+4)=mabs(:,pp)*mrelp_1(:,pp);              % builds abs. pos. matrix
                  Lrelp=makel2(Rev,Z,0.,orig);             % builds rel. L matrix in base frame
                  Lrel0=mami(Lrelp,mabs(:,pp));              % builds rel L matrix in frame (p)
                  buf(1)=Lrel0(X,U);
                  buf(2)=Lrel0(Y,U);
                  buf(3)=Lrel0(Z,U);
                  buf(4)=Lrel0(Z,Y);
                  buf(5)=Lrel0(X,Z);
                  buf(6)=Lrel0(Y,X);
                  Jac=vmcopy(buf,6,i,Col,Jac,MAXLINK,MAXLINK);
            end                                                            % fine ciclo MAXLINK
            gripper=molt(mabs(:,pp+4),Last);
            dm=(mtar-gripper);
            n=norm(dm);
            if (n>toll)                                    % tests if solution has been reached
                  mabsinv=invers(gripper);
                  dS=dm*mabsinv;
                  ds(1)=dS(X,U);
                  ds(2)=dS(Y,U);
                  ds(3)=dS(Z,U);
                  ds(4)=dS(Z,Y);
                  ds(5)=dS(X,Z);
                  ds(6)=dS(Y,X);
                  [dq,rankm]=solve_l(Jac,ds');
                  if(rankm~=MAXLINK)                       % builds the joint var. at next step
                        fprintf(1,'\n*** rank is %d: singular position!',rankm);
                  end
                  q=q+dq';
            else
                  break;
            end                                            % end if
      end                                                  % fine del ciclo maxiter
      if (k<maxiter)
            Aus(X,U)=gripper(X,U);
            Aus(Y,U)=gripper(Y,U);
            Aus(Z,U)=gripper(Z,U);
            Waus=cardatow(q1,qp1,ii,jj,kk,O);              % builds target velocity matrix
            Waus=vmcopy(vel,3,4,Col,Waus,4,4);
            Wtar=mami(Waus,Aus);         % transform velocity from ausiliar frame to base frame
            Haus=cardatoh(q1,qp1,qpp1,ii,jj,kk,O);         % builds target acceleration matrix
            Haus=vmcopy(acc,3,4,Col,Haus,4,4);
            Htar=mami(Haus,Aus);           % transform accel. from ausiliar frame to base frame
            buf(1)=Wtar(X,U);                              % builds joint velocity array
            buf(2)=Wtar(Y,U);
            buf(3)=Wtar(Z,U);
            buf(4)=Wtar(Z,Y);
            buf(5)=Wtar(X,Z);
            buf(6)=Wtar(Y,X);
            [qp,rankm]=solve_l(Jac,buf');
            if(rankm~=MAXLINK)
                  fprintf(1,'\n*** rank is %d: singular position!\n',rankm);
            end
            for i=1:1:MAXLINK                              % acceleration
               p=4*i-3;
               pp=[p:p+3];
               [Wrelp_1(:,pp),Hrelp_1(:,pp)]=veactowh(Rev,qp(i),0.);
               Wrel0(:,pp)=mami(Wrelp_1(:,pp),mabs(:,pp)); % W and H matrices in frame 0
               Hrel0(:,pp)=mami(Hrelp_1(:,pp),mabs(:,pp));
               Wabs(:,pp+4)=Wabs(:,pp)+Wrel0(:,pp);        % abs. vel. and acc. matrices
               Habs(:,pp+4)=coriolis(Habs(:,pp),Hrel0(:,pp),Wabs(:,pp),Wrel0(:,pp));
       end                                                 % end ciclo for sui MAXLINK
       dH=Htar-Habs(:,pp+4);
       buf(1)=dH(X,U);                                     % builds joint acceleration array
       buf(2)=dH(Y,U);
       buf(3)=dH(Z,U);
       buf(4)=dH(Z,Y);
       buf(5)=dH(X,Z);
       buf(6)=dH(Y,X);
       [qpp,rankm]=solve_l(Jac,buf');
       if(rankm~=MAXLINK) fprintf('\n*** rank is %d: singular position!\n',rankm), end

       else
            fprintf('\nNewton-Raphson method does not converge\n');
            return;
       end                                                 % close  k<maxiter loop
       fprintf('\n Time=%f\n',t);                          % Print output results
         printm('The joint angles q are',      q);
         printm('The joint velocity qp are',      qp');
         printm('The joint acceleration qpp are',qpp');
       fprintf('\n\nPress any key to continue\n\n');
       pause;
       for p=1:1:MAXLINK
            fprintf(out,'\n%15.5f      %15.5f      %15.5f',q(p),qp(p),qpp(p));
       end
       fprintf(out,'\n');
    t=t+dt;
end                                                        % end main loop
fclose('all');
