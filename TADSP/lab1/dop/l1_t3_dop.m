n = 1:49;
w = 100;
N_0 = 1/3;
y = sin(w*(n+N_0));

subplot(211)
hold on
plot(y,'LineWidth',1)
stem(y,'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ y(n) $','Interpreter','latex');
title('Дискретный непериодический синусоидальный сигнал');
grid on;

subplot(212)
hold on
w_min = w-2*pi*15;
y_new = sin(w_min*n +w*N_0);

plot(y_new,'LineWidth',1)
stem(y_new,'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ y(n) $','Interpreter','latex');
title('Дискретный непериодический синусоидальный сигнал');
grid on;