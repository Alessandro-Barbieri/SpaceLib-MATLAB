%_______________________________________________________________________________________________
%                                        TEST-LIN.M
% Sample program which reads and solves a linear system whose matrix of coefficient and whose
% right-hand side vector are memorized in the file INP.DAT
%_______________________________________________________________________________________________

spheader
Nmax=6;
Mmax=7;
H=zeros(Nmax,Mmax+1);
A=zeros(Nmax,Mmax);
b=zeros(Nmax,1);
x=zeros(Mmax,1);
ivet=zeros(Mmax,1);
vpr=zeros(1);
vpr(1)=-1;
clc                           % Read matrix of coefficients and right-hand side vector from file
fid=fopen('inp.dat','r');
if (fid==-1)
        error('Error: unable to open input file in TEST_LIN.M ')
end
n=fscanf(fid,'%d',1);                                            % Read dimension of the matrix
m=fscanf(fid,'%d',1);
if (n>Nmax)|(m>Mmax)
        error(' Error in TEST_LIN.M : The matrix is too big ')
end
c=1;                                                             % Read matrix and vector
for i=1:1:n
        for j=1:1:m
                t(c)=fscanf(fid,'%f',1);
                A(i,j)=t(c);
        end
t(c)=fscanf(fid,'%f',1);
b(i)=t(c);
c=c+1;
end
for i=1:1:n                                                      % Copy matrix of coefficients
        for j=1:1:m
                H(i,j)=A(i,j);
        end
end
for j=1:1:n                                                      % Copy right-hand side vector
        H(j,m+1)=b(j);
end
fprintf(1,'\n   Matrix and right-and side vector\n\n');
for i=1:1:n
        for j=1:1:m+1;
                fprintf(1,'%7.3f',H(i,j));
        end
fprintf(1,'\n');
end
[H,ivet,irank,arm]=linears(H,Nmax,Mmax+1,n,m,1,vpr);             % Solve the system
if (n==m) & (irank==n)
        fprintf(1,'The solution is: \n');
        for i=1:1:n
                x(ivet(i)+1)=H(i,n);
        end
        fprintm(1,'x=', x)
else
        if (n~=m)
                fprintf('\n\nThe number of rows and columns are different.\n');
        end
        printm('The rank of the matrix is: ', irank);
        printm(' ivet:',ivet);
        fprintf('\nThe matrix is\n ');
        for i=1:1:n
                for j=1:1:m+1
                        fprintf('%3.3f        ',H(i,j))
                end
        fprintf('\n');
        end
end
