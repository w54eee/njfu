load('broadleaf.mat');
num = 15;
hold on;
shuganc = [0.7 0.5 0.04];
total_tri = [];
for i = 1:size(Ubranch,1)
    [x,y,z] = ellipsoid(x1(i),y1(i),Ubranch(i),0.5*EW(i),0.5*SN(i),(Height(i)-Ubranch(i)),num);
    [x0,y0] = find(z>=Ubranch(i));
%     surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
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
% for i = 1:size(total_tri,1)
%     patch(total_tri(i,1:3),total_tri(i,4:6),total_tri(i,7:9),[0 0 1]);
% end