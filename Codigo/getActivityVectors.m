function  A = getActivityVectors(activity, label_start, label_end, ...
    acc_x, acc_y, acc_z, len_current_experiment, activity_id, activity_labels)
    
    activity_x = {};
    activity_y = {};
    activity_z = {};
    for j=1:len_current_experiment
        activity_text = activity_labels(activity_id(j));
        if (activity_text == activity)
            start = label_start(j);
            finish = label_end(j);
            activity_x{end+1} = detrend(acc_x(start:finish));
            activity_y{end+1} = detrend(acc_y(start:finish));
            activity_z{end+1} = detrend(acc_z(start:finish));
        end        
    end
    A = {activity_x, activity_y, activity_z};
    
end

