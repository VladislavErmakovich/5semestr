function [Px, Pa] = power_xn(x,N)

sum_x = 0;
for i=1:N-1
    sum_x=sum_x+(abs(x(i))).^2;
end
Px = sum_x/N;
Pa = log10(Px);

end
