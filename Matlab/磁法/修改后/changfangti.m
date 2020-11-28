clear all;

u0 = 4*pi*10^2;
h = 100;  %������������
R = 50;
V = (4/3)*pi*(R^3);  %����1���
M = 40;  %��λΪ nT 
m = M*V ;  %����Ĵž�
i = pi/2;  %�Ż����
dealtal = 0;  %x����������Ż�����ˮƽ�����ļн�
I0 =  pi/2;  %�شų����
A1 = 0;  %x��������UI�شų�������ļнǣ���x�����汱����һ��ʱ��A��Ϊ�شų���ƫ��
kesai = [100,120];
yita = [100,120];
seita = [100,120];
cosas = cos(i) * cos(dealtal);
cosbs = cos(i) *sin(dealtal);
cosrs = sin(i);

Hax = 0;
Hax2 = 0;
Hax3 = 0;
Hay = 0;
Hay2 = 0;
Hay3 = 0;
Za = 0;
Za2 = 0;
Za3 = 0;
dT = 0;
dT2 = 0;
dT3 = 0;
X = -200:2:400;
Y = -200:2:400;
z = 0;
[x,y] = meshgrid(X,Y);

for i = 1:2
    Hax = Hax2 - Hax;
    Hay = Hay2 - Hay;
    Za = Za2 - Za;
    dT = dT2 - dT;
    for j = 1:2
        Hax2 = Hax2 - Hax3;
        Hay2 = Hay2 - Hay3;
        Za2 = Za2 - Za3;
        dT2 = dT2 - dT3;
        for k = 1:2
            r = ( (x- kesai(i)).^2 + (y - yita(j)).^2 + (z - seita(k))^2 ).^0.5 ;
            Hax3 = -u0*M / (4*pi) * (cosas *( atan( (y-yita(i)) .* (z- seita(j) )./ ( (x-kesai(k) ) .* r ) ))...
                - cosbs * (log( r + seita(1) - seita(2) )) - cosrs * (log( r + yita(1) - yita(2) ))) - Hax3;
            Hay3 = -u0*M / (4*pi) * (cosas *(log( r + seita(2) - seita(1) ) ) )+ cosbs * (atan( (y-yita(i))...
                .* (z- seita(j) )./ ( (x-kesai(k) ) .* r ) ) - cosrs * (log( r + kesai(1) - kesai(2) ))) - Hay3;
            Za3 = -u0*M / (4*pi) * ( -cosas * log(r + yita(1) - yita(2)) - cosbs * log(r + kesai(1) - kesai(2)) ...
                + cosrs*atan( (y-yita(i)) .* (z- seita(j) )./ ( (x-kesai(k) ) .* r ) )) ;
            dT3 = -(Hax3 * cosas + Hay3 * cosbs + Za3 * cosrs) - dT3;
        end
    end
end

figure(1)
contour(Hax)
title('������Hax');
xlabel('x����');
ylabel('y����');
axis equal;
figure(2)
contour(Hay)
title('������Hay');
xlabel('x����');
ylabel('y����');
axis equal;
figure(3)
contour(Za)
title('������Za');
xlabel('x����');
ylabel('y����');
axis equal;
figure(4)
contour(dT)
title('������dT');
xlabel('x����');
ylabel('y����');
axis equal;
% figure(1)
% mesh(Hax)
% figure(2)
% mesh(Hay)
% figure(3)
% mesh(Za)
% figure(4)
% mesh(dT)

