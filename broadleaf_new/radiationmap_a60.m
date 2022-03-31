clear;
clc;
load('total_tri.mat');
load('ndir_a60.mat');
load('chushi_a60.mat');
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

x0 = (chushi(1):0.2:chushi(2))';
y0 = (chushi(3):0.2:chushi(4))';
z0 = 100;
chushi1(size(x0,1)*size(y0,1),3) = 0;

for m=1:size(x0,1)
    for n=1:size(y0,1)
        chushi1((m-1)*size(y0,1)+n,:)=[x0(m) y0(n) z0];
    end
end

AA(2*size(chushi1,1),3)=0;
for i = 1:size(chushi1,1)   %这里的循环是按照初始点和直线方程生成直线
    z = (0:100:100);  %中间的数值控制直线精度
    x = ndir(1)/ndir(3).*(z-z0)+chushi1(i,1);
    y = ndir(2)/ndir(3).*(z-z0)+chushi1(i,2);
    K = [x' y' z'];
    AA(2*i-1:2*i,:) =K;
end

total_sec = [];
for i = 1:2:size(AA,1)
    i
    for j = 1:size(fedge,1)
        sam = AA(i,:);
        sam_u = AA(i+1,:)-AA(i,:);
        dat = [total_tri(j,1),total_tri(j,4),total_tri(j,7)];
        dat_a = fedge(j,:);
        %sam为直线上一点，sam_u为直线方向矢量,dat为平面上一点，dat_a为法向矢量
        sec = intersection_computing_2(sam,sam_u,dat,dat_a);%这里求出交点
        aa = sec-total_tri(j,1:3:7);
        bb = sec-total_tri(j,2:3:8);
        cc = sec-total_tri(j,3:3:9);
        cro1 = cross(aa,bb);
        cro2 = cross(bb,cc);
        cro3 = cross(cc,aa);
        if ((cro1*cro2')*(cro2*cro3')>0 && (cro1*cro2')*(cro1*cro3')>0 && (cro2*cro3')*(cro1*cro3')>0)
%                          plot3(sec(1),sec(2),sec(3),'.','Markersize',10,'color','b');
            total_sec =[total_sec;sec,(i+1)/2,sqrt((AA(i+1,1)-sec(1))^2+(AA(i+1,2)-sec(2))^2+(AA(i+1,3)-sec(3))^2),j,total_tri(j,10)];
        end
    end
end

total_sec = sortrows(total_sec,5);
[usec1,usec2] = unique(total_sec(:,4),'rows');
total_sec = total_sec(usec2,:);