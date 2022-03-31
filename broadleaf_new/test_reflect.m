clear;
clc;
load('total_tri');
load('total_sec4');
load('total_secref4');
load('ndir.mat');
hold on;

fedge(size(total_tri,1),3) = 0;%每个三角形平面的法向量
for i = 1:size(total_tri,1)
    edge1 = [total_tri(i,2)-total_tri(i,1),total_tri(i,5)-total_tri(i,4),total_tri(i,8)-total_tri(i,7)];
    edge2 = [total_tri(i,3)-total_tri(i,1),total_tri(i,6)-total_tri(i,4),total_tri(i,9)-total_tri(i,7)];
    fedge(i,:) = cross(edge2,edge1);
end

fedgenorm(size(fedge,1),3) = 0;
for i = 1:size(fedge,1)
    fedgenorm(i,:) = fedge(i,:)/norm(fedge(i,:));
end
fedgenorm = -fedgenorm;

nref(size(fedge,1),3) = 0;
for i = 1:size(fedge,1)
    nref(i,:) = ndir - 2*dot(ndir,fedgenorm(i,:))*fedgenorm(i,:);
end


patch(total_tri(8181,1:3),total_tri(8181,4:6),total_tri(8181,7:9),[69 149 176]./255);
ndir = [ -0.0434    0.1832   -0.9821];
A = total_sec(5,1:3);
B = A - 2*ndir;
line([A(1),B(1)],[A(2),B(2)],[A(3),B(3)],'color',[1 0 0]);
C = total_secref(4,1:3);
line([A(1),C(1)],[A(2),C(2)],[A(3),C(3)]);
axis equal;
xlabel('x');
ylabel('y');
zlabel('z');