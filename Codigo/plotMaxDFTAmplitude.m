function [maxW, maxWU, maxWD] = plotMaxDFTAmplitude(D)
    maxACTD = [];
    for i=1:length(D)
        ACT = D{i};
        maxAXIS = [];
        for j = 1:3
            OCC = ACT{j};
            maxOCC = [];
            for k = 1:length(OCC)
                maxAmplitude = max(OCC{k});
                maxOCC{k} = maxAmplitude;
            end
            maxAXIS{j} = maxOCC;
        end
        maxACTD{i} = maxAXIS;
    end
    
    maxWx = cell2mat(maxACTD{1,1}{1,1});
    maxWUx = cell2mat(maxACTD{1,2}{1,1});
    maxWDx = cell2mat(maxACTD{1,3}{1,1});

    maxWy = cell2mat(maxACTD{1,1}{1,2});
    maxWUy = cell2mat(maxACTD{1,2}{1,2});
    maxWDy = cell2mat(maxACTD{1,3}{1,2});

    maxWz = cell2mat(maxACTD{1,1}{1,3});
    maxWUz = cell2mat(maxACTD{1,2}{1,3});
    maxWDz = cell2mat(maxACTD{1,3}{1,3});
   
    maxW = [{maxWx}, {maxWy}, {maxWz}];
    maxWU = [{maxWUx}, {maxWUy}, {maxWUz}];
    maxWD = [{maxWDx}, {maxWDy}, {maxWDz}];
end

