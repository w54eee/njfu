clear;
clc;
load('chushi.mat');%鍔犺浇鍒濆鐐硅寖鍥?
load('total_tri.mat');%鍔犺浇鏋楀垎涓夎闈㈢墖鏁版嵁
load('ndir.mat');
load('total_sec.mat')

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

incidentcal = [];%[闈㈢墖缂栧彿锛岄潰鐗囨硶鍚戦噺锛屽叆灏勭嚎缂栧彿锛屽叆灏勭嚎鍚戦噺锛岄潰鐗囨硶鍚戦噺鍜屽叆灏勭嚎娉曞悜閲廲os]

for i = 1:size(total_sec,1)
    dot1 = -fedgenorm(total_sec(i,6),:);
    dot2 = -ndir;
    cosincident = abs(dot(dot1,dot2)/(norm(dot1)*norm(dot2)));
    sinincident = sqrt(1-(cosincident)^2);
    incidentcal = [incidentcal;total_sec(i,6),dot1,total_sec(i,4),dot2,sinincident];
end
total_sec = real(total_sec);

incidentcal = sortrows(incidentcal,1);
nn = tabulate(total_sec(:,6));
% for i = size(nn,1):size(total_tri,1)
% 	nn(i,:) = [i 0 0];
% end
num_trion = find(nn(:,3)~=0);
num_trioff = find(nn(:,3)==0);
incident_broadleaf = [];
for i = 1:size(num_trion,1)
    ii = find(incidentcal(:,1) == num_trion(i));
    incident_broadleaf = [incident_broadleaf;num_trion(i),sum(incidentcal(ii,9))];
end
total_energy = sum(incident_broadleaf(:,2));
incident_energy = total_energy;

for i = 1:size(num_trioff,1)
     pattri = patch(total_tri(num_trioff(i),1:3),total_tri(num_trioff(i),4:6),total_tri(num_trioff(i),7:9),[69 149 176]./255);
     set(pattri,'EdgeColor',[69 149 176]./255)
end
hold on
unique_energy = unique(incident_broadleaf(:,2));
uuu = [];
for i = 1:size(incident_broadleaf,1)
    uu = find(incident_broadleaf(i,2)==unique_energy);
    uuu = [uuu;uu];
end
incident_broadleaf(:,3) = uuu;


load('rgb9072.mat');

for i = 1:size(incident_broadleaf,1)
    pattri = patch(total_tri(incident_broadleaf(i,1),1:3),total_tri(incident_broadleaf(i,1),4:6),total_tri(incident_broadleaf(i,1),7:9),rgb(length(rgb)+1-incident_broadleaf(i,3),:)./255);
    set(pattri,'EdgeColor',rgb(length(rgb)+1-incident_broadleaf(i,3),:)./255)
end


load('broadleaf.mat');
num = 15;
hold on;
shuganc = [0.7 0.5 0.04];
total_tri = [];
for i = 1:size(Ubranch,1)
    [u,v,w] = cylinder(0.5);
    u = u+x1(i);
    v = v+y1(i);
    w = w*(Ubranch(i)+2);
    shugan = mesh(u,v,w);
    set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)
end

% % 画入射线
% x0 = (chushi(1):0.2:chushi(2))';
% y0 = (chushi(3):0.2:chushi(4))';
% z0 = 100;
% chushi1(size(x0,1)*size(y0,1),3) = 0;
% 
% for m=1:size(x0,1)
%     for n=1:size(y0,1)
%         chushi1((m-1)*size(y0,1)+n,:)=[x0(m) y0(n) z0];
%     end
% end
% 
% AA(2*size(chushi1,1),3)=0;
% for i = 1:size(chushi1,1)   %这里的循环是按照初始点和直线方程生成直线
%     z = (0:100:100);  %中间的数值控制直线精度
%     x = ndir(1)/ndir(3).*(z-z0)+chushi1(i,1);
%     y = ndir(2)/ndir(3).*(z-z0)+chushi1(i,2);
%     K = [x' y' z'];
%     AA(2*i-1:2*i,:) =K;
% end
% for i = 1:size(total_sec,1)
%     line([total_sec(i,1),AA(2*total_sec(i,4),1)],...
%          [total_sec(i,2),AA(2*total_sec(i,4),2)],...
%          [total_sec(i,3),AA(2*total_sec(i,4),3)],...
%          'color','y','linewidth',0.1);
% end

axis equal;
xlabel('x');
ylabel('y');
zlabel('z');