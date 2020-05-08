% Every row of the acc files is
% one acceleration sample (three axis - x, y, z)
% with fs = 50Hz (50x/second)

%The units used for the accelerations (total and body) are
%'g's (gravity of earth -> 9.80665 m/seg2).

clear;
matfiles = dir( fullfile('dataset\', '*.txt' ));

%sampling freq (50Hz)
fs = 50;

%Etiquetas de ação
labels_fid = fopen('dataset\activity_labels.txt');
activity_labels = textscan(labels_fid, '%d %s');
activity_labels = activity_labels{2};

%Intervalos das ações
f = fopen('dataset\labels.txt');
lines = textscan(f, '%d %d %d %d %d');
experiment_id = lines{1};
user_id = lines{2};
activity_id = lines{3};
label_start = lines{4};
label_end = lines{5};
fclose(f);

% Este 'for' abre cada ficheiro e
% desenha o plot com as respetivas cores e etiquetas.
% Cada ficheiro é uma experiência.
% NOTA: só está a abrir o 1o ficheiro
% para não explodir o pc.

for i = 1 : 1 %length(matfiles)-2
    % Abre ficheiro da experiência
    % e lê os dados
    f2 = fopen([matfiles(1).folder '\' matfiles(1).name]);
    acc_data = textscan(f2, '%f %f %f');
    acc_x = acc_data{1};
    acc_y = acc_data{2};
    acc_z = acc_data{3};
    fclose(f2);
    
    %sample time em minutos
    sample_time = linspace(1, length(acc_x) / (fs * 60), length(acc_x));
    
    len_current_experiment = length(experiment_id(i: find(experiment_id ~= i)-1));
    
    figure(i);
    %Activity labeling
    tiledlayout(3, 1);
    
    %ACC_X
    nexttile;
    plot(sample_time, acc_x, '-k');
    hold on;
    for j=1:len_current_experiment
        activity_text = activity_labels(activity_id(j));
        start = label_start(j);
        finish = label_end(j);
        plot(sample_time(start:finish), acc_x(start:finish));
        text(double(sample_time(start+50)), acc_x(start), activity_text, 'FontSize', 8, 'FontWeight', 'bold');
    end
    xlabel("Time(min)", 'FontWeight', 'bold');
    ylabel("ACC-X", 'FontWeight', 'bold');
    
    %ACC_Y
    nexttile;
    plot(sample_time, acc_y, '-k');
    hold on;
    for j=1:len_current_experiment
        activity_text = activity_labels(activity_id(j));
        start = label_start(j);
        finish = label_end(j);
        plot(sample_time(start:finish), acc_y(start:finish));
        text(double(sample_time(start+50)), acc_y(start), activity_text, 'FontSize', 8, 'FontWeight', 'bold');
    end
    xlabel("Time(min)", 'FontWeight', 'bold');
    ylabel("ACC-Y", 'FontWeight', 'bold');
    
    %ACC_Z
    nexttile;
    plot(sample_time, acc_z, '-k');
    hold on;
    for j=1:len_current_experiment
        activity_text = activity_labels(activity_id(j));
        start = label_start(j);
        finish = label_end(j);
        plot(sample_time(start:finish), acc_z(start:finish));
        text(double(sample_time(start+50)), acc_z(start), activity_text, 'FontSize', 8, 'FontWeight', 'bold');
    end
    xlabel("Time(min)", 'FontWeight', 'bold');
    ylabel("ACC-Z", 'FontWeight', 'bold');
end