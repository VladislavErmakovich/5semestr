function [d] = delta(n)
% d = zeros(1,length(n));
% for i=1:length(n)
%     if(n(i)==0)
%         d(i) = 1;
%     else
%         d(i) = 0;
%     end
% end

d = n==0;
end

