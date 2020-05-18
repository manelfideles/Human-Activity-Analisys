function [St, Tt] = plotDuration(STATICwin, TRANSITIONwin, fs)
    durACTS = getDuration(STATICwin, fs);
    durACTT = getDuration(TRANSITIONwin, fs);
   
    figure();
    % static
    lenSIT = cell2mat(durACTS{1,1});
    lenLAY = cell2mat(durACTS{1,2});
    lenSTAND = cell2mat(durACTS{1,3});
    maxS = max([max(lenSIT), max(lenLAY), max(lenSTAND)]);
    minS = min([min(lenSIT), min(lenLAY), min(lenSTAND)]);
    hold on;
    plot(lenSIT, 'or');
    plot(lenLAY, 'or');
    plot(lenSTAND, 'or');
    
    %area
    upperBound = 0:length(lenSIT);
    upperBound(1:end) = maxS;
    area(upperBound,'basevalue', minS, 'ShowBaseLine', 'off', 'FaceAlpha', 0.2, 'LineStyle', 'none', 'FaceColor', 'blue');
    
    % transition
    lenSTAND2SIT = cell2mat(durACTT{1,1});
    lenSIT2STAND = cell2mat(durACTT{1,2});
    lenSIT2LIE = cell2mat(durACTT{1,3});
    lenLIE2SIT = cell2mat(durACTT{1,4});
    lenSTAND2LIE = cell2mat(durACTT{1,5});
    lenLIE2STAND = cell2mat(durACTT{1,6});
    plot(lenSTAND2SIT, 'ob');
    plot(lenSIT2STAND, 'ob');
    plot(lenSIT2LIE, 'ob');
    plot(lenLIE2SIT, 'ob');
    plot(lenSTAND2LIE, 'ob');
    plot(lenLIE2STAND, 'ob');
    
    xlabel("Ocurrences");
    ylabel("Duration [min]");
    
    St = [lenSIT, lenLAY, lenSTAND];
    Tt = [lenSTAND2SIT, lenSIT2STAND, lenSIT2LIE, lenLIE2SIT, lenSTAND2LIE, lenLIE2STAND];

end

