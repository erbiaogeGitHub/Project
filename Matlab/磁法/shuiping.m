clear all;

u0 = 4*pi*10^2;
h = 100;  %������������
R = 50;
S = 4*pi*R^2;  %����1���
Ms = 40;  %��λΪ nT 
ms = Ms*S ;  %����Ĵž�
I0 =  pi/2;  %�شų����
is = I0;  %��Ч�Ż����
A1 = 0;  %x��������UI�شų�������ļнǣ���x�����汱����һ��ʱ��A��Ϊ�شų���ƫ��


for i = 1:300
    x = i - 150;
    Hax(i) = 2*u0*ms / (4*pi*(x^2 + h*2) ^ 2) * ( -(h^2 - x^2) * cos(is) - 2*h*x * sin(is) );
    Za(i)  = 2*u0*ms / (4*pi*(x^2 + h*2) ^ 2) * ( (h^2 - x^2) * sin(is) - 2*h*x*cos(is) );
    dT(i) = 2*u0*ms / (4*pi*(x^2 + h*2) ^ 2) * ( (h^2 - x^2) * ( sin(is) * sin(I0) - cos(is) * cos(I0) * cos(A1) ) - ...
        2*h*x* (cos(is) * sin(I0) + sin(is) * cos(I0) *cos(A1) ) );

end

x = -149:150;

figure(1)
hold on
plot(x,Hax,'b');
plot(x,Za,'r');
plot(x,dT,'k');
xlabel('x����');
ylabel('�쳣 (nT)');
hold off
