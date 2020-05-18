function plotAllMaxFrequencies(maxFreqDinamicX, maxFreqDinamicY, maxFreqDinamicZ, ...
    maxFreqNonDinamicX, maxFreqNonDinamicY, maxFreqNonDinamicZ)

    figure();
    tiledlayout(1,3);
    nexttile;
    hold on;
    
    % EIXO DOS XX
    
    plot(cell2mat(maxFreqDinamicX), 'ob');
    plot(cell2mat(maxFreqNonDinamicX), 'og');  
    
    xlabel("X-AXIS");
    ylabel("MAX DFT AMPLITUDE");
    hold off;
    
    % EIXO DOS YY
    nexttile;
    hold on;
    
    plot(cell2mat(maxFreqDinamicY), 'ob');
    plot(cell2mat(maxFreqNonDinamicY), 'og');
    xlabel("Y-AXIS");
    
    % EIXO DOS ZZ
    nexttile;
    hold on;
    
    plot(cell2mat(maxFreqDinamicZ), 'ob');
    plot(cell2mat(maxFreqNonDinamicZ), 'og');
    xlabel("Z-AXIS");
    
end

