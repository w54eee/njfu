
A = [sqrt(1/2),0,sqrt(1/2)];
a = [5.8,5,7.2];
b = [4,5.6,6.8];
c = [22,12,21];
dis = [-1,0,1.5];
num = 40;

[x,y,z] = ellipsoid(3.4,0,10,3.4,2,10,num);
[x0,y0] = find(z>=10);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
hold on ;
[u,v,w] = cylinder(0.5);
u = u+a(1)/2;
w = w*c(1)/2;
shugan = mesh(u,v,w);
shuganc = [0.7 0.5 0.04];
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

% aa = 3.4;
% aaa = [];
% for i = 1:size(a,2)
%     aa = aa + a(i)/2 + dis(i);
%     aaa = [aaa;aa];
% end
% 
% for i = 1:size(a,2)
%     [x,y,z] = ellipsoid(3.4+a(i)/2+dis(i),0,10,a(i)/2,b(i)/2,c(i)/2,70);
%     [x0,y0] = find(z>=c(1)/2);
%     surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
%     hold on ;
%     [u,v,w] = cylinder(0.5);
%     u = u+a(i)/2;
%     w = w*c(i)/2;
%     shugan = mesh(u,v,w);
%     shuganc = [0.7 0.5 0.04];
%     set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc) 
% end

%第一行
[x,y,z] = ellipsoid(8.7,0,11,2.9,2.1,11,num);
[x0,y0] = find(z>=11);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+8.7;
w = w*11;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

r = 0:0.01:2.6;
[u,v,w] = cylinder(r,80);
u = u+14.1;
w = 12-w*6;
% mesh(u,v,w);
[u,v,w] = cylinder(0.3);
u = u+14.1;
w = w*6;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(20.2,0,10,3.6,3.4,10,num);
[x0,y0] = find(z>=10);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+20.2;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

r = 0:0.01:2.45;
[u,v,w] = cylinder(r,80);
u = u+28.4;
w = 18-w*9;
% mesh(u,v,w);
[u,v,w] = cylinder(0.5);
u = u+28.4;
w = w*9;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(32.4,0,10,3.4,2.5,10,num);
[x0,y0] = find(z>=10);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+32.4;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(40.2,0,7,2.4,2.1,7,num);
[x0,y0] = find(z>=7);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.3);
u = u+40.2;
w = w*7;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

r = 0:0.01:2.6;
[u,v,w] = cylinder(r,80);
u = u+45.1;
w = 16-w*8;
% mesh(u,v,w);
[u,v,w] = cylinder(0.4);
u = u+45.1;
w = w*8;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)


%第二行
y2 = 5;
[x,y,z] = ellipsoid(2.5,y2,7,2.5,2.9,7,num);
[x0,y0] = find(z>=7);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.3);
u = u+2.5;
v = v+y2;
w = w*7;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(10.5,y2,11,3.5,3.4,11,num);
[x0,y0] = find(z>=11);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+10.5;
v = v+y2;
w = w*11;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(17.4,y2,9,3.4,3.6,9,num);
[x0,y0] = find(z>=9);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+17.4;
v = v+y2;
w = w*9;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)



r = 0:0.01:3.45;
[u,v,w] = cylinder(r,80);
u = u+22.3;
v = v+y2;
w = 20-w*10;
% mesh(u,v,w);
[u,v,w] = cylinder(0.5);
u = u+22.3;
v = v+y2;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

r = 0:0.01:2.5;
[u,v,w] = cylinder(r,80);
u = u+29.2;
v = v+y2;
w = 14-w*7;
% mesh(u,v,w);
[u,v,w] = cylinder(0.3);
u = u+29.2;
v = v+y2;
w = w*7;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(34.1,y2,8,2.5,2.5,8,num);
[x0,y0] = find(z>=8);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.4);
u = u+34.1;
v = v+y2;
w = w*8;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(38.6,y2,12,4,3.5,12,num);
[x0,y0] = find(z>=12);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.6);
u = u+38.6;
v = v+y2;
w = w*12;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

r = 0:0.01:3.5;
[u,v,w] = cylinder(r,80);
u = u+46.2;
v = v+y2;
w = 20-w*10;
% mesh(u,v,w);
[u,v,w] = cylinder(0.5);
u = u+46.2;
v = v+y2;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

%第三行
y3 = 10;
[x,y,z] = ellipsoid(3,y3,9,3,3,9,num);
[x0,y0] = find(z>=9);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+3;
v = v+y3;
w = w*9;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(6.9,y3,8,2.9,3.1,8,num);
[x0,y0] = find(z>=8);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.4);
u = u+6.9;
v = v+y3;
w = w*8;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(13.2,y3,6,2.4,2.1,6,num);
[x0,y0] = find(z>=6);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.3);
u = u+13.2;
v = v+y3;
w = w*6;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

r = 0:0.01:2.9;
[u,v,w] = cylinder(r,80);
u = u+18.7;
v = v+y3;
w = 14-w*7;
% mesh(u,v,w);
[u,v,w] = cylinder(0.4);
u = u+18.7;
v = v+y3;
w = w*7;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(27.6,y3,10,3.8,3.5,10,num);
[x0,y0] = find(z>=10);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+27.6;
v = v+y3;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)


r = 0:0.01:3.35;
[u,v,w] = cylinder(r,80);
u = u+34.9;
v = v+y3;
w = 20-w*10;
% mesh(u,v,w);
[u,v,w] = cylinder(0.5);
u = u+34.9;
v = v+y3;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(41.9,y3,8,2.5,2.4,8,num);
[x0,y0] = find(z>=8);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.4);
u = u+41.9;
v = v+y3;
w = w*8;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(45.9,y3,11,3.5,4,11,num);
[x0,y0] = find(z>=11);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+45.9;
v = v+y3;
w = w*11;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

%第四行
y4 = 15;
r = 0:0.01:2.75;
[u,v,w] = cylinder(r,80);
u = u+2.5;
v = v+y4;
w = 22-w*11;
% mesh(u,v,w);
[u,v,w] = cylinder(0.5);
u = u+2.5;
v = v+y4;
w = w*11;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(8,y4,10,3,2.5,10,num);
[x0,y0] = find(z>=10);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+8;
v = v+y4;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(8,y4,10,3,2.5,10,num);
[x0,y0] = find(z>=10);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+8;
v = v+y4;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(11,y4,8,2,2.5,8,num);
[x0,y0] = find(z>=8);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.4);
u = u+11;
v = v+y4;
w = w*8;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

r = 0:0.01:3.95;
[u,v,w] = cylinder(r,80);
u = u+19;
v = v+y4;
w = 24-w*12;
% mesh(u,v,w);
[u,v,w] = cylinder(0.6);
u = u+19;
v = v+y4;
w = w*12;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(28.4,y4,10,2.6,2.3,10,num);
[x0,y0] = find(z>=10);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+28.4;
v = v+y4;
w = w*10;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(32.4,y4,10,3.4,2.5,11,num);
[x0,y0] = find(z>=11);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.5);
u = u+32.4;
v = v+y4;
w = w*11;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(40.2,y4,7,2.4,2.1,7,num);
[x0,y0] = find(z>=7);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.3);
u = u+40.2;
v = v+y4;
w = w*7;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)

[x,y,z] = ellipsoid(45.1,y4,9,2.5,2.7,9,num);
[x0,y0] = find(z>=9);
% surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
[u,v,w] = cylinder(0.4);
u = u+45.1;
v = v+y4;
w = w*9;
shugan = mesh(u,v,w);
set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)


xlabel('x');ylabel('y');zlabel('z');
axis([0 50 -5 20 0 30]);
axis equal;
grid off;

