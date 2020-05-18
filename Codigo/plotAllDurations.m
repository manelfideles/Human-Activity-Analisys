function plotAllDurations(sd, td)
    figure();
    hold on;
    plot(cell2mat(sd), 'ob');
    plot(cell2mat(td), 'og');
    xlabel("Ocurrences");
    ylabel("Duration [min]");
    title("Duration of occurrences of transitional and static activities");
end

