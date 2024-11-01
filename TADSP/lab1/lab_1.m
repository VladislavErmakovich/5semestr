% задание 2
n = 1:49;
N = 8*2; %2 - вариант
F = 1/ N;
x = sin(2*pi*F*n);
hold on
plot(x,'LineWidth',1)
stem(x,'b')
xlabel('$ n $', 'Interpreter','latex' );
ylabel('$ x(n) $','Interpreter','latex');
title('Дискретный синусоидальный сигнал');
grid on;

% задание 3
w = 100;
N_0 = 1/3;
y = sin(w*(n+N_0));

hold on
plot(y,'LineWidth',1)
stem(y,'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ y(n) $','Interpreter','latex');
title('Дискретный непериодический синусоидальный сигнал');
grid on;

% задание 4.1
y_d = delta(n-2);

subplot(211)
stem(y_d,'b')
xlabel('$ n $', 'Interpreter','latex')
ylabel('\(\delta(n-n0)\)', 'Interpreter','latex')

title('Единичный импульс');

% задание 4.2
y_u = unit_step(n-2);

subplot(212)
stem(y_u, 'r')
xlabel('$ n $', 'Interpreter','latex')
ylabel('\(u(n-n0)\)','Interpreter','latex');
title('Единичный скачок');

% задание 5
N = 42;
n = 0:N-1;
w = zeros(1,N);
for i = 1 :length(w)
    val = (8*i - 4*N)/N;
    w(i) = val*(exp(-(val)^2)/2);
end

hold on
plot(w, 'LineWidth',2)
stem(w,'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ w(n) $', 'Interpreter','latex');
title('Последовательность w(n)');
grid on;

%Задание 6
f0 = 1;
phi0 = pi/6;
fs = 16;
t0 = -1;
t1 = 3;
A = 1;
t = t0:1/fs:t1;
s = A*sin(2*pi*f0*t + phi0); 

hold on
plot(s,'LineWidth',1)
stem(s,'b')
xlabel('$ t $','Interpreter','latex');
ylabel('\(Asin(2\pi\frac{f}{fs}t+phi)\)','Interpreter','latex');
title('График синусоиды в результате дискретизации');
grid on

%Задание 7
n = 0:100;
r = 0.89;
w = 2*pi/7;
z = r*exp(1j*w);
x = cplx_exp(z,n);

%subplot(221)
plot(x,'b')
xlabel('$ n $','Interpreter','tex');
ylabel('$ x(n) $', 'Interpreter','latex');
title('Комплексная экспонента');
grid on

Re = r.^n.*cos(w*n);
Im = r.^n.*sin(w*n);
%subplot(222)
plot(Re,'m')
xlabel('$ n $','Interpreter','latex');
ylabel('$ Re $','Interpreter','latex');
title('График действительной части');
grid on

%subplot(223)
plot(Im,'r')
xlabel('$ n $','Interpreter','latex');
ylabel('$ Im $','Interpreter','latex');
title('График мнимой части');
grid on

%subplot(224)
y = Re +1j*Im;
plot(y)
xlabel('$ Im $','Interpreter','latex');
ylabel('$ Re $', 'Interpreter','latex');
title('Комплексная экспонента');
grid on

w1 = 2*pi/4;
w2 = 2*pi/3;
w3 = 2*pi/13;
w4 = 2*pi/28;

subplot(231)
Re_1 = r.^n.*cos(w1*n);
Im_1 = r.^n.*sin(w1*n);
y1 = Re_1 +1j*Im_1;
plot(y1,'b')
xlabel('$ Im $','Interpreter','latex');
ylabel('$ Re $', 'Interpreter','latex');
title('Комплексная экспонента(w1 = 2*pi/4)');
grid on

subplot(232)
Re_2 = r.^n.*cos(w2*n);
Im_2 = r.^n.*sin(w2*n);
y2 = Re_2 +1j*Im_2;
plot(y2, 'r')
xlabel('$ Im $','Interpreter','latex');
ylabel('$ Re $', 'Interpreter','latex');
title('Комплексная экспонента(w2 = 2*pi/3)');
grid on

subplot(233)
Re_3 = r.^n.*cos(w3*n);
Im_3 = r.^n.*sin(w3*n);
y3 = Re_3 +1j*Im_3;
plot(y3, 'm')
xlabel('$ Im $','Interpreter','latex');
ylabel('$ Re $', 'Interpreter','latex');
title('Комплексная экспонента(w3 = 2*pi/13)');
grid on

subplot(234)
Re_4 = r.^n.*cos(w4*n);
Im_4 = r.^n.*sin(w4*n);
y4 = Re_4 +1j*Im_4;
plot(y4,'g')
xlabel('$ Im $','Interpreter','latex');
ylabel('$ Re $', 'Interpreter','latex');
title('Комплексная экспонента(w4 = 2*pi/28)');
grid on

%3D
subplot(235)
plot3(Re,Im,n,"b");
xlabel('$ Im $','Interpreter','latex');
ylabel('$ Re $', 'Interpreter','latex');
title('Комплексная экспонента(3D)');
grid on


%Задание 8
n1 = 0:25;
n2 = -15:25;
n3 = -20:0;
n4 = 0:50;

w1 =pi/6;
w2 = pi/9;
a = 1.15;
b = 0.9;


subplot(411)
hold on
x1 = sin(w1*n1);
plot(x1,'b');
stem(x1,'b')
xlabel('$ n $', 'Interpreter','latex','FontSize', 16)
ylabel('\(\sin(w_1n)\)', 'Interpreter','latex','FontSize', 16)
grid on

subplot(412)
hold on
x2 = cos(w1*n2);
plot(x2,'r');
stem(x2, 'r')
xlabel('$ n $', 'Interpreter','latex','FontSize', 14)
ylabel('\(\cos(w_1n)\)', 'Interpreter','latex','FontSize', 14)
grid on

subplot(413)
hold on
x3 = a.^n3.*sin(w2*n3);
plot(x3,'g');
stem(x3, 'g')
xlabel('$ n $', 'Interpreter','latex','FontSize', 14)
ylabel('\(a^n\sin(w_2n)\)', 'Interpreter','latex','FontSize', 14)
grid on

subplot(414)
hold on
x4 = b.^n4.*cos(w2*n4);
plot(x4,'k');
stem(x4, 'k')
xlabel('$ n $', 'Interpreter','latex','FontSize', 14)
ylabel('\(b^n\cos(w_2n)\)', 'Interpreter','latex','FontSize', 14)
grid on