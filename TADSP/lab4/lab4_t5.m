a_0 = 1.2 ;
k = 1:20;
a_k = (1./(pi*k)).*(sin(1.6*pi.*k)-sin(0.4*pi.*k));
b_k = -(1./(pi*k)).*(cos(1.6*pi.*k)-cos(0.4*pi.*k));


Ak = sqrt(a_k.^2+b_k.^2);
fi_k = atan2(-b_k, a_k);

subplot(2,1,1)
hold on
plot(Ak,'b')
xlabel('$ k $','Interpreter','latex');
ylabel('$ A_k $','Interpreter','latex');
title('График параметра A_k');
grid on;

subplot(2,1,2)
hold on
plot(fi_k,'b')
xlabel('$ k $','Interpreter','latex');
ylabel('$ \phi_k $','Interpreter','latex');
title('График параметра \phi_k');
grid on;

