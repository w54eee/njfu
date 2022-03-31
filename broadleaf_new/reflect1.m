clear;
clc;
load('chushi.mat');%加载初始点范�?
load('total_tri.mat');%加载林分三角面片数据
load('ndir.mat');
load('total_energy');
v1 = ndir(1);
v2 = ndir(2);
v3 = ndir(3);

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


nref(size(fedge,1),3) = 0;
for i = 1:size(fedge,1)
    nref(i,:) = ndir-2*dot(fedgenorm(i,:),ndir)*fedgenorm(i,:);
end

load('total_secref.mat');
% %��������
% for i = 1:size(total_secref,1)
%     line([total_sec(total_secref(i,4),1),total_secref(i,1)],...
%          [total_sec(total_secref(i,4),2),total_secref(i,2)],...
%          [total_sec(total_secref(i,4),3),total_secref(i,3)],...
%          'color','y','linewidth',0.1);
% end

reflectcal(size(total_secref,1),9) = 0;%[��Ƭ��ţ���Ƭ�������������߱�ţ���������������Ƭ�������ͷ����߷�����cos]
for i = 2:size(total_secref,1)
    dot1 = fedgenorm(total_secref(i,6),:);
    dot2 = nref(total_secref(i,6),:);
    cosref = abs(dot(dot1,dot2)/(norm(dot1)*norm(dot2)));
    reflectcal(i,:) = [total_secref(i,6),dot1,total_secref(i,4),dot2,cosref];
end

reflectcal = sortrows(reflectcal,1);
nn = tabulate(total_secref(:,6));

num_trion = find(nn(:,3)~=0);
num_trioff = find(nn(:,3)==0);
tri_energy = [];
for i = 1:size(num_trion,1)
    ii = find(reflectcal(:,1) == num_trion(i));
    tri_energy = [tri_energy;num_trion(i),sum(reflectcal(ii,9))];
end
total_energy = sum(tri_energy(:,2));
reflect_energy = total_energy;

for i = 1:size(num_trioff,1)
     pattri = patch(total_tri(num_trioff(i),1:3),total_tri(num_trioff(i),4:6),total_tri(num_trioff(i),7:9),[14 148 77]./255);
     set(pattri,'EdgeColor',[14 148 77]./255)
end
hold on

tri_energy = reflect_broadleaf;

load('rgb3444.mat');

for i = 1:size(tri_energy,1)
    pattri = patch(total_tri(tri_energy(i,1),1:3),total_tri(tri_energy(i,1),4:6),total_tri(tri_energy(i,1),7:9),rgb(length(rgb)+1-tri_energy(i,3),:)./255);
    set(pattri,'EdgeColor',rgb(length(rgb)+1-tri_energy(i,3),:)./255)
end

shuganc = [0.7 0.5 0.04];

load('broadleaf.mat');
num = 15;
hold on;
shuganc = [0.7 0.5 0.04];
total_tri = [];
for i = 1:size(Ubranch,1)
    [u,v,w] = cylinder(0.5);
    u = u+x1(i);
    v = v+y1(i);
    w = w*(Ubranch(i)+2);
    shugan = mesh(u,v,w);
    set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)
end
view(136,43);
axis equal;
xlabel('x');
ylabel('y');

