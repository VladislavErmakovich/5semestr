L = 32000;
fs = 44100; 
a = 0.95;
f_0 = 440;
M = round(fs/f_0);

x = zeros(1, L);
x(1:M) = (1 / 4) * (rand(1, M) - 0.5);

y = zeros(1, L);
y(1:M) = x(1:M);

for n = M+1:L
    y(n) = x(n) + a * y(n - M);
end

sound(y, fs); 

plot(y, 'b');
title('Нота ля первой октавы');
grid on;
audiowrite('ks_out.wav', y, fs);