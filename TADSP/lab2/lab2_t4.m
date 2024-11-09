[x, fs] = audioread("task4(02).wav");

threshold = -26;
N = 7;

[x_v, x_u] = vu_separate(x, N, threshold); 

audiowrite("вокал.wav", x_v, fs); 
audiowrite("невокал.wav", x_u, fs); 

figure(1);
subplot(3, 1, 1);
plot(signal,'b');
title("Исходный сигнал");
subplot(3, 1, 2);
plot(x_v,'r');
title("Вокализированные участки сигнала");
subplot(3, 1, 3);
plot(x_u,'k');
title("Невокализованые участки сигнала");
