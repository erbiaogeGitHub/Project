function [a1,a2,b1,b2,Vp1,Vp2,Vs1,Vs2] = Snell(Vp1,Vp2,Vs1,Vs2,a)

% Vp1 �����ݲ�
% VP2 Ͷ���ݲ�
% Vs1 ����Შ
% Vs2 Ͷ��Შ
% a   �����
a1 = a;
a2 = asin(Vp2/Vp1 * sin(a));
b1 = asin(Vs1/Vp1 * sin(a1));
b2 = asin(Vs2/Vp1 * sin(a1));
%  