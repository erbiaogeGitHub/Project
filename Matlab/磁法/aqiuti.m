clear all;

u0 = 4*pi*10^2;   % ��λΪ nT
h = 1000;  %������������
R = 500;
V = (4/3)*pi*(R^3);  %����1���
M = 100e9;  %��λΪ nT 
I0 =  pi/2;  %�شų����
A1 = 0;  %x��������شų�������ļнǣ���x�����汱����һ��ʱ��A��Ϊ�شų���ƫ��
m = M*V ;  %����Ĵž�
i = I0;  %�Ż����
dealtal = A1;  %x����������Ż�����ˮƽ�����ļн�

A = 2* cos(i) * cos(dealtal) * cos(I0) * cos(A1) - cos(i) * sin(dealtal) * cos(I0) * sin(A1) - sin(i) * sin(I0);
B = 2*cos(i) * sin(dealtal) * cos(I0) * sin(A1) - cos(i) * cos(dealtal) * cos(I0) * cos(A1) - sin(i) * sin(I0);
C = 3*(cos(i) * sin(dealtal) * cos(I0) * cos(A1) + cos(i) * cos(dealtal) * cos(I0) * sin(A1));
D = -3*( sin(i) * cos(I0) * cos(A1) + cos(i) * cos(dealtal) * sin(I0) )*h;
E = -3*( sin(i) * cos(I0) * sin(A1) + cos(i) * sin(dealtal) * sin(I0) )*h;
F = ( 2*sin(i) * sin(I0) - cos(i) * cos(dealtal) * cos(I0) * cos(A1) - cos(i) * sin(dealtal) * cos(I0) * sin(A1) )*h^2;

X = -100000:1000:100000;
Y = -100000:1000:100000;
[x,y] = meshgrid(X,Y);


Hax = u0*m ./ (4*pi*(x.^2+y.^2+h.^2) ^ (5/2)) * ((2*x.^2 - y.^2-h.^2)* cos(i) * cos(dealtal) + 3.*x.*y.* cos(i) * sin(dealtal) - 3.*x.*h * sin(i));
Hay = u0*m ./ (4*pi*(x.^2+y.^2+h.^2) ^ (5/2)) * ((2*y.^2 - x.^2-h.^2)* cos(i) * sin(dealtal) + 3.*x.*y.*cos(i)*cos(dealtal) - 3.*y.*h * sin(i));
Za = u0*m ./ (4*pi*(x.^2+y.^2+h.^2) ^ (5/2)) * ((2*h.^2 - x.^2 - y.^2) * sin(i) - 3.*x.*h * cos(i) * cos(dealtal) - 3.*y.*h * cos(i) * sin(dealtal));
dT = u0*m ./ (4*pi*(x.^2+y.^2+h.^2) ^ (5/2)) * (A*x.^2 + B*y.^2 + C.*x.*y + D.*x + E.*y + F);

figure(1)
plot(X,dT(:,50));
