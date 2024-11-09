N = 42;
n = 0:N-1;
x = cos(2*pi*0.1.*n);

subplot(3,1,1)
hold on
plot(x,'k')
stem(x,'k')
xlabel('$ n $','Interpreter','latex');
ylabel('$ x(n) $','Interpreter','latex');
title('Сигнал x(n)');
grid on;

x_periodic = [x,x];
xp_len = length(x_periodic);
subplot(3,1,2)
hold on
plot( x_periodic, 'b')
stem( x_periodic, 'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ x(n) $','Interpreter','latex');
title('Расширенный сингал');
grid on;


R = zeros(1, 2*xp_len-1); % Массив для автокорреляции
lags = -xp_len+1:xp_len-1; % Лаги от -(N-1) до (N-1)
    
for k = 1:2*xp_len-1
    for n = 1:xp_len
        if (n + k - xp_len >= 1) && (n + k - xp_len <= xp_len)
                R(k) = R(k) + x_periodic(n) * x_periodic(n + k - xp_len);
        end
    end
end

R =(1/xp_len).*R; 
subplot(3,1,3)
hold on
plot(lags,R, 'b')
stem(lags,R, 'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ r(e) $','Interpreter','latex');
title('АКФ');
grid on;

[~, max_index] = max(R(2:N));
T = max_index;


