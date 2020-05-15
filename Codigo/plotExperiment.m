function plotExperiment(sample_time, acc_x, acc_y, ...
    acc_z, label_start, label_end, activity_labels, ...
    activity_id, experiment_window)

    tiledlayout(3, 1);
    
    %ACC_X
    nexttile;
    plot(sample_time, acc_x, '-k');
    hold on;
    for j=1:length(experiment_window)
        activity_text = activity_labels(activity_id(experiment_window(j)));
        start = label_start(experiment_window(j));
        finish = label_end(experiment_window(j));
        plot(sample_time(start:finish), acc_x(start:finish));
        text(double(sample_time(start+50)), acc_x(start), activity_text, 'FontSize', 8, 'FontWeight', 'bold');
    end
    xlabel("Time(min)", 'FontWeight', 'bold');
    ylabel("ACC-X", 'FontWeight', 'bold');
    % ------
    
    %ACC_Y
    nexttile;
    plot(sample_time, acc_y, '-k');
    hold on;
    for j=1:length(experiment_window)
        activity_text = activity_labels(activity_id(experiment_window(j)));
        start = label_start(experiment_window(j));
        finish = label_end(experiment_window(j));
        plot(sample_time(start:finish), acc_y(start:finish));
        text(double(sample_time(start+50)), acc_y(start), activity_text, 'FontSize', 8, 'FontWeight', 'bold');
    end
    xlabel("Time(min)", 'FontWeight', 'bold');
    ylabel("ACC-Y", 'FontWeight', 'bold');
    % ------
    
    %ACC_Z
    nexttile;
    plot(sample_time, acc_z, '-k');
    hold on;
    for j=1:length(experiment_window)
        activity_text = activity_labels(activity_id(experiment_window(j)));
        start = label_start(experiment_window(j));
        finish = label_end(experiment_window(j));
        plot(sample_time(start:finish), acc_z(start:finish));
        text(double(sample_time(start+50)), acc_z(start), activity_text, 'FontSize', 8, 'FontWeight', 'bold');
    end
    xlabel("Time(min)", 'FontWeight', 'bold');
    ylabel("ACC-Z", 'FontWeight', 'bold');
    % ------
    
    hold off;
end

