c1 = [159 196 231];
c2 = [170 203 233];
c3 = [209 227 243];
c4 = [241 246 254];
c5 = [255 255 255];
c6 = [167 227 194];
c7 = [112 210 157];
c8 = [10 179 87];

rgb = [c1;c2;c3;c4;c5;c6;c7;c8];
rgb_add = [];
num = 1060;
for i = 1:size(rgb,1)-1
    rgb_add1 = [];
    for j = 1:num-1
        rgb_add_part = rgb(i,:)+j*(rgb(i+1,:)-rgb(i,:))/num;
        rgb_add1 = [rgb_add1;rgb_add_part];
    end
    rgb_add = [rgb_add;rgb(i,:);rgb_add1];
end
rgb = rgb_add;