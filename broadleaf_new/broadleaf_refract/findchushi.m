clear;
clc;
load('total_tri.mat');
load('ndir.mat');
fedge(size(total_tri,1),3) = 0;%ÿ��������ƽ��ķ�����
for i = 1:size(total_tri,1)
    edge1 = [total_tri(i,2)-total_tri(i,1),total_tri(i,5)-total_tri(i,4),total_tri(i,8)-total_tri(i,7)];
    edge2 = [total_tri(i,3)-total_tri(i,1),total_tri(i,6)-total_tri(i,4),total_tri(i,9)-total_tri(i,7)];
    fedge(i,:) = cross(edge2,edge1);
end
fedgenorm(size(fedge,1),3) = 0;
for i = 1:size(fedge,1)
    fedgenorm(i,:) = fedge(i,:)/norm(fedge(i,:));
end
total_sec = [];
for i = 1:size(total_tri,1)
    sam = [total_tri(i,1),total_tri(i,4),total_tri(i,7)];
    sam_u = ndir;
    dat = [0,0,30];
    dat_a = [0 0 1];
    %samΪֱ����һ�㣬sam_uΪֱ�߷���ʸ��,datΪƽ����һ�㣬dat_aΪ����ʸ��
    sec = intersection_computing_2(sam,sam_u,dat,dat_a);%�����������
    total_sec = [total_sec;sec(:,1:2)];
end
chushi = [min(total_sec(:,1)),max(total_sec(:,1)),min(total_sec(:,2)),max(total_sec(:,2))];
