n = 0:50;
x_n = delta(n);
b = [0 1];
a = [1 0 0.1 -0.1];

y = filter(b,a,x_n);
stem(y,'k')
title("Импульсная характеристика");
grid on;


