function duration = getDuration(ACTIVITIES, fs)
    duration = [];
        for i=1:length(ACTIVITIES)
            ACT = ACTIVITIES{i};
            durOCC = [];
            for k = 1:length(ACT{1})
                OCC = ACT{1}{k};
                durOCC{k} = length(OCC)/(fs * 60);
            end
            duration{i} = durOCC;
        end
end

