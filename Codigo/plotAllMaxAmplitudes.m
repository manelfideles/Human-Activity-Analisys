function plotAllMaxAmplitudes(maxAmpDinamicX, maxAmpDinamicY, maxAmpDinamicZ, ...
    maxNonAmpDinamicX, maxNonAmpDinamicY, maxNonAmpDinamicZ)

    figure();
    tiledlayout(1,3);
    nexttile;
    hold on;
    
    % EIXO DOS XX
    
    plot(cell2mat(maxAmpDinamicX), 'ob');
    plot(cell2mat(maxNonAmpDinamicX), 'og');  
    
    xlabel("X-AXIS");
    ylabel("MAX AMPLITUDE");
    hold off;
    
    % EIXO DOS YY
    nexttile;
    hold on;
    
    plot(cell2mat(maxAmpDinamicY), 'ob');
    plot(cell2mat(maxNonAmpDinamicY), 'og');
    xlabel("Y-AXIS");
    
    % EIXO DOS ZZ
    nexttile;
    hold on;
    
    plot(cell2mat(maxAmpDinamicZ), 'ob');
    plot(cell2mat(maxNonAmpDinamicZ), 'og');
    xlabel("Z-AXIS");
    
end


