hold on;
load('total_tri1.mat');%画树冠
for i = 1:size(total_tri,1)
    Xc = total_tri(i,1:3);
    Yc = total_tri(i,4:6);
    Zc = total_tri(i,7:9);
    patch(Xc,Yc,Zc,[152 251 152]./255);
end

%画地面
Xg = [0,0,51,51] ;
Yg = [-1,51,51,-1] ;
Zg = [0 0 0 0];
patch(Xg,Yg,Zg,[193 210 240]./255);
axis equal
view(56.2106,80.35);
axis([0 51 -1 51])
xlabel('x');
ylabel('y');
zlabel('z');