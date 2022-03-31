load('total_tri.mat');
load('broadleaf.mat');
load('total_sec_a60.mat');
hold on
for i = 1:size(total_sec,1)
    total_sec(i,7) = total_tri(total_sec(i,6),10);
end

cc = tabulate(total_sec(:,4));
aa = find(cc(:,2)>1);
total_sec1 = [];
for i = 1:size(aa,1)
    x = find(total_sec(:,4) == aa(i));
    total_sec1 = [total_sec1;total_sec(x,:)];
end
total_sec1 = sortrows(total_sec1,[4 5]);
refract_c = [total_sec1(:,4),total_sec1(:,7)];
[~,n] = unique(refract_c(:,1));
total_refract1 = [];
for i = 1:size(n,1)-1
    if (n(i+1)-n(i) == 2 && refract_c(n(i),2) ~= refract_c(n(i)+1,2))
       total_refract1 = [total_refract1;total_sec1(n(i)+1,:)];
    end
end
% total_sec1(total_refract(:,4),:) = [];

total_refract2 = [];
for i = 1:size(n,1)-1
    if (n(i+1)-n(i) > 2 && refract_c(n(i),2) == refract_c(n(i)+1,2) && refract_c(n(i)+1,2) ~= refract_c(n(i)+2,2))
       total_refract2 = [total_refract2;total_sec1(n(i)+2,:)];
    end
end

total_refract3 = [];
for i = 1:size(n,1)-1
    if (n(i+1)-n(i) > 2 && refract_c(n(i),2) ~= refract_c(n(i)+1,2))
       total_refract2 = [total_refract2;total_sec1(n(i)+1,:)];
    end
end

total_refract = [total_refract1;total_refract2;total_refract3];
for i = 1:size(total_refract,1)
    plot3(total_refract(i,1),total_refract(i,2),total_refract(i,3),'.','Markersize',10,'color','b');
end

