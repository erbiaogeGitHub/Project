clear all;

uo = 4*pi*10^2;
h = 50;  %������������
R = 30;
V = (4/3)*pi*(R^3);  %����1���
M = 10;  %��λΪ nT 
m = M*V ;  %����Ĵž�
I0 = pi/2;
A1 = 0;

X = -100:100;
Y = -100:100;
[x,y] = meshgrid(X,Y);

Hax = uo*m*( (2.*x.^2 - y.^2 - h^2) * cos(I0) * cos(A1) + 3.*x.*y.* cos(I0) * sin(A1) - 3.*x.*h* sin(I0) ) ./( 4*pi...
    .* (x.^2 + y.^2 + h^2).^(5/2) );
Hay = uo*m*( (2.*y.^2 - x.^2 - h^2) * cos(I0) * sin(A1) + 3.*x.*y.* cos(I0) * cos(A1) - 3.*y.*h* sin(I0) ) ./ ( (4*pi...
    .*(x.^2 + y.^2 + h^2).^(5/2)) );
 Za =   uo*m*( (2*h.^2 - x.^2 - y.^2) * sin(I0) - 3*x*h* cos(I0) * cos(A1) - 3*y*h* cos(I0) *sin(A1) ) ./ (4*pi*...
     (x.^2 + y.^2 +h^2).^(5/2)) ;
 dT = uo*m* ( (2*h^2 - x.^2 - y.^2) * (sin(I0))^2 + (2*x.^2 - y.^2 - h^2) * (cos(I0))^2 * (cos(A1))^2 + ...
     (2*y.^2 - x.^2 - h^2) * (cos(I0))^2 * (sin(A1))^2 - 3*x*h* sin(2*I0) * cos(A1) + 3*x.*y* cos(I0)^2 *sin(2*A1)...
     - 3*y*h* sin(2*I0) *sin(A1) ) ./( 4*pi*(x.^2 + y.^2 +h^2).^(5/2) );
figure(1)
contour(Hax,'ShowText','on')
title('����Hax');
xlabel('x����');
ylabel('y����');
axis equal;
figure(2)
contour(Hay,'ShowText','on')
title('����Hay');
xlabel('x����');
ylabel('y����');
axis equal;
figure(3)
contour(Za,'ShowText','on')
title('����Za');
xlabel('x����');
ylabel('y����');
axis equal;
figure(4)
contour(dT,'ShowText','on')
title('���妤T');
xlabel('x����');
ylabel('y����');
axis equal;






