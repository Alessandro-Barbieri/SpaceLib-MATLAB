
function [wp2,f2,ex_status]=dyn_eq(J,wp,f,var)

%___________________________________________________________________________
%
% DYN_EQ
%___________________________________________________________________________


spheader

mat=zeros(6,7);
ivar=zeros(1,6);
acc=zeros(1,6);
nvar=0;
for i=1:1:2
	for j=1:1:6
		if (var(i,j)~=0) 
			nvar=nvar+1;
		end
	end
end

if (nvar~=6)
	fprintf(1,' Error in DYN_EQ: wrong number of unknown variables'); 
        ex_status=NOTOK;
	return
end

for i=1:1:6
        ivar(i) =i;   % indexes
end

% Angular accelerations
if (~var(1,X))  acc(X)=wp(Z,Y); end
if (~var(1,Y))  acc(Y)=wp(X,Z); end
if (~var(1,Z))  acc(Z)=wp(Y,X); end

% Linear accelerations
if (~var(1,3+X)) acc(3+X)=wp(X,U); end
if (~var(1,3+Y)) acc(3+Y)=wp(Y,U); end
if (~var(1,3+Z)) acc(3+Z)=wp(Z,U); end

% Torques
if (~var(2,X)) mat(X,7)=f(Z,Y); end
if (~var(2,Y)) mat(Y,7)=f(X,Z); end
if (~var(2,Z)) mat(Z,7)=f(Y,X); end

% Forces
if (~var(2,3+X)) mat(3+X,7)=f(X,U); end
if (~var(2,3+Y)) mat(3+Y,7)=f(Y,U); end
if (~var(2,3+Z)) mat(3+Z,7)=f(Z,U); end

mat(X,X)=J(Y,Y)+J(Z,Z);	mat(Y,Y)=J(X,X)+J(Z,Z);	mat(Z,Z)=J(X,X)+J(Y,Y);

mat(X,Y)=-J(X,Y); mat(Y,X)=mat(X,Y);
mat(X,Z)=-J(X,Z); mat(Z,X)=mat(X,Z);
mat(Y,Z)=-J(Y,Z); mat(Z,Y)=mat(Y,Z);


mat(X,3+X)=0;		mat(Y,3+Y)=0;	      mat(Z,3+Z)=0;	
mat(3+X,X)=0;		mat(3+Y,Y)=0;	      mat(3+Z,Z)=0;

mat(Y,3+Z)=-J(X,U); 	mat(3+Z,Y)=-J(X,U);	
mat(Z,3+Y)= J(X,U);	mat(3+Y,Z)= J(X,U);

mat(Z,3+X)=-J(Y,U); 	mat(3+X,Z)=-J(Y,U);	
mat(X,3+Z)= J(Y,U);	mat(3+Z,X)= J(Y,U);

mat(X,3+Y)=-J(Z,U); 	mat(3+Y,X)=-J(Z,U);	
mat(Y,3+X)= J(Z,U);	mat(3+X,Y)= J(Z,U);

mat(3+X,3+X)=J(U,U);	mat(3+X,3+Y)=0;       mat(3+X,3+Z)=0;
mat(3+Y,3+X)=0;		mat(3+Y,3+Y)=J(U,U);  mat(3+Y,3+Z)=0;
mat(3+Z,3+X)=0;		mat(3+Z,3+Y)=0;	      mat(3+Z,3+Z)=J(U,U);


for j=1:1:6
        var_a(j)=j;
        var_f(j)=j;
end

var2=var;
neq=0;
for j=1:1:6
     if(var(1,j))
        neq=neq+1;
     else
        for i=j+1:1:6
           if(var(1,i))
                neq=neq+1;
                %fprintf(1,'swabc %d %d %d %d\n',i,j,var(1,i),var(1,j));
                [mat,var_a]=swabc(mat,6,7,6,i,j,var_a);
		t=acc(j);
                acc(j)=acc(i);
                acc(i)=t;
                it=var_a(j);
                itmp=var(1,j); var(1,j)=var(1,i); var(1,i)=itmp;
                itmp=var(2,j); var(2,j)=var(2,i); var(2,i)=itmp;
                mat=swabr(mat,6,7,7,i,j);
		k=var_f(j);
                var_f(j)=var_f(i);
                var_f(i)=k;
                break;
           end
	end
     end
end

tappo=-1;

for i=1:1:6
	t=0;
        for j=neq+1:1:6
		t=t+mat(i,j)*acc(j);
	end
mat(i,neq+1)=mat(i,7)-t;
end

if (neq~=0)
        [mat,ivar,irank,arm]=linears(mat,6,7,neq,neq,1,tappo);
        if (irank~=neq)
                ex_status=-irank;
                disp('**** DYN_EQ error. Matrix is singular!!!');
	end
end

for i=1:1:neq
        t=mat(i,neq+1);
        acc(var_a(ivar(i)+1))=t;
        %fprintf(1,'acc %d %d %d %f\n',i,ivar(i)+1,var_a(ivar(i)+1),t);
end

wp2=wp;

for i=1:1:4
        wp2(i,i)=0;
        wp2(4,i)=0;
end

if (var2(1,X)) wp2(Y,Z)=-acc(X); wp2(Z,Y)=-wp2(Y,Z); end
if (var2(1,Y)) wp2(Z,X)=-acc(Y); wp2(X,Z)=-wp2(Z,X); end
if (var2(1,Z)) wp2(X,Y)=-acc(Z); wp2(Y,X)=-wp2(X,Y); end

if (var2(1,3+X)) wp2(X,U)= acc(3+X); end
if (var2(1,3+Y)) wp2(Y,U)= acc(3+Y); end
if (var2(1,3+Z)) wp2(Z,U)= acc(3+Z); end

f2=skew(wp2,J);
ex_status=OK;

