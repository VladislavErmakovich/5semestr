function [y_n] = y_nfun(x_n, u)

sign = zeros(size(x_n));
for i=1:length(sign)
if x_n(i)>0
    sign(i) = 1;
elseif x_n(i)==0
    sign(i) = 0;
else
    sign(i) = -1;
end
end
y_n = sign .* (log(1 + u .* abs(x_n)) / log(1 + u));

end
