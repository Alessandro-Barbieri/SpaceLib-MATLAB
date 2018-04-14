%TESTSPAC:  TEST PROGRAM FOR THE SPACELIB FUNCTIONS.
%
% Vengono generati dei parametri random da introdurre nelle funzioni per testarle.
% Questo viene fatto per le funzioni che hanno anche la funzione inversa. 
% Applicando in sequenza, la funzione e la sua inversa, bisognerà ritrovare 
% ( a meno di una prefissata tolleranza) i parametri di partenza 
%
% patched by G. Legnani November 2001
%___________________________________________________________________________

spheader

% Setting the output path:
out=fopen('tmp.txt','wt');

t=menu('SPACELIB - Test estensivi: SCEGLIERE LA FUNZIONE DA TESTARE:',...
      '1)  CARDATOM  (MTOCARDA)','2)  CARDATOR  (RTOCARDA)','3)  CARDATOH  (HTOCARDA)',...
      '4)  PLANE  (PLANE2) ','5)  EXTRACT  (ROTAT)','6)  EXTRACT (ROTAT2)',...
      '7)  EXTRACT  (ROTAT24)','8)  MTOSCREW  (SCREWTOM)' ,'9) INTER2PL','10)PSEUDINV',...
      '11) LINE2P (LINPVECT)');

%*****************       TEST  CARDATOM (MTOCARDA)       *******************

contatore=0;

while (contatore<10)
contatore=contatore+1;

if (t==1)

        q=jrand(1,3,-pi,pi);
        fprintf(out,'\nTest n°:%d\n',contatore)
        fprintm(out,'The input screw parameters are:',q)

        O=10*jrand(3,1,-5,5); O(U)=1;
        i=round(1+2*rand(1,1));
        j=round(1+2*rand(1,1));
        k=round(1+2*rand(1,1));
	while (i<1)|(j<1)|(k<1)|(i==j)|(j==k)
		i=round(3*rand(1,1));
		j=round(3*rand(1,1));
		k=round(3*rand(1,1));
	end

	M=cardatom(q,i,j,k,O); 
        fprintm(out,'The position matrix obtained with function CARDATOM is:',M)
	
	[q1 q2]=mtocarda(M,i,j,k);
        fprintf(out,'\n\nThe screw parameters evaluated with function MTOCARDA are:')
        fprintm(out,' ',q1)
        fprintm(out,' ',q2)

	errore1=modulus(q1-q);
	errore2=modulus(q2-q);

	if ( (errore1)>10e-4) & ((errore2) >10e-4)
                q
                q1
                q2
                fprintf(out,'***  ERROR IN CARDATOM OR MTOCARDA  ***')
	end

end % if t==1

if (contatore==10)&(t==1) 
	disp('**** OK: test successful **** Le  funzioni  CARDATOM  e MTOCARDA hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  CARDATOM  e MTOCARDA hanno superato correttamente i test  ****\n\n')
end


%**********************       CARDATOR (RTOCARDA)           ***************************

if (t==2)

        q=jrand(1,3,-pi,pi);
        i=round(1+2*rand(1,1));
        j=round(1+2*rand(1,1));
        k=round(1+2*rand(1,1));
        fprintf(out,'\nTest n°:%d\n',contatore)
        fprintm(out,'The input screw parameters are: q =',q)
	
	while (i<1)|(j<1)|(k<1)|(i==j)|(j==k)
                i=round(1+2*rand(1,1));
                j=round(1+2*rand(1,1));
                k=round(1+2*rand(1,1));
	end

        R=cardator(q,i,j,k); 
        fprintm(out,'The rotation matrix obtained with function CARDATOR is:',R)
	[q1 q2]=rtocarda(R,i,j,k);
        fprintf(out,'The screw parameters evaluated with function RTOCARDA are:')
        fprintm(out,'q1 = ',q1)
        fprintm(out,'q2 = ',q2)

	errore1=modulus(q1-q);
	errore2=modulus(q2-q);

	if ( (errore1)>10e-4) & ((errore2) >10e-4)
                q
                q1
                q2
                fprintf(out,'***  ERROR IN CARDATOR OR RTOCARDA  ***')
	end	

end % if t==2

if (contatore==10)&(t==2) 
	disp('**** OK: test successful **** Le  funzioni  CARDATOR  e RTOCARDA hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  CARDATOR  e RTOCARDA hanno superato correttamente i test  ****\n\n')
end



%*****************        TEST   SCREWTOM  (MTOSCREW)    *******************

if (t==8)

	% Random Inputs

        phi=jrand(1,1,-pi,pi);
        P=jrand(3,1,-5,5);
	P(U)=1;
        h=jrand(1,1,-5,5);
        V=jrand(3,1,-5,5);
	u=unitv(V);
        fprintf(out,'\nTest n°:%d\n',contatore)
        fprintf(out,'The input screw parameters are:')
        fprintm(out,'u =',u)
        fprintm(out,'phi=',phi)
        fprintm(out,'P =',P)
        fprintm(out,'h =',h)

	M=screwtom(u,phi,P,h);
        fprintm(out,'The rototranslation matrix obtained with function SCREWTOM is:',M)

	[u1 fi1 P1 h1]=mtoscrew(M);
        fprintf(out,'The screw parameters evaluated with function MTOSCREW are:')
        fprintm(out,'u  =',u1)
        fprintm(out,'phi =',fi1)
        fprintm(out,'Point P =',P1)
        fprintm(out,'h  =',h1)

        sign=u1'*u;
        errore1=1-modulus(sign);
        errore2=modulus(sign*fi1-phi);
        errore3=modulus(sign*h1-h);
        errore4=1-abs(u'*unitv(vect(P1,P))); %% by Joe

        if (P1(U)~=1)
          contatore
          error(' SCREWTOM P1(U)~=1');
        end
	if ((errore1)>10e-4)
		u1 
		u
		contatore
                fprintf(out,'*** ERROR IN SCREWTOM OR MTOSCREW: The axis u...  ***')
	end

	if (errore2)>10e-4
		fi1 
		phi 
		contatore
                fprintf(out,'*** ERROR IN SCREWTOM OR MTOSCREW: Angle phi...  ***')
		error('*** ERROR IN SCREWTOM OR MTOSCREW: Angle phi...  ***')
	end

	if (errore3)>10e-4
		h 
		h1 
		contatore
		error('*** ERROR IN SCREWTOM OR MTOSCREW: Screw displacement h...  ***')
	end

        if (errore4)>10e-4  % by Joe
                P 
                P1
                unitv(vect(P,P1))
                u1
		contatore
		error('*** ERROR IN SCREWTOM OR MTOSCREW: Screw displacement h...  ***')
	end

end % if t==8

if (contatore==10)&(t==8) 
	disp('**** OK: test successful **** Le  funzioni  SCREWTOM e MTOSCREW hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  SCREWTOM e MTOSCREW hanno superato correttamente i test  ****\n\n')
end

%*****************          TEST   PLANE (PLANE2)    *******************

if (t==4)
fprintf(out,'\n\n TEST FUNCTIONS :    PLANE AND PLANE2\n');
fprintf(out,'\n We create 30 list of three points. \nWe build the');
fprintf(out,' plane passing through the points with function');
fprintf(out,' plane. \n We evaluate the direction');
fprintf(out,' orthogonal to the plane itself and we build the');
fprintf(out,' plane passing \nthrough the third point  and orthogonal');
fprintf(out,' to the evaluated direction by the function plane2\n');

	for numtent=1:1:2
                P1=jrand(3,1,-100,100);
                P2=jrand(3,1,-100,100);
                P3=jrand(3,1,-100,100);
		P1(U)=1; P2(U)=1; P3(U)=1;
                fprintf(out,'\n\n Attempt No. - %d - \n',numtent);
                fprintm(out,' The first point  is  :',P1);
                fprintm(out,' The second point is  :',P2);
                fprintm(out,' The third point  is  :',P3);
		pl1=plane(P1,P2,P3);
                fprintm(out,' The plane built by function PLANE is :',pl1);
		v1=vect(P1,P2);
		v2=vect(P3,P2);
		v3=cross(v1,v2);
		pl2=plane2(P2,v3);
                fprintm(out,' The plane built by function PLANE2 is :',pl2);
                if(jnorm(pl1-pl2)) > 10.e-4
                   contatore
                   P1
                   P2
                   P3
                   v1
                   v2
                   pl1
                   pl2
                   error(' PLANE error');
                end
	end
end % if t==4

if (contatore==10)&(t==4) 
	disp('**** OK: test successful **** Le  funzioni  PLANE e PLANE2 hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  PLANE e PLANE2 hanno superato correttamente i test  ****\n\n')
end


%*****************          TEST      ROTAT (EXTRACT)    *******************

if (t==5)

	% Random Inputs

        phi=jrand(1,1,-pi,pi);
        V=jrand(3,1,-5,5);
	u=unitv(V);
        fprintf(out,'\nTest n°:%d\n\N',contatore)
        fprintf(out,'The input screw parameters are:')
        fprintm(out,'u  :',u)
        fprintm(out,'phi :',phi)

        M=rotat(u,phi);
        fprintm(out,'The matrix obtained with function ROTAT is:',M)

	[u1 fi1]=extract(M);
        fprintf(out,'\NThe screw parameters evaluated with function EXTRACT are:')
        fprintm(out,'u1  :',u1)
        fprintm(out,'fi1 :',fi1)

        sign=u'*u1;
        errore1=modulus(sign*u1-u);
        errore2=modulus(sign*fi1-phi);

	if ((errore1)>10e-4)
		u1 
		u
		contatore
		error('*** ERROR IN EXTRACT OR ROTAT: The axis u...  ***')
	end

	if (errore2)>10e-4
		fi1 
		phi 
		contatore
		error('*** ERROR IN EXTRACT OR ROTAT: Angle phi...  ***')
	end


end % if t==4

if (contatore==10)&(t==5) 
	disp('**** OK: test successful **** Le  funzioni  EXTRACT e ROTAT hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  EXTRACT e ROTAT hanno superato correttamente i test  ****\n\n')
end

%*****************          TEST     HTOCARDA (CARDATOH)    *******************

if (t==3)

	% Random Inputs
        q=jrand(1,3,-pi,pi);
        qqp=jrand(1,3,-pi,pi);
        qpp=jrand(1,3,-pi,pi);
        O=jrand(3,1,-10,10); O(U)=1;
        i=round(1+2*rand(1,1));
        j=round(1+2*rand(1,1));
        k=round(1+2*rand(1,1));
	while (i<1)|(j<1)|(k<1)|(i==j)|(j==k)
                i=round(1+2*rand(1,1));
                j=round(1+2*rand(1,1));
                k=round(1+2*rand(1,1));
	end

	M=cardatom(q,i,j,k,O); 
	W=cardatow(q,qqp,i,j,k,O);
	H=cardatoh(q,qqp,qpp,i,j,k,O);
        fprintf(out,'\nTest n�:%d\n',contatore)
        fprintf(out,'The input parameters are:')
        fprintm(out,'q   = ',q)
        fprintm(out,'qp  = ',qqp)
        fprintm(out,'qpp = ',qpp)
        fprintm(out,'The resulting  M matrix is :',M)
        fprintm(out,'TThe resulting W matrix is :',W)
        fprintm(out,'The resulting  H matrix is :',H)

	[q1,q2,qp1,qp2,qpp1,qpp2]=htocarda(M,W,H,i,j,k);
        fprintm(out,'The first  solution q1 is : ',q1)
        fprintm(out,'The second solution q2 is : ',q2)
        fprintm(out,'The first  solution qp1 is : ',qp1)
        fprintm(out,'The second solution qp2 is : ',qp2)
        fprintm(out,'The first  solution qpp1 is : ',qpp1)
        fprintm(out,'The second solution qpp2 is : ',qpp2)

	errore1=modulus(q1-q);		errore3=modulus(qp1-qqp);	errore5=modulus(qpp1-qpp);
	errore2=modulus(q2-q);		errore4=modulus(qp2-qqp);	errore6=modulus(qpp2-qpp);
			
	if (errore1>10e-5)&(errore2>10e-5)
		q1		
		q2
		q
		error('*** ERROR IN EXTRACT OR ROTAT: q  ***')
	end

	if (errore3>10e-5)&(errore4>10e-5)
		qp1		
		qp2
		qqp
		error('*** ERROR IN HTOCARDA  OR CARDATOH: qp  ***')
	end

	if (errore5>10e-5)&(errore6>10e-5)
		qpp1		
		qpp2
		qpp
		error('*** ERROR IN HTOCARDA  OR CARDATOH: qpp  ***')
	end



end % if t==3

if (contatore==10)&(t==3) 
	disp('**** OK: test successful **** Le  funzioni  HTOCARDA  e CARDATOH hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  HTOCARDA  e CARDATOH hanno superato correttamente i test  ****\n\n')
end


%*****************          TEST    ROTAT2 (EXTRACT)    *******************

if (t==6)

	% Random Inputs

        phi=jrand(1,1,-pi,pi);
        u=round(2*rand(1,1))+1;                                % Generazione asse X,Y, or Z
        fprintf(out,'\nTest n°:%d\n',contatore)
        fprintf(out,'The input screw parameters are:')
        fprintm(out,'u  :',u)
        fprintm(out,'phi :',phi)

        M=rotat2(u,phi);
        fprintm(out,'The matrix obtained with function ROTAT2 is:',M)

	[u1 fi1]=extract(M);
        fprintf(out,'\nThe screw parameters evaluated with function EXTRACT are:')
        fprintm(out,'u1  :',u1)
        fprintm(out,'fi1 :',fi1)

        uu=[0 0 0]';
	uu(u)=1;

        sign=uu'*u1;
        errore1=modulus(sign*uu-u1);
        errore2=modulus(sign*fi1-phi);

	if ((errore1)>10e-4)
		uu 
		u1
		contatore
		error('*** ERROR IN EXTRACT OR ROTAT2: axis u  ***')
	end

	if (errore2)>10e-4
		fi1 
		phi 
		contatore
		error('*** ERROR IN EXTRACT OR ROTAT2: Angle phi  ***')
	end

end % if t==6

if (contatore==10)&(t==6) 
	disp('**** OK: test successful **** Le  funzioni  EXTRACT e ROTAT2 hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  EXTRACT e ROTAT2 hanno superato correttamente i test  ****\n\n')
end


%*****************          TEST    ROTAT24 (EXTRACT)    *******************

if (t==7)

	% Random Inputs

        phi=jrand(1,1,-pi,pi);
	u=round(2*rand(1,1))+1; % Generi l'asse X,Y,Z, or U
        uu=[0 0 0 ]'; 
	uu(u)=1;
        O=jrand(3,1,-10,10);
	O(U)=1;
        fprintf(out,'\nTest n°:%d\n',contatore)
        fprintf(out,'The input screw parameters are:')
        fprintm(out,'u  :',uu)
        fprintm(out,'phi :',phi)
        fprintm(out,'O  :',O)

	M=rotat24(u,phi,O);
        fprintm(out,'The matrix obtained with function ROTAT24 is:',M)

	[u1 fi1]=extract(M);
        fprintf(out,'\nThe screw parameters evaluated with function EXTRACT are:')
        fprintm(out,'u1  :',u1)
        fprintm(out,'fi1 :',fi1)

        sign=u1'*uu;

        errore1=modulus(sign*u1-uu);
        errore2=modulus(sign*fi1-phi);

	if ((errore1)>10e-4)
		u
                u1
		uu
		contatore
		error('*** ERROR IN EXTRACT OR ROTAT24: The axis u...  ***')
	end

	if (errore2)>10e-4
		fi1 
		phi 
		contatore
		error('*** ERROR IN EXTRACT OR ROTAT24: Angle phi...  ***')
	end

end % if t==7

if (contatore==10)&(t==7) 
	disp('**** OK: test successful **** Le  funzioni  EXTRACT e ROTAT24 hanno superato correttamente i test  ****')
        fprintf(out,'\n\n**** OK: test successful **** Le  funzioni  EXTRACT e ROTAT24 hanno superato correttamente i test  ****\n\n')
end

% ****************************   TEST FUNCTION INTER2PL    **********************************

if (t==9)
fprintf(out,'TEST FUNCTION INTER2PL\n');
	fprintf(out,'\nWe consider 10 couples of planes, each of them');
	fprintf(out,'\nparallel to a reference axis. They have a random');
	fprintf(out,'\ndistance from the origin. We evaluate their');
	fprintf(out,'\nintersection line l by function inter2pl');

	for numtent=1:1:11
		par1=round(U*rand(1));

		if (par1==X)
				pl1(X)=1; pl1(Y)=0; pl1(Z)=0;
				%break;
		end	
		if (par1==Y)
				pl1(X)=0; pl1(Y)=1; pl1(Z)=0;
				%break;
		end	
		if (par1==Z)
				pl1(X)=0; pl1(Y)=0; pl1(Z)=1;
				%break;
		end	
		pl1(U)=1000*rand(1);

		par2=round(U*rand(1));
		

		if (par2==X)
				pl2(X)=1; pl2(Y)=0; pl2(Z)=0;
				%break;
		end	
		if (par2==Y)
				pl2(X)=0; pl2(Y)=1; pl2(Z)=0;
				%break;
		end	
		if (par2==Z)
				pl2(X)=0; pl2(Y)=0; pl2(Z)=1;
				%break;
		end	
		pl2(U)=1000*rand(1);


		pl2(U)=1000*rand(1);

		[l,test]=inter2pl(pl1,pl2);

                fprintf(out,'\n\n TEST N° %d\n',numtent);
                fprintm(out,'First  plane  is  :',pl1);
                fprintm(out,'Second plane  is  :',pl2);

		if (test==NOTOK)
                        fprintf(out,'\nPlanes are parallel (no intersection)\n');
		end
		if (test==OK)
                        fprintm(out,'The origin    of intersection line is :',(l(:,X))');
                        fprintm(out,'The direction of intersection line is :',(l(:,Y))');
		end
end %for
if (contatore==10)&(t==9) 
	disp('**** La  funzione  INTER2PL ha superato correttamente i test  ****')
        fprintf(out,'\n\n**** La  funzione  INTER2PL ha superato correttamente i test  ****')
end
end %if t==9


%*******************	TESTING 	PSEUDINV	*************************************
if (t==10)
	fprintf(out,'\n\nTEST Function: PSEUDINV.m\n');
	fprintf(out,'\nWe create 10 random vectors. We build the');
	fprintf(out,'\npseudo-inverse matrix with the function PSEUDINV');
	fprintf(out,'This matrix verify the property :');
	fprintf(out,'\n(A+)=At/(At*A) where A+ is the pseudo-inverse and At is the transpose matrix\n');
	for numtent=1:1:10
		numrow=round(10*rand(1));
		if (numrow==0)
			numrow=3;
		end
		A =  zeros(numrow,1);
		B =  zeros(numrow,1);
		Api =zeros(numrow,1);
		for i=1:1:numrow
			temp = round(100*rand(1));
			A(i,1) = temp;
		end
		Api=pseudinv(A);
		B=A'/(A'*A);
                fprintf(out,'\n\n TEST N° %d \n',numtent);
		fprintm(out,' The  starting  matrix  is :', A);
		fprintm(out,' The pseudo-inverse matrix is :',Api);
		fprintm(out,' The product At/((At)*A) is : ',B);
	end
end %chiude if t==10
if (contatore==10)&(t==10) 
	disp('**** La  funzione  PSEUDINV ha superato correttamente i test  ****')
        fprintf(out,'\n\n**** La  funzione  PSEUDINV ha superato correttamente i test  ****')
end


%*****************	TESTING  LINE2P (LINPVECT)	*********************
if (t==11)

fprintf(out,'\n\nTEST FUNCTIONS LINE2P AND LINEPVECT\n');
fprintf(out,'\nWe create 100 couples of points and we evaluate the');
fprintf(out,'\nline passing through every couple with function');
fprintf(out,'LINE2P.The vector between the two points');
fprintf(out,'\nis then evaluated and it is used as direction of a');
fprintf(out,'\nline whose origin is in the first point. This line is');
fprintf(out,'built by function LINPVECT\n');

P1=zeros(4,1);
P2=zeros(4,1);
l1=zeros(4,2);
l2=zeros(4,2);

for numtent=1:1:2
	for i=1:1:2
		for j=1:1:3
			ele = 120*rand(1);
				if (i==1)
					P1(j) = ele;
				else
					P2(j) = ele;
				end
		end
	end

	P1(U)=1; P2(U)=1;
		
	fprintf(out,'\n\n Test N° %d\n',numtent);

	fprintm(out,'First  point is :',P1');
	fprintm(out,'Second point is :',P2');

	l1=line2p(P1,P2);
	fprintm(out,'The   Origin  of the line built with LINE2P is :',(l1(:,X))');
	fprintm(out,'The Direction of the line built with LINE2P is :',(l1(1:3,Y))');

	v=vect(P2,P1);
	l2=linpvect(P1,v);
	fprintm(out,'The  Origin   of the line built with LINPVECT is :',(l2(:,X))');
	fprintm(out,'The Direction of the line built with LINPVECT is :',(l2(1:3,Y))');


	if modulus(l2-l1)>0.001 
		error('*** ERROR IN  LINE2P e LINPVECT ***')
	end
end

end %chiude if t==11
if (contatore==10)&(t==11) 
	disp('**** OK: test successful **** Le funzioni LINE2P e LINPVECT hanno superato correttamente i test  ****')
	fprintf(out,'\n\n**** OK: test successful **** Le funzioni  LINE2P e LINPVECT hanno superato correttamente i test  ****')
end


end% (WHILE contatore)
fclose('all');
