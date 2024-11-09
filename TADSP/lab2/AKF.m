function [akf_signal] = AKF(section,flag)
N = length(section);

if flag == 0
    akf_signal = zeros(1,N);
    section_ext = [section.', zeros(1,N)];
    for i=0:N-1
        akf_signal(i+1) = sum(section_ext(1:N).*section_ext(i+1:N+i));
    end   
    akf_signal = (1/length(section_ext)).*akf_signal;
elseif flag == 1
    signal_periodic = [section, section];
    signal_periodic_len = length(signal_periodic);
    akf_signal = zeros(1, 2*signal_periodic_len-1);
    for k = 1:2*signal_periodic_len-1
        for n = 1:signal_periodic_len
            if (n + k - signal_periodic_len >= 1) && (n + k - signal_periodic_len <= signal_periodic_len)
                akf_signal(k) = akf_signal(k) + signal_periodic(n) * signal_periodic(n + k - signal_periodic_len);
            end
        end
    end
    akf_signal = (1/signal_periodic_len).*akf_signal;
else
    fprintf('Error')
end



