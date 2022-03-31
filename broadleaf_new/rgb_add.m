rgb1 = [];
for i = 1:size(rgb,1)-1
    rgb1 = [rgb1;rgb(i,:)+(rgb(i+1,:)-rgb(i,:))/2];
end
newrgb = [];

for i = 1:size(rgb,1)-1
        newrgb = [newrgb;rgb(i,:);rgb1(i,:)];
end