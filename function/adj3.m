function a=adj3(r)
%ADJ (Spacelib): adjointed of a 3*3 matrix (the inverse is 1/det*adj(matrix))
s=size(r);
if(s(1)~=3 | s(2)~=3)
   disp('ADJ3: bad matrix size (should be [3 3])');
end

a(1,1)= r(2,2)*r(3,3)-r(2,3)*r(3,2);
a(1,2)= r(2,3)*r(3,1)-r(2,1)*r(3,3);
a(1,3)= r(2,1)*r(3,2)-r(2,2)*r(3,1);

a(2,1)=-r(1,2)*r(3,3)+r(1,3)*r(3,2);
a(2,2)=-r(1,3)*r(3,1)+r(1,1)*r(3,3);
a(2,3)=-r(1,1)*r(3,2)+r(1,2)*r(3,1);

a(3,1)= r(1,2)*r(2,3)-r(1,3)*r(2,2);
a(3,2)= r(1,3)*r(2,1)-r(1,1)*r(2,3);
a(3,3)= r(1,1)*r(2,2)-r(1,2)*r(2,1);


