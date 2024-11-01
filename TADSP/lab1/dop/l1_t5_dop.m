% задание 5
N = 42;
n = 0:N-1;
w = zeros(1,N);
%for i = 1 :length(w)
%    val = (8*i - 4*N)/N;
%
% w(i) = val*(exp(-(val)^2)/2);
%end
w = ((8.*n - 4*N)/N).*exp(-(((8*n - 4*N)/N).^2)/2);
hold on
plot(w, 'LineWidth',2)
stem(w,'b')
xlabel('$ n $','Interpreter','latex');
ylabel('$ w(n) $', 'Interpreter','latex');
title('Последовательность w(n)');
grid on;