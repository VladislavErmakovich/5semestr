function [s] = fun_s_n(n, a_0, t)
k = 1:30;
a_k = (1./(pi*k)).*(sin(1.6*pi.*k)-sin(0.4*pi.*k));
b_k = -(1./(pi*k)).*(cos(1.6*pi.*k)-cos(0.4*pi.*k));
sum_components = zeros(size(t));
for i=1:n
    sum_components = sum_components + a_k(i)*cos(2*pi.*t.*i) + b_k(i)*sin(2*pi.*t.*i);
end

s=sum_components+a_0/2;
end