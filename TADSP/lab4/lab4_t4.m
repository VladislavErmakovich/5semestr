a_0 = 1.2 ;
T = 1;
t = -T:0.001:2*T;

x = unit_step(mod(t, T) - 0.2) - unit_step(mod(t, T) - 0.8); 
% n = 1
s_1 = fun_s_n(1, a_0, t);

% n = 3
s_2 = fun_s_n(3, a_0, t);

% n = 10
s_3 = fun_s_n(10, a_0, t);

% n = 30
s_4 = fun_s_n(30, a_0, t);

e_n1 = abs(x - s_1);
e_n2 = abs(x - s_2);
e_n3 = abs(x - s_3);
e_n4 = abs(x - s_4);

figure(1)
subplot(4,1,1)
hold on
plot(t, e_n1,'b')
ylabel('$ e_n(t) $','Interpreter','latex');
title('График e_n(t) при n = 1');
grid on;

subplot(4,1,2)
hold on
plot(t, e_n2,'b')
ylabel('$ e_n(t) $','Interpreter','latex');
title('График e_n(t) при n = 3');
grid on;

subplot(4,1,3)
hold on
plot(t, e_n3,'b')
ylabel('$ e_n(t) $','Interpreter','latex');
title('График e_n(t) при n = 10');
grid on;

subplot(4,1,4)
hold on
plot(t, e_n4,'b')
ylabel('$ e_n(t) $','Interpreter','latex');
title('График e_n(t) при n = 30');
grid on;

t_e = 0:0.001:T;
E = fun_En(t_e, a_0);
figure(2)
hold on
plot(E,'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ E_n $','Interpreter','latex');
title('График энергии ошибки с увеличением n');
grid on;


