a_0 = 1.2 ;
T = 1;
t = -T:0.01:2*T;

% n = 1
s_1 = fun_s_n(1, a_0, t);

% n = 3
s_2 = fun_s_n(3, a_0, t);

% n = 10
s_3 = fun_s_n(10, a_0, t);

% n = 30
s_4 = fun_s_n(30, a_0, t);

subplot(4,1,1)
hold on
plot(t, s_1,'b')
ylabel('$ S_n(t) $','Interpreter','latex');
title('График S_n(t) при n = 1');
grid on;

subplot(4,1,2)
hold on
plot(t, s_2,'b')
ylabel('$ S_n(t) $','Interpreter','latex');
title('График S_n(t) при n = 3');
grid on;

subplot(4,1,3)
hold on
plot(t, s_3,'b')
ylabel('$ S_n(t) $','Interpreter','latex');
title('График S_n(t) при n = 10');
grid on;

subplot(4,1,4)
hold on
plot(t, s_4,'b')
ylabel('$ S_n(t) $','Interpreter','latex');
title('График S_n(t) при n = 30');
grid on;
