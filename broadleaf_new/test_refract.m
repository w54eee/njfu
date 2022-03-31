load('total_tri.mat');
load('test_chushi.mat');
load('ndir.mat');
load('test_total_sec');
load('test_total_secrefract');
total_tri = total_tri(1:195,:);
hold on;

fedge(size(total_tri,1),3) = 0;%每个三角形平面的法向�?
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
e = 1/1.5;
nrefract(size(fedge,1),3) = 0;
for i = 1:size(fedgenorm,1)
    k = 1-e*e*(1-dot(fedgenorm(i,:),ndir)*dot(fedgenorm(i,:),ndir));
    if(k<0)
        nrefract(i,:)=[0 0 0];
    else
        nrefract(i,:) = e*ndir-(e*dot(fedgenorm(i,:),ndir)+sqrt(k))*fedgenorm(i,:);
    end
end
for i = 1:size(total_tri,1);
    patch(total_tri(i,1:3),total_tri(i,4:6),total_tri(i,7:9),[69 149 176]./255);
end
ndir = [ -0.0434    0.1832   -0.9821];

for i = 1:size(total_secrefract,1)
    A = total_sec(total_secrefract(i,4),1:3);
    B = A - 2*ndir;
    line([A(1),B(1)],[A(2),B(2)],[A(3),B(3)],'color',[1 0 0],'linewidth',2);
    C = total_secrefract(i,1:3);
    line([A(1),C(1)],[A(2),C(2)],[A(3),C(3)],'linewidth',2);
end
axis equal;
alpha(0.2)
view(150,0);
xlabel('x');
ylabel('y');
zlabel('z');