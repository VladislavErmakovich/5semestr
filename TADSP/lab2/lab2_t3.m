flag = 0;
[signal, fs] = audioread("task3(02).wav");

len_section = 320;
len_overlap = 160;
step = len_section-len_overlap;
N_sections = floor((length(signal)-len_overlap)/step);
first_pick = zeros(1,N_sections);

for i=1:N_sections
    strat_idx = (i-1)*step + 1;
    end_idx = strat_idx + len_section - 1;
    section = signal(strat_idx:end_idx);
    akf = AKF(section,flag);
    [~, first_max_idx] = max(akf(2:end));
    first_pick(i) = first_max_idx;
end    

figure;
hold on
plot(1:N_sections, first_pick, 'b');
xlabel("Номер сегмента");
ylabel("Период основного тона");
title("Период основного тона для каждого сегмента");
grid on;