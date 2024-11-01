function [u] = unit_step(n)
% u = zeros(1,length(n));
% for i=1:length(n)
%     if(n(i)>=0)
%         u(i) = 1;
%     else
%         u(i) = 0;
%     end
% end

u = n>=0;
end

