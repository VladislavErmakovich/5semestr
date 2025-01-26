k = 1:20;
a_k = (1./(pi*k)).*(sin(1.6*pi.*k)-sin(0.4*pi.*k));
b_k = -(1./(pi*k)).*(cos(1.6*pi.*k)-cos(0.4*pi.*k));

subplot(2,1,1)
hold on
plot(a_k,'b')
stem(a_k,'b')
xlabel('$ k $','Interpreter','latex');
ylabel('$ a_k $','Interpreter','latex');
title('График a_k');
grid on;

subplot(2,1,2)
hold on
plot(b_k,'r')
stem(b_k,'r')
xlabel('$ k $','Interpreter','latex');
ylabel('$ b_k $','Interpreter','latex');
title('График b_k');
grid on;