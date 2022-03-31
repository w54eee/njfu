clear;
clc;
load('chushi.mat');%加载初始点范�?
load('total_tri.mat');%加载林分三角面片数据
load('ndir.mat');
load('total_sec.mat');


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
fedgenorm = -fedgenorm;
e = 1/2;
nrefract(size(fedge,1),3) = 0;
for i = 1:size(fedgenorm,1)
    k = 1-e*e*(1-dot(fedgenorm(i,:),ndir)*dot(fedgenorm(i,:),ndir));
    if(k<0)
        nrefract(i,:)=[0 0 0];
    else
        nrefract(i,:) = e*ndir-(e*dot(fedgenorm(i,:),ndir)+sqrt(k))*fedgenorm(i,:);
    end
end

load('total_secrefract.mat');
refractcal = [];%[面片编号，面片法向量，折射线编号，折射线向量，面片法向量和折射线法向量cos]
for i = 1:size(total_secrefract,1)
    dot1 = -fedgenorm(total_secrefract(i,6),:);
    dot2 = nrefract(total_secrefract(i,6),:);
    cosrefract = abs(dot(dot1,dot2)/(norm(dot1)*norm(dot2)));
    sinrefract = 0.2*sqrt(1-(cosrefract)^2);
    refractcal = [refractcal;total_secrefract(i,6),dot1,total_secrefract(i,4),dot2,sinrefract];
end


hold on;
% for i = 1:size(total_sec,1)
%     quiver3(total_sec(i,1),total_sec(i,2),total_sec(i,3)...
%         ,2*nrefract(total_sec(i,6),1),2*nrefract(total_sec(i,6),2)...
%         ,2*nrefract(total_sec(i,6),3),'color','b','MaxHeadSize',1,'Linewidth',1);
% %     line([total_sec(i,1),AA(2*total_sec(i,4),1)],[total_sec(i,2),AA(2*total_sec(i,4),2)],[total_sec(i,3),AA(2*total_sec(i,4),3)],'color','y','linewidth',1);]
% end

refractcal = sortrows(refractcal,1);
nn = tabulate(total_secrefract(:,6));

num_trion = find(nn(:,3)~=0);
num_trioff = find(nn(:,3)==0);
refract_broadleaf = [];
for i = 1:size(num_trion,1)
    ii = find(refractcal(:,1) == num_trion(i));
    refract_broadleaf = [refract_broadleaf;num_trion(i),sum(refractcal(ii,9))];
end
total_energy = sum(refract_broadleaf(:,2));
reflect_energy = total_energy;

for i = 1:size(num_trioff,1)
     pattri = patch(total_tri(num_trioff(i),1:3),total_tri(num_trioff(i),4:6),total_tri(num_trioff(i),7:9),[69 149 176]./255);
     set(pattri,'EdgeColor',[69 149 176]./255)
end
hold on
unique_energy = unique(refract_broadleaf(:,2));
uuu = [];
for i = 1:size(refract_broadleaf,1)
    uu = find(refract_broadleaf(i,2)==unique_energy);
    uuu = [uuu;uu];
end
refract_broadleaf(:,3) = uuu;


load('rgb3360.mat');

for i = 1:size(refract_broadleaf,1)
    pattri = patch(total_tri(refract_broadleaf(i,1),1:3),total_tri(refract_broadleaf(i,1),4:6),total_tri(refract_broadleaf(i,1),7:9),rgb(length(rgb)+1-refract_broadleaf(i,3),:)./255);
    set(pattri,'EdgeColor',rgb(length(rgb)+1-refract_broadleaf(i,3),:)./255)
end

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
xlabel('x');
ylabel('y');
