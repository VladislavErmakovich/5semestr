function [y] = fun_dis_system(x)
    N = length(x);
    y = zeros(1, N);
    for i = 1:N
        if i == 1
            y(i) = 0;
        elseif i == 2
            y(i) = x(i-1);
        elseif i == 3
            y(i) = x(i-1);
        else
            y(i) = x(i-1) - 0.1 * y(i-2) + 0.1 * y(i-3);
        end
    end
end

