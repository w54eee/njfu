clear;
clc;
load('chushi.mat');%加载入射初始点坐标区间
load('total_tri.mat');%加载所有三角面片坐标
load('ndir.mat');%加载入射向量
% load('total_energy');
v1 = ndir(1);
v2 = ndir(2);
v3 = ndir(3);

fedge(size(total_tri,1),3) = 0;%计算每个三角形的法向量
for i = 1:size(total_tri,1)
    edge1 = [total_tri(i,2)-total_tri(i,1),total_tri(i,5)-total_tri(i,4),total_tri(i,8)-total_tri(i,7)];
    edge2 = [total_tri(i,3)-total_tri(i,1),total_tri(i,6)-total_tri(i,4),total_tri(i,9)-total_tri(i,7)];
    fedge(i,:) = cross(edge2,edge1);
end

fedgenorm(size(fedge,1),3) = 0;%将法向量单位化
for i = 1:size(fedge,1)
    fedgenorm(i,:) = fedge(i,:)/norm(fedge(i,:));
end

e = 1; %这个是折射率 就是产生偏折的 1就是不偏
nrefract(size(fedge,1),3) = 0;%计算出每个三角形的折射向量（因为入射向量都是nir）
for i = 1:size(fedgenorm,1)
    k = 1-e*e*(1-dot(fedgenorm(i,:),ndir)*dot(fedgenorm(i,:),ndir));
    if(k<0)
        nrefract(i,:)=[0 0 0];
    else
        nrefract(i,:) = e*ndir-(e*dot(fedgenorm(i,:),ndir)+sqrt(k))*fedgenorm(i,:);
    end
end
nrefract = real(nrefract);

load('total_secrefract1111.mat'); %这里加载的透射点是根据程序radiationmap_refract算出来的，radiationmap_refract的程序需要先通过radiationmap来计算出total_sec（入射交点）
refractcal = [];%这里统计了每个透射光的光线能量
for i = 1:size(total_secrefract,1)
    dot1 = -fedgenorm(total_secrefract(i,6),:);
    dot2 = nrefract(total_secrefract(i,6),:);
    cosrefract = abs(dot(dot1,dot2)/(norm(dot1)*norm(dot2)));
    refractcal = [refractcal;total_secrefract(i,6),dot1,total_secrefract(i,4),dot2,cosrefract];
end
total_secrefract = real(total_secrefract);
% %鐢绘姌灏勭嚎
% for i = 2:size(total_secrefract,1)
%     line([total_sec(total_secrefract(i,4),1),total_secrefract(i,1)],...
%          [total_sec(total_secrefract(i,4),2),total_secrefract(i,2)],...
%          [total_sec(total_secrefract(i,4),3),total_secrefract(i,3)],...
%          'color','y','linewidth',0.1);
% end
refractcal = sortrows(refractcal,1);
nn = tabulate(total_secrefract(:,6)); %计算每个值出现的频率

num_trion = find(nn(:,3)~=0); %被透射到的
num_trioff = find(nn(:,3)==0);%未被透射到的
tri_energy = [];%每个三角形的能量
for i = 1:size(num_trion,1)
    ii = find(refractcal(:,1) == num_trion(i));
    tri_energy = [tri_energy;num_trion(i),sum(refractcal(ii,9))];
end
% tri_energy = sortrows(tri_energy,2);
% total_energy = sum(tri_energy(:,2));
% reflect_energy = total_energy;

for i = 1:size(num_trioff,1) %这里是画出所有未被透射到的三角形
     pattri = patch(total_tri(num_trioff(i),1:3),total_tri(num_trioff(i),4:6),total_tri(num_trioff(i),7:9),[14 148 77]./255);
     set(pattri,'EdgeColor',[14 148 77]./255)
end
hold on



load('rgb7420.mat');
for i = 1:size(tri_energy,1)%这里是画出所有被透射到的三角形，颜色根据能量改变
    pattri = patch(total_tri(tri_energy(i,1),1:3),total_tri(tri_energy(i,1),4:6),total_tri(tri_energy(i,1),7:9),rgb((length(rgb)-i),:)./255);
    set(pattri,'EdgeColor',rgb((length(rgb)-i),:)./255)
end

shuganc = [0.7 0.5 0.04];

load('broadleaf.mat'); %画树干
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
