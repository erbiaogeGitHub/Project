clear all;

R1 = 30;
h1 = 60;  
z1 = h1;
G = 6.67*10^(-5);  %��λg.u.
p1 = 1*10^3;
S1 = pi*R1^2;
d1 = p1*S1;

for i = 1:2000
    x = i-1000;
    g(i) = 2*G*d1*h1/((x+500)^2+h1^2);  %��ˮƽ���޳�Բ�������500��
end

figure(1)
x = 1:2000;
plot(x,g);
xlabel('λ��');
ylabel('�쳣(g.u.)');
title('ǳ����');
