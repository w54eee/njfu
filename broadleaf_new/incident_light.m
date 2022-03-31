clear;
clc;
load('chushi5.mat');%鍔犺浇鍒濆鐐硅寖鍥?
load('total_tri.mat');%鍔犺浇鏋�?垎涓夎闈㈢墖鏁版嵁
load('ndir.mat');
load('total_sec5.mat')

v1 = ndir(1);
v2 = ndir(2);
v3 = ndir(3);

fedge(size(total_tri,1),3) = 0;%姣忎釜涓夎褰㈠钩闈㈢殑娉曞悜閲?
for i = 1:size(total_tri,1)
    edge1 = [total_tri(i,2)-total_tri(i,1),total_tri(i,5)-total_tri(i,4),total_tri(i,8)-total_tri(i,7)];
    edge2 = [total_tri(i,3)-total_tri(i,1),total_tri(i,6)-total_tri(i,4),total_tri(i,9)-total_tri(i,7)];
    fedge(i,:) = cross(edge2,edge1);
end

fedgenorm(size(fedge,1),3) = 0;
for i = 1:size(fedge,1)
    fedgenorm(i,:) = fedge(i,:)/norm(fedge(i,:));
end

load('broadleaf.mat');
num = 15;
hold on;
shuganc = [0.7 0.5 0.04];
total_tri = [];
for i = 1:size(Ubranch,1)
    [x,y,z] = ellipsoid(x1(i),y1(i),Ubranch(i),0.5*EW(i),0.5*SN(i),(Height(i)-Ubranch(i)),num);
    [x0,y0] = find(z>=Ubranch(i));
%    surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
    tri = delaunay(x(x0,y0),y(x0,y0));
     h = trimesh(tri,x(x0,y0),y(x0,y0),z(x0,y0));
    x = x(x0,y0);
    y = y(x0,y0);
    z = z(x0,y0);
    total_tri1=[];
    for j = 1:size(tri,1)
        A = [x(tri(j,1)),x(tri(j,2)),x(tri(j,3))];
        B = [y(tri(j,1)),y(tri(j,2)),y(tri(j,3))];
        C = [z(tri(j,1)),z(tri(j,2)),z(tri(j,3))];
        total_tri1 = [total_tri1;A,B,C];
    end
    total_tri = [total_tri;total_tri1];
    [u,v,w] = cylinder(0.5);
    u = u+x1(i);
    v = v+y1(i);
    w = w*(Ubranch(i)+2);
    shugan = mesh(u,v,w);
    set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)
end
axis equal

% 画入射线
x0 = (chushi(1):1:chushi(2))';
y0 = (chushi(3):1:chushi(4))';
z0 = 30;
chushi1(size(x0,1)*size(y0,1),3) = 0;

for m=1:size(x0,1)
    for n=1:size(y0,1)
        chushi1((m-1)*size(y0,1)+n,:)=[x0(m) y0(n) z0];
    end
end

AA(2*size(chushi1,1),3)=0;
for i = 1:size(chushi1,1)   %这里的循环是按照初始点和直线方程生成直线
    z = (0:30:30);  %中间的数值控制直线精�?
    x = ndir(1)/ndir(3).*(z-z0)+chushi1(i,1);
    y = ndir(2)/ndir(3).*(z-z0)+chushi1(i,2);
    K = [x' y' z'];
    AA(2*i-1:2*i,:) =K;
end

% for i = 1:size(total_sec,1)
% %     quiver3(AA(2*total_sec(i,4),1),AA(2*total_sec(i,4),2),AA(2*total_sec(i,4),3)...
% %         ,8*ndir(1),8*ndir(2),8*ndir(3),'color','b','MaxHeadSize',1,'Linewidth',1);
%     line([total_sec(i,1),AA(2*total_sec(i,4),1)],[total_sec(i,2),AA(2*total_sec(i,4),2)],[total_sec(i,3),AA(2*total_sec(i,4),3)],'color','b','linewidth',0.1);
% end

for i = 1:size(total_sec,1)
    dis = total_sec(i,5);
    quiver3(AA(2*total_sec(i,4),1),AA(2*total_sec(i,4),2),AA(2*total_sec(i,4),3)...
        ,dis*ndir(1),dis*ndir(2)...
        ,dis*ndir(3),'color','b','MaxHeadSize',0.2,'Linewidth',1,'AutoScale','off');
%     line([total_sec(i,1),AA(2*total_sec(i,4),1)],[total_sec(i,2),AA(2*total_sec(i,4),2)],[total_sec(i,3),AA(2*total_sec(i,4),3)],'color','y','linewidth',1);]
end
view(43,30);
axis equal;
xlabel('x');ylabel('y');zlabel('z');