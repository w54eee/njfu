clear;
clc;
load('chushi.mat');%加载初始点范�?
load('total_tri.mat');%加载林分三角面片数据
load('ndir.mat');
load('total_sec.mat')
load('total_energy.mat');
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

incidentcal = [];%[面片编号，面片法向量，入射线编号，入射线向量，面片法向量和入射线法向量cos]

for i = 1:size(total_sec,1)
    dot1 = -fedgenorm(total_sec(i,6),:);
    dot2 = -ndir;
    cosrefract = abs(dot(dot1,dot2)/(norm(dot1)*norm(dot2)));
    incidentcal = [incidentcal;total_sec(i,6),dot1,total_sec(i,4),dot2,cosrefract];
end
total_sec = real(total_sec);

incidentcal = sortrows(incidentcal,1);
nn = tabulate(total_sec(:,6));
% for i = size(nn,1):size(total_tri,1)
% 	nn(i,:) = [i 0 0];
% end
num_trion = find(nn(:,3)~=0);
num_trioff = find(nn(:,3)==0);
tri_energy = incident_conifer;
for i = 1:size(num_trioff,1)
     pattri = patch(total_tri(num_trioff(i),1:3),total_tri(num_trioff(i),4:6),total_tri(num_trioff(i),7:9),[14 148 77]./255);
     set(pattri,'EdgeColor',[14 148 77]./255)
end
hold on

tri_energy = incident_broadleaf;


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

axis equal;
xlabel('x');
ylabel('y');
