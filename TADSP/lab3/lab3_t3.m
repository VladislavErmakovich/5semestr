n = 0:50;
x_n = delta(n);
y_n = fun_dis_system(x_n);

subplot(2, 1, 1);
stem(x_n,'k')
title("x(n)");
grid on;

subplot(2, 1, 2);
stem(y_n,'b')
title("Реакция дискретной системы на дельта-импульс");
grid on;

