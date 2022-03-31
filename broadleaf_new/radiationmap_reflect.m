clear;
clc;
% load('chushi_a45.mat');%加载初始点范围
load('total_tri.mat');%加载林分三角面片数据
load('total_sec_a60_1.mat');
load('ndir_a60.mat');
v1 = ndir(1);
v2 = ndir(2);
v3 = ndir(3);

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
    nref(i,:) = ndir-2*dot(fedgenorm(i,:),ndir)*fedgenorm(i,:);
end

total_secref = [];
for i = 1:size(total_sec,1)
    i
    for j = 1:size(fedge,1)
        sam = total_sec(i,1:3);
        sam_u = nref(total_sec(i,6),:);
        dat = [total_tri(j,1),total_tri(j,4),total_tri(j,7)];
        dat_a = fedgenorm(j,:);
        %sam为直线上一点，sam_u为直线方向矢量,dat为平面上一点，dat_a为法向矢量
        sec = intersection_computing_2(sam,sam_u,dat,dat_a);%这里求出交点
        aa = sec-total_tri(j,1:3:7);
        bb = sec-total_tri(j,2:3:8);
        cc = sec-total_tri(j,3:3:9);
        cro1 = cross(aa,bb);
        cro2 = cross(bb,cc);
        cro3 = cross(cc,aa);
        if(sqrt((total_sec(i,1)-sec(1))^2+(total_sec(i,2)-sec(2))^2+(total_sec(i,3)-sec(3))^2)<0.01)
            continue
        end
        if ((cro1*cro2')*(cro2*cro3')>0 && (cro1*cro2')*(cro1*cro3')>0 && (cro2*cro3')*(cro1*cro3')>0)
            %             plot3(sec(1),sec(2),sec(3),'.','Markersize',10,'color','b');
            total_secref = [total_secref;sec,i,sqrt((total_sec(i,1)-sec(1))^2+(total_sec(i,2)-sec(2))^2+(total_sec(i,3)-sec(3))^2),j];
        end
        
    end
    %     line([total_sec(i,1),total_sec(i,1)+5*nref(total_sec(i,6),1)],...
    %              [total_sec(i,2),total_sec(i,2)+5*nref(total_sec(i,6),2)],[total_sec(i,3),total_sec(i,3)+5*nref(total_sec(i,6),3)],'color','y','linewidth',0.1);
end

% 判别入射点和反射点在入射面同侧
total_secref1 = [];
for i = 1:size(total_secref,1)
    %平面上一点
    num_sec = total_secref(i,4);
    P = total_tri(total_sec(num_sec,6),1:3:7);
    %入射线上一点
    T = total_sec(num_sec,1:3)-2*ndir;
    %反射线上一点
    R = total_secref(i,1:3);
    TP = T-P;
    RP = R-P;
    N = fedgenorm(total_sec(num_sec,6),:);
    if(dot(RP,N)>0)
        total_secref1 = [total_secref1;total_secref(i,:)];
    end
end

total_secref = total_secref1;
total_secref = sortrows(total_secref,5);
[usec1,usec2] = unique(total_secref(:,4),'rows');
total_secref = total_secref(usec2,:);
