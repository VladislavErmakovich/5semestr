function [x_v,x_u] = vu_separate(x, N, threshold)

for n = 1:length(x)
    start = max(1, n-N+1);
    P(n) = sum(x(start:n).^2)/N;
    P_d(n) = 10 * log10(P(n));
end

x_v = x(P_d > threshold);  
x_u = x(P_d <= threshold);
end
