function [Dx, Dy, Dz, NDx, NDy, NDz] = plotMaxFrequency(D, S, T, fs)
    maxACTD = getSPM(D, "true", fs);
    maxACTS = getSPM(S, "true", fs);
    maxACTT = getSPM(T, "true", fs);
    
    % EIXO DOS XX
    figure();
    tiledlayout(1,3);
    nexttile;
    
    % dinamic
    maxWx = cell2mat(maxACTD{1,1}{1,1});
    maxWUx = cell2mat(maxACTD{1,2}{1,1});
    maxWDx = cell2mat(maxACTD{1,3}{1,1});
    plot(maxWx, 'ob');
    hold on;
    plot(maxWUx, 'ob');
    hold on;
    plot(maxWDx, 'ob');
    hold on;

    maxDx = max([max(maxWx), max(maxWUx), max(maxWDx)]);
    minDx = min([min(maxWx), min(maxWUx), min(maxWDx)]);
    Dx = [maxWx, maxWUx, maxWDx];
    upperBound = 0:length(maxWx);
    upperBound(1:end) = maxDx;
    area(upperBound,'basevalue', minDx, 'ShowBaseLine', 'off', 'FaceAlpha', 0.4, 'LineStyle', 'none', 'FaceColor', 'green');
     
        
    % static
    maxSITx = cell2mat(maxACTS{1,1}{1,1});
    maxLAYx = cell2mat(maxACTS{1,2}{1,1});
    maxSTANDx = cell2mat(maxACTS{1,3}{1,1});

    plot(maxSITx, 'or');
    hold on;
    plot(maxLAYx, 'or');
    hold on;
    plot(maxSTANDx, 'or');
    
    % transition
    maxSTAND2SITx = cell2mat(maxACTT{1,1}{1,1});
    maxSIT2STANDx = cell2mat(maxACTT{1,2}{1,1});
    maxSIT2LIEx = cell2mat(maxACTT{1,3}{1,1});
    maxLIE2SITx = cell2mat(maxACTT{1,4}{1,1});
    maxSTAND2LIEx = cell2mat(maxACTT{1,5}{1,1});
    maxLIE2STANDx = cell2mat(maxACTT{1,6}{1,1});
%     maxTx = max([max(maxSTAND2SITx), max(maxSIT2STANDx), max(maxSIT2LIEx), max(maxLIE2SITx), max(maxSTAND2LIEx), max(maxLIE2STANDx)]);
%     minTx = min([min(maxSTAND2SITx), min(maxSIT2STANDx), min(maxSIT2LIEx), min(maxLIE2SITx), min(maxSTAND2LIEx), min(maxLIE2STANDx)]);
%     
%     maxNDx = max(maxTx, maxSx);
%     minNDx = min(minTx, minSx);

    NDx = [maxSITx, maxLAYx, maxSTANDx, ...
        maxSTAND2SITx, maxSIT2STANDx, maxSIT2LIEx, maxLIE2SITx, maxSTAND2LIEx, maxLIE2STANDx];
    
    hold on;
    plot(maxSTAND2SITx, 'og');
    plot(maxSIT2STANDx, 'og');
    plot(maxSIT2LIEx, 'og');
    plot(maxLIE2SITx, 'og');
    plot(maxSTAND2LIEx, 'og');
    plot(maxLIE2STANDx, 'og');
    
    xlabel("X-AXIS");
    ylabel("DFT AMPLITUDE");
    hold off
    
    % EIXO DOS YY
    nexttile;
    % dinamic
    maxWy = cell2mat(maxACTD{1,1}{1,2});
    maxWUy = cell2mat(maxACTD{1,2}{1,2});
    maxWDy = cell2mat(maxACTD{1,3}{1,2});
    maxDy = max([max(maxWy), max(maxWUy), max(maxWDy)]);
    minDy = min([min(maxWy), min(maxWUy), min(maxWDy)]);
    hold on ;
    plot(maxWy, 'ob');
    plot(maxWUy, 'ob');
    plot(maxWDy, 'ob');
    
    Dy = [maxWy, maxWUy, maxWDy];
    
    upperBound = 0:length(maxWy);
    upperBound(1:end) = maxDy;
    area(upperBound,'basevalue', minDy, 'ShowBaseLine', 'off', 'FaceAlpha', 0.4, 'LineStyle', 'none', 'FaceColor', 'green');
    
    % static
    maxSITy = cell2mat(maxACTS{1,1}{1,2});
    maxLAYy = cell2mat(maxACTS{1,2}{1,2});
    maxSTANDy = cell2mat(maxACTS{1,3}{1,2});
    plot(maxSITy, 'or');
    hold on;
    plot(maxLAYy, 'or');
    hold on;
    plot(maxSTANDy, 'or');
    
    % transition
    maxSTAND2SITy = cell2mat(maxACTT{1,1}{1,2});
    maxSIT2STANDy = cell2mat(maxACTT{1,2}{1,2});
    maxSIT2LIEy = cell2mat(maxACTT{1,3}{1,2});
    maxLIE2SITy = cell2mat(maxACTT{1,4}{1,2});
    maxSTAND2LIEy = cell2mat(maxACTT{1,5}{1,2});
    maxLIE2STANDy = cell2mat(maxACTT{1,6}{1,2});
    
    hold on;
    plot(maxSTAND2SITy, 'og');
    plot(maxSIT2STANDy, 'og');
    plot(maxSIT2LIEy, 'og');
    plot(maxLIE2SITy, 'og');
    plot(maxSTAND2LIEy, 'og');
    plot(maxLIE2STANDy, 'og');
    
    xlabel("Y-AXIS");
    title("MAX DFT AMPLITUDE FOR XYZ");
    
    NDy = [maxSITy, maxLAYy, maxSTANDy, ...
        maxSTAND2SITy, maxSIT2STANDy, maxSIT2LIEy, maxLIE2SITy, maxSTAND2LIEy, maxLIE2STANDy];
    
    % EIXO DOS ZZ
    nexttile;
    hold on;
    % dinamic
    maxWz = cell2mat(maxACTD{1,1}{1,3});
    maxWUz = cell2mat(maxACTD{1,2}{1,3});
    maxWDz = cell2mat(maxACTD{1,3}{1,3});
    plot(maxWz, 'ob');
    plot(maxWUz, 'ob');
    plot(maxWDz, 'ob');
    
    Dz = [maxWz, maxWUz, maxWDz];

    maxDz = max([max(maxWz), max(maxWUz), max(maxWDz)]);
    minDz = min([min(maxWz), min(maxWUz), min(maxWDz)]);
    upperBound = 0:length(maxWz);
    upperBound(1:end) = maxDz;
    area(upperBound,'basevalue', minDz, 'ShowBaseLine', 'off', 'FaceAlpha', 0.4, 'LineStyle', 'none', 'FaceColor', 'green');

    % static
    maxSITz = cell2mat(maxACTS{1,1}{1,3});
    maxLAYz = cell2mat(maxACTS{1,2}{1,3});
    maxSTANDz = cell2mat(maxACTS{1,3}{1,3});

    hold on;
    plot(maxSITz, 'or');
    plot(maxLAYz, 'or');
    plot(maxSTANDz, 'or');
    
    % transition
    maxSTAND2SITz = cell2mat(maxACTT{1,1}{1,3});
    maxSIT2STANDz = cell2mat(maxACTT{1,2}{1,3});
    maxSIT2LIEz = cell2mat(maxACTT{1,3}{1,3});
    maxLIE2SITz = cell2mat(maxACTT{1,4}{1,3});
    maxSTAND2LIEz = cell2mat(maxACTT{1,5}{1,3});
    maxLIE2STANDz = cell2mat(maxACTT{1,6}{1,3});
    
    hold on;
    plot(maxSTAND2SITz, 'og');
    plot(maxSIT2STANDz, 'og');
    plot(maxSIT2LIEz, 'og');
    plot(maxLIE2SITz, 'og');
    plot(maxSTAND2LIEz, 'og');
    plot(maxLIE2STANDz, 'og');

    NDz = [maxSITz, maxLAYz, maxSTANDz, ...
        maxSTAND2SITz, maxSIT2STANDz, maxSIT2LIEz, maxLIE2SITz, maxSTAND2LIEz, maxLIE2STANDz];

%     xlabel("Z-AXIS");
end

