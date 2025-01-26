delta = @(n)(n==0);
n = 0:100;
x = delta(n);
N = length(x);


b = [0 1];
a = [1 0 -0.1 0.1]; 

h = filter(b, a, x);

w = linspace(0, 2*pi, 1000);
H = zeros(size(w));
for m = 1:N
    H = H + h(m) * exp(-1j * w * (m-1));
end

magnitude = abs(H);
phase = angle(H);


[~, min_index] = min(magnitude);
min_mag = magnitude(min_index);
omega0 = w(min_index);

x_exp = exp(1j * omega0 * n);

y = filter(b, a, x_exp);

figure;
subplot(4, 1, 1);
plot(w, magnitude, 'b', 'LineWidth', 1.5);
grid on;
title('Амплитудно-частотная характеристика (АЧХ)');
xlabel('\omega (рад)');
ylabel('|H(e^{j\omega})|');

subplot(4, 1, 2);
plot(w, phase, 'k', 'LineWidth', 1.5);
grid on;
title('Фазо-частотная характеристика (ФЧХ)');
xlabel('\omega (рад)');
ylabel('arg(H(e^{j\omega})) (рад)');

subplot(4, 1, 3);
plot(n, real(x_exp), 'LineWidth', 2);
title('Входной сигнал');
xlabel('n');
grid on;

subplot(4, 1, 4);
plot(n, abs(y), 'LineWidth', 2);
hold on;
plot(n, real(y));
plot(n, imag(y));
title('Выходной сигнал');
xlabel('n');
grid on;

disp('Частота минимального значения АЧХ:');
disp(min_mag);