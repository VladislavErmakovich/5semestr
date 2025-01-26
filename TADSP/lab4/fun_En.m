function [E] = fun_En(t,a_0)

x = unit_step(t - 0.2) - unit_step(t - 0.8); 
n_E = (1:30);
for i = 1:30
    for k = 1:n_E(i)
        s = fun_s_n(k,a_0,t);
        if k == n_E(i)
            epsilon = abs(x-s);
        end
    end
    E(i) = sum(epsilon.^2);
end

end