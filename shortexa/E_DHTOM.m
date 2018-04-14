%
% E_dhtom.m
%
% sample program to test the functions 'dhtom' and 'dhtomstd'
% they must perform the same result
%
% direct kinematic of the Stanford Arm
%
clear;
spacelib
d2=0.2;
d3=0; % 3rd joint coord;

jtype=[Rev Rev Pri Rev Rev Rev]';   % joint type
% --- Denavit and Hartenberg parameters for the Stanford Arm
alpha=[-pi/2 pi/2 0 -pi/2 pi/2 0]';
a=[0 0 0 0 0 0]';
d=[0 d2 d3 0 0 0]';
theta=[0 0 0 0 0 0]';

Q=rand(6,1) % assign random value to the joint coordinate

% --- direct kinematic using 'dhtomstd'
fprintf(1,'direct kinematic using ''dhtomstd''');
Ma=UNIT4;
for i=1:6
   if jtype(i)==Rev
       m=dhtomstd(Q(i),d(i),a(i),alpha(i));
   else
       m=dhtomstd(theta(i),Q(i),a(i),alpha(i));
   end
   Ma=Ma*m;
end
Ma
 
% --- direct kinematic using 'dhtom'
fprintf(1,'direct kinematic using ''dhtom''');
Mb=UNIT4;
for i=1:6
    m=dhtom(jtype(i),theta(i),d(i),0.,a(i),alpha(i),Q(i));
    Mb=Mb*m;
end
Mb

% --- 'dhtomstd' and 'dhtom' must perform the same result
% so Ma must be equal to Mb and so dM=0
fprintf(1,'''dhtomstd'' and ''dhtom'' must perform the same result');
fprintf(1,'so Ma must be equal to Mb and so dM=0')

dM=Ma-Mb
