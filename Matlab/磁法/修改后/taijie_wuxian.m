clear all;

u0 = 4*pi*10^2;
h = 10;  
H = 12;  
Ms = 10;  %��λΪ nT 
is = pi/2;  %��Ч�Ż����
I0 =  pi/2;  %�شų����
A1 = 0;  %x��������شų�������ļнǣ���x�����汱����һ��ʱ��A��Ϊ�شų���ƫ��
a = pi/4  ;  % ̨����б�����µ�ˮƽ��ļн�

x = -300:300;

rA = ( (x + h* cot(a)).^2 + h^2 ).^(1/2);
rB = ( (x + H* cot(a)).^2 + H^2 ).^(1/2);
faiA = atan( (x + h* cot(a))./h );
faiB = atan( (x + H* cot(a))./H );

Hax = 2*u0*Ms * sin(a) * ( -cos(a+is) .* log(rB./rA) - sin(a+is) * (faiA - faiB));
Za  = 2*u0*Ms * sin(a) * ( sin(a+is) .* log(rB./rA) - cos(a+is) * (faiA - faiB));
dT = 2*u0*Ms * sin(a) * ( (sin(a+is) * sin(I0) - cos(a+is) * cos(I0) * cos(A1) ) ...
    .* log(rB./rA) - (cos(a+is) * sin(I0) + sin(a+is) * cos(I0) * cos(A1) ) * (faiA - faiB) );

figure(1)
hold on
plot(x,Hax,'b');
plot(x,Za,'r');
plot(x,dT,'k');
xlabel('x����');
ylabel('�쳣 (nT)');
title('̨���쳣');
hold off