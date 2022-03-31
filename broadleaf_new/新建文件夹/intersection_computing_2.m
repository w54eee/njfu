function sec = intersection_computing_2(sam,sam_u,dat,dat_a)
    % ����ռ�ֱ����ռ�ƽ��Ľ���
    % samΪֱ����һ�㣬sam_uΪֱ�߷���ʸ��,datΪƽ����һ�㣬dat_aΪ����ʸ��
    % AUTHOR: Y.F.Wu (yfwu@zju.edu.cn)
    sx = sam(1); %x0
    sy = sam(2); %y0
    sz = sam(3); %z0
    ux = sam_u(1); %A
    uy = sam_u(2); %B
    uz = sam_u(3); %C
    dx = dat(1); %x1
    dy = dat(2); %x2
    dz = dat(3); %x3
    ax = dat_a(1); %Nx
    ay = dat_a(2); %Ny
    az = dat_a(3); %Nz
    F = ax*ux+ay*uy+az*uz;
    if F ~= 0
       sec(1,1) = (sx*(ay*uy+az*uz)+ux*(ax*dx+ay*(dy-sy)+az*(dz-sz)))/F;
       sec(1,2) = (sy*(ax*ux+az*uz)+uy*(ay*dy+ax*(dx-sx)+az*(dz-sz)))/F;
       sec(1,3) = (sz*(ax*ux+ay*uy)+uz*(az*dz+ax*(dx-sx)+ay*(dy-sy)))/F;
    else
       fprintf('ֱ����ƽ��ƽ�У��޽��㣬���д���')
       return;
    end
end