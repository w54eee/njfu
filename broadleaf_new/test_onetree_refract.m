load('total_tri.mat');
load('test_chushi.mat');
load('ndir.mat');
load('test_total_sec');
total_tri = total_tri(1:195,:);
hold on;
for i = 1:size(total_tri,1)
    patch(total_tri(i,1:3),total_tri(i,4:6),total_tri(i,7:9),[69 149 176]./255);
end

v1 = ndir(1);
v2 = ndir(2);
v3 = ndir(3);

fedge(size(total_tri,1),3) = 0;%每个三角形平面的法向�?
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
e = 1/1.5;
nrefract(size(fedge,1),3) = 0;
for i = 1:size(fedgenorm,1)
    k = 1-e*e*(1-dot(fedgenorm(i,:),ndir)*dot(fedgenorm(i,:),ndir));
    if(k<0)
        nrefract(i,:)=[0 0 0];
    else
        nrefract(i,:) = e*ndir-(e*dot(fedgenorm(i,:),ndir)+sqrt(k))*fedgenorm(i,:);
    end
end

total_secrefract = [];
num = 1;
for i = 1:size(total_sec,1)
    i
    for j = 1:size(fedge,1)
        sam = total_sec(i,1:3)+10*nrefract(total_sec(i,6),:);
        sam_u = nrefract(total_sec(i,6),:);
        dat = [total_tri(j,1),total_tri(j,4),total_tri(j,7)];
        dat_a = fedgenorm(j,:);
        %sam为直线上�?点，sam_u为直线方向矢�?,dat为平面上�?点，dat_a为法向矢�?
        sec = intersection_computing_2(sam,sam_u,dat,dat_a);%这里求出交点
        aa = sec-total_tri(j,1:3:7);
        bb = sec-total_tri(j,2:3:8);
        cc = sec-total_tri(j,3:3:9);
        cro1 = cross(aa,bb);
        cro2 = cross(bb,cc);
        cro3 = cross(cc,aa);
        if(sqrt((total_sec(i,1)-sec(1))^2+(total_sec(i,2)-sec(2))^2+(total_sec(i,3)-sec(3))^2)<0.5)
            continue
        end
        if ((cro1*cro2')*(cro2*cro3')>0 && (cro1*cro2')*(cro1*cro3')>0 && (cro2*cro3')*(cro1*cro3')>0)
            %             plot3(sec(1),sec(2),sec(3),'.','Markersize',10,'color','b');
            total_secrefract = [total_secrefract;sec,i,sqrt((total_sec(i,1)-sec(1))^2+(total_sec(i,2)-sec(2))^2+(total_sec(i,3)-sec(3))^2),j];
        end
        
    end
    %     line([total_sec(i,1),total_sec(i,1)+5*nref(total_sec(i,6),1)],...
    %              [total_sec(i,2),total_sec(i,2)+5*nref(total_sec(i,6),2)],[total_sec(i,3),total_sec(i,3)+5*nref(total_sec(i,6),3)],'color','y','linewidth',0.1);
end

total_secrefract1 = [];
for i = 1:size(total_secrefract,1)
    %平面上一�?
    num_sec = total_secrefract(i,4);
    P = total_tri(total_sec(num_sec,6),1:3:7);
    %入射线上�?�?
    T = total_sec(num_sec,1:3)-2*ndir;
    %折射线上�?�?
    R = total_secrefract(i,1:3);
    TP = T-P;
    RP = R-P;
    N = fedgenorm(total_sec(num_sec,6),:);
    if(dot(RP,N)<0)
        total_secrefract1 = [total_secrefract1;total_secrefract(i,:)];
    end
end
total_secrefract = total_secrefract1;
total_secrefract = sortrows(total_secrefract,5);
[usec1,usec2] = unique(total_secrefract(:,4),'rows');
total_secrefract = total_secrefract(usec2,:);