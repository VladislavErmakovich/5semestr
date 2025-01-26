u = 255;
n = 1:50;

x_n1 = delta(n-2);
y_n1 = y_nfun(x_n1,u);

x_n2 = unit_step(n-2);
y_n2 = y_nfun(x_n2,u);


