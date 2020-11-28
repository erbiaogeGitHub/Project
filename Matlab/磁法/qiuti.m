clear all;

u0 = 4*pi*10^2;
h = 1000;  %������������
R = 500;
V = (4/3)*pi*(R^3);  %����1���
M = 40;  %��λΪ nT 
m = M*V ;  %����Ĵž�
i = pi/2;  %�Ż����
dealtal = 0;  %x����������Ż�����ˮƽ�����ļн�
I0 =  pi/2;  %�شų����
A1 = 0;  %x��������UI�شų�������ļнǣ���x�����汱����һ��ʱ��A��Ϊ�شų���ƫ��

A = 2* cos(i) * cos(dealtal) * cos(I0) * cos(A1) - cos(i) * sin(dealtal) * cos(I0) * sin(A1) - sin(i) * sin(I0);
B = 2*cos(i) * sin(dealtal) * cos(I0) * sin(A1) - cos(i) * cos(dealtal) * cos(I0) * cos(A1) - sin(i) * sin(I0);
C = 3*(cos(i) * sin(dealtal) * cos(I0) * cos(A1) + cos(i) * cos(dealtal) * cos(I0) * sin(A1));
D = -3*( sin(i) * cos(I0) * cos(A1) + cos(i) * cos(dealtal) * sin(I0) )*h;
E = -3*( sin(i) * cos(I0) * sin(A1) + cos(i) * sin(dealtal) * sin(I0) )*h;
F = ( 2*sin(i) * sin(I0) - cos(i) * cos(dealtal) * cos(I0) * cos(A1) - cos(i) * sin(dealtal) * cos(I0) * cos(A1) )*h^2;



for i = 1:300
    for j = 1:300
        x = i - 150;
        y = j - 150;
        Hax(i,j) = u0*m  * ((2*x^2 - y^2-h^2)* cos(i) * cos(dealtal) + 3*x*y* cos(i) * sin(dealtal) - 3*x*h * sin(i))/ (4*pi*(x^2+y^2+h^2) ^ (5/2));
        Hay(i,j) = u0*m / (4*pi*(x^2+y^2+h^2) ^ (5/2)) * ((2*y^2 - x^2-h^2)* cos(i) * sin(dealtal) + 3*x*y*cos(i)*cos(dealtal) - 3*y*h * sin(i));
        Za(i,j) = u0*m / (4*pi*(x^2+y^2+h^2) ^ (5/2)) * ((2*h^2 - x^2 - y^2) * sin(i) - 3*x*h * cos(i) * cos(dealtal) - 3*y*h * cos(i) * sin(dealtal));
        dT(i,j) = u0*m / (4*pi*(x^2+y^2+h^2) ^ (5/2)) * (A*x^2 + B*y^2 + C*x*y + D*x + E*y + F);
    end
end

x = -149:150;
figure(1)
hold on
plot(x,Hax(110,:),'b');
plot(y,Hay(:,100),'y');
plot(x,Za(100,:),'r');
plot(x,dT(110,:),'k');
xlabel('x����');
ylabel('�쳣 (nT)');
hold off