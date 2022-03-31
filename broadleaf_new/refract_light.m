clear;
clc;
load('chushi5.mat');%鍔犺浇鍒濆鐐硅寖鍥?
load('total_tri.mat');%鍔犺浇鏋�?垎涓夎闈㈢墖鏁版嵁
load('ndir.mat');
load('total_sec7.mat')

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
load('total_secrefract7.mat');

% for i = 1:size(total_sec,1)
%     quiver3(total_sec(i,1),total_sec(i,2),total_sec(i,3)...
%         ,2*nrefract(total_sec(i,6),1),2*nrefract(total_sec(i,6),2)...
%         ,2*nrefract(total_sec(i,6),3),'color','b','MaxHeadSize',1,'Linewidth',1);
% %     line([total_sec(i,1),AA(2*total_sec(i,4),1)],[total_sec(i,2),AA(2*total_sec(i,4),2)],[total_sec(i,3),AA(2*total_sec(i,4),3)],'color','y','linewidth',1);]
% end

hold on;
% for i = 1:size(total_sec,1)
%     quiver3(total_sec(i,1),total_sec(i,2),total_sec(i,3)...
%         ,3*nrefract(total_sec(i,6),1),3*nrefract(total_sec(i,6),2)...
%         ,3*nrefract(total_sec(i,6),3),'color','b','MaxHeadSize',1,'Linewidth',1);
% %     line([total_sec(i,1),AA(2*total_sec(i,4),1)],[total_sec(i,2),AA(2*total_sec(i,4),2)],[total_sec(i,3),AA(2*total_sec(i,4),3)],'color','y','linewidth',1);]
% end

for i = 1:size(total_secrefract,1)
    numsec = total_secrefract(i,4);
    dis = total_secrefract(i,5);
    quiver3(total_sec(numsec,1),total_sec(numsec,2),total_sec(numsec,3)...
        ,dis*nrefract(total_sec(numsec,6),1),dis*nrefract(total_sec(numsec,6),2)...
        ,dis*nrefract(total_sec(numsec,6),3),'color','b','MaxHeadSize',0.3,'Linewidth',1);
%     line([total_sec(i,1),AA(2*total_sec(i,4),1)],[total_sec(i,2),AA(2*total_sec(i,4),2)],[total_sec(i,3),AA(2*total_sec(i,4),3)],'color','y','linewidth',1);]
end
alpha(0.2);
view(43,30);
axis equal;
xlabel('x');ylabel('y');zlabel('z');