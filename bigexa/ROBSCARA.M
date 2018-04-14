
%---------------------------------------------------------------------------------------------
% ROBSCARA.M:  Sample program for direct kinematics of Scara robot
%             (See User's Manual)
%
%              University of Brescia
%              Mechanical Eng. Department
%              Via Branze 38
%              25123 BRESCIA - ITALY
%
%              giovanni.legnani@unibs.it
%---------------------------------------------------------------------------------------------

spheader
clc

q = [pi/4  pi/6  0.5];               % joint variables array
qp= [pi*5/4 pi*5/4 -0.5];            % joint var. first time derivative
O=ORIGIN;
O1=[0   0   1.5   1]';               % origin of frame 1 in frame 0
O2=[0.33 0.  0  1]';                 % origin of frame 2 in frame 1
O3=[0.33 0.  0  1]';                 % origin of frame 3 in frame 2
O4=[0    0 -0.5 1]';                 % origin of frame 4 in frame 3
Oa=[0. 0  1.5 1]';                   % origin of frame a in frame 0

m01=rotat34(Z,0,O1);                 % builds relative position matrices
m12=rotat34(Z,q(1),O2);
m23=rotat34(Z,q(2),O3);
m34=rotat34(Z,0,O4);

m02=m01*m12;                         % builds absolute position matrices
m03=m02*m23;
m04=m03*m34;

m0a=idmat(4);                        % builds position matrix of frame
Oa=m04(:,4);                         % (a) in frame (0)
m0a(:,4)=Oa;

L12r=makel2(Rev,Z,0,O);              % builds relative L matrices
L23r=makel2(Rev,Z,0,O);
L34r=makel2(Pri,Z,0,O);

L12f= mami(L12r,m01);                % evaluate L matrices in frame (0)
L23f= mami(L23r,m02);
L34f= mami(L34r,m03);

W01=zeros(4);
                                     % builds relative velocity matrices
W12=L12f*qp(1);
W23=L23f*qp(2);
W34=L34f*qp(3);

W04=W01+W12+W23+W34;                 % builds absolute W matrix of frame 4 in frame 0

W04a=miam(W04,m0a);                  % Evaluates W matrix of frame 4 in frame (a)

printm(' The absolute position matrix  of  the  gripper  is:  M04', m04);
printm(' The position matrix  of frame "a" referred to frame "O" is:  M0a', m0a);
printm(' The velocity matrix of the gripper in frame (0) is:  W04', W04);
printm(' The velocity matrix of the gripper in frame (a) is:  W04a', W04a);
