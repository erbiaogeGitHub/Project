clear all;

u0 = 4*pi*10^2;
h = 30;  %������������
R = 10;
S = 4*pi*R^2;  %����1���
Ms = 10 ;  %��λΪ A/m 
ms = Ms*S ;  %����Ĵž�
I0 =  pi/2;  %�شų����
is = I0;  %��Ч�Ż����
A1 = 0;  %x��������UI�شų�������ļнǣ���x�����汱����һ��ʱ��A��Ϊ�شų���ƫ��

x = -150:150;

Hax = 2*u0*ms* ( -(h^2 - x.^2) * cos(is) - 2*h.*x * sin(is) ) ./ (4*pi.*(x.^2 + h^2).^ 2) ;
Za  = 2*u0*ms* ( (h^2 - x.^2) * sin(is) - 2*h*x*cos(is) ) ./ (4*pi*(x.^2 + h^2).^ 2) ;
dT = 2*u0*ms  * ( (h^2 - x.^2) * ( sin(is) * sin(I0) - cos(is) * cos(I0) * cos(A1) ) - ...
    2*h*x* (cos(is) * sin(I0) + sin(is) * cos(I0) *cos(A1) ) )./ (4*pi*(x.^2 + h^2).^ 2);

figure(1)
hold on
plot(x,Hax,'b');
plot(x,Za,'r');
plot(x,dT,'k');
xlabel('x����');
ylabel('�쳣 (nT)');
title('ˮƽ���޳�Բ�����쳣');
hold off

