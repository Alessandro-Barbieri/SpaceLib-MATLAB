%_____________________________________________________________________________________________
%
%                                         ROB_MAT
%
% Program  for  the  automatic  solution of the direct kinematic problem and the inverse
% dynamic problem for any serial manipulator. The  program  reads from a "description file
% (*.DAT)" the structure of the robot (number of links, lenghts, masses, joint type,ecc.),
% and from a " motion file (*.MOT)" the motors movement, and, as output, prints the motion
% (position, velocity, acceleration) of each link.
% (c) G.Legnani 1998 adapted from G.Legnani and R.Faglia 1990
%____________________________________________________________________________________________

clc
string1=input('Digit the name of the input DATA FILE: ','s');
data=fopen(string1,'r');
if (data==-1)
        error('Error in ROB_MAT, unable to open DATA FILE ')
end
string2=input('Digit the name of the input MOTION FILE: ','s');
motion=fopen(string2,'r');
if (motion==-1)
        error('Error in ROB_MAT, unable to open the MOTION FILE ')
end
string3=input('Digit the name of the OUTPUT FILE (S=Screen): ','s');
string3=upper(string3); % uppercase;
if (string3=='S')
        out=1;
else
        out=fopen(string3,'wt');
end
if (out==-1)
        error('Error in ROB_MAT, unable to open OUTPUT FILE ')
end
nlink=fscanf(data,'%d',1);
                        %_____INIZIALIZATIONS
T =eye(4,4*(nlink+1));                                     % MATRICES:
WA=zeros(4,4*(nlink+1));
HA=zeros(4,4*(nlink+1));
J =zeros(4,4*nlink);
W =zeros(4,4*nlink);
WO=zeros(4,4*nlink);
HO=zeros(4,4*nlink);
A =zeros(4,4*nlink);
theta=zeros([1,nlink]);                                    % VECTORS:
jtype=zeros([1,nlink]);
a=zeros([1,nlink]);
b=zeros([1,nlink]);
alfa=zeros([1,nlink]);
for i=1:1:nlink                                         % for each link (STEP 1)
        kk=4*i-3;
        k=[kk:kk+3];
        jtype(i)=fscanf(data,'%d',1);                   % Read Denavit & Hartenberg parameters
        theta(i)=fscanf(data,'%f',1);
        s(i)=    fscanf(data,'%f',1);
        b(i)=    fscanf(data,'%f',1);
        a(i)=    fscanf(data,'%f',1);
        alfa(i)= fscanf(data,'%f',1);
        m=  fscanf(data,'%f',1);                        % Read Dinamic Data
        jxx=fscanf(data,'%f',1);
        jxy=fscanf(data,'%f',1);
        jxz=fscanf(data,'%f',1);
        jyy=fscanf(data,'%f',1);
        jyz=fscanf(data,'%f',1);
        jzz=fscanf(data,'%f',1);
        xg= fscanf(data,'%f',1);
        yg= fscanf(data,'%f',1);
        zg= fscanf(data,'%f',1);
        J(:,k)=jtoj(m,jxx,jyy,jzz,jxy,jyz,jxz,xg,yg,zg);% Builds Inertia Matrix
end                                                     % end 1ST step
gx=fscanf(data,'%f',1);
gy=fscanf(data,'%f',1);
gz=fscanf(data,'%f',1);
fx=fscanf(data,'%f',1);
fy=fscanf(data,'%f',1);
fz=fscanf(data,'%f',1);
cx=fscanf(data,'%f',1);
cy=fscanf(data,'%f',1);
cz=fscanf(data,'%f',1);
Hg=gtom(gx,gy,gz);                                      % Builds gravity matrix
dt=fscanf(motion,'%f',1);
%_______________________FOR EACH INSTANT OF TIME:__________________________
%___________________________DIRECT KINEMATICS______________________________
for time=0:dt:~feof(motion)
        for i=1:1:nlink
                kk=4*i-3;
                k=[kk:kk+3];
                q   = fscanf(motion,'%f',1);
                qp  = fscanf(motion,'%f',1);
                [qpp,count] = fscanf(motion,'%f',1);
                if count~=1
                        fclose('all');
                        return
                end
                                                          % Builds relative position matrix (3)
                A(:,k)=dhtom(jtype(i),theta(i),s(i),b(i),a(i),alfa(i),q);
                           % Builds relative velocity and acceleration matrix in local frame(4)
                [ W(:,k),H(:,k) ]=veactowh(jtype(i),qp,qpp);
                                                       % Evaluates absolute position matrix (5)
                T(:,k+4)=T(:,k)*A(:,k);
                         % Transform relative velocity matrix from local frame to base frame(6)
                WO(:,k)=mami( W(:,k),T(:,k) );
                    % Transform relative acceleration matrix from local frame to base frame (7)
                HO(:,k)=mami( H(:,k),T(:,k) );
                WA(:,k+4)=WA(:,k)+WO(:,k);             % Evaluates absolute velocity matrix (8)
                                                   % Evaluates absolute acceleration matrix (9)
                HA(:,k+4)=coriolis(HA(:,k),HO(:,k),WA(:,k),WO(:,k));
        end                                                         % end of cycle (kinematics)
%___________________SOLUTION OF THE INVERSE DINAMYC PROBLEM______________
        EXT=actom(fx,fy,fz,cx,cy,cz);
        ACTO(:,4*nlink+1:4*nlink+4)=mamt(EXT,T(:,4*nlink+1:4*nlink+4));
        for kk=4*nlink:-4:4
                k=[kk-3:kk];
                JO(:,k)=mamt(J(:,k),T(:,k+4));
                Ht=Hg-HA(:,k+4);
                FI(:,k)=skew(Ht,JO(:,k));
                ACTO(:,k)=FI(:,k)+ACTO(:,k+4);
        end
%________________________OUTPUT RESULTS ______________________
        if (string3=='S') string3=' SCREEN '; end
        fprintf(1,'\n\n-------- Print Output results on FILE: %s ----------\n',string3 )
        for i=1:1:nlink
                kk=4*i-3;
                k=[kk:kk+3];
                fprintf(out,'\n\n Link %d \n\n',i);
                fprintm(out,'Relative Position Matrix                   A',   A(:,k));
                fprintm(out,'Absolute Position Matrix                   T',   T(:,k+4));
                fprintm(out,'Relative Velocity Matrix in frame (i)      W',   W(:,k));
                fprintm(out,'Relative Velocity Matrix in frame (0)     WO',  WO(:,k));
                fprintm(out,'Absolute Velocity Matrix in frame (0)     WA',  WA(:,k+4));
                fprintm(out,'Relative Acceleration Matrix in frame (i)  H',   H(:,k));
                fprintm(out,'Relative Acceleration Matrix in frame  (0)HO',  HO(:,k));
                fprintm(out,'Absolute Acceleration Matrix in frame  (0) A',  HA(:,k+4));
                fprintm(out,'Inertia Matrix in frame (i)                J',   J(:,k));
                fprintm(out,'Inertia Matrix in frame (0)                O',  JO(:,k));
                fprintm(out,'Total actions                             FI',  FI(:,k));
                fprintm(out,'Actions on Joint (i)                    ACTO',ACTO(:,k));
        end                                                               % end output results
end                                                                       % end main loop
fclose('all');                                                            % close all files
