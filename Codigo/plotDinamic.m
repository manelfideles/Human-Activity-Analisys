function plotDinamic(allMaxW, allMaxWU, allMaxWD)
    
    tiledlayout(1, 3);
    nexttile;
    hold on;
    for i=1:length(allMaxW)
        plot(allMaxW{1,i}{1,1}, 'or');
    end
    for i=1:length(allMaxWU)
        plot(allMaxWU{1,i}{1,1}, 'og');
    end
    for i=1:length(allMaxWD)
        plot(allMaxWD{1,i}{1,1}, 'ob');
    end
    
    nexttile;
    hold on;
    for i=1:length(allMaxW)
        plot(allMaxW{1,i}{1,2}, 'or');
    end
    for i=1:length(allMaxWU)
        plot(allMaxWU{1,i}{1,2}, 'og');
    end
    for i=1:length(allMaxWD)
        plot(allMaxWD{1,i}{1,2}, 'ob');
    end
    
    nexttile;
    hold on;
    for i=1:length(allMaxW)
        plot(allMaxW{1,i}{1,3}, 'or');
    end
    for i=1:length(allMaxWU)
        plot(allMaxWU{1,i}{1,3}, 'og');
    end
    for i=1:length(allMaxWD)
        plot(allMaxWD{1,i}{1,3}, 'ob');
    end
    
end

