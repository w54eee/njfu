
load('total_tri.mat');
load('ndir.mat');
load('chushi.mat');
load('total_sec119.mat');
hold on;
for i = 1:size(total_sec,1)
    plot3(total_sec(i,1),total_sec(i,2),total_sec(i,3),'.','Markersize',10,'color','b');
end