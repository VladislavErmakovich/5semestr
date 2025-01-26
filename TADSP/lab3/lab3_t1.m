u = 255;
n = 1:50;

x_n1 = delta(n-2);
y_n1 = y_nfun(x_n1,u);

x_n2 = unit_step(n-2);
y_n2 = y_nfun(x_n2,u);


x_n3 = cos(2*pi*0.01.*n);
y_n3 = y_nfun(x_n3,u);

x_n4 = cos(2*pi*0.48.*n);
y_n4 = y_nfun(x_n4, u);

figure(1);
subplot(4, 1, 1);
plot(y_n1,'b');
title("Реакция системы на дельта-импульс");
subplot(4, 1, 2);
plot(y_n2,'r');
title("Реакция системы на единичный скачок");
subplot(4, 1, 3);
plot(y_n3,'k');
title("Реакция системы на низкочастотный синусоидальный сигнал");
subplot(4, 1, 4);
plot(y_n4,'b');
title("Реакция системы на высокочастотный синусоидальный сигнал");
