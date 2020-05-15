function dftACT = calcActivityDFT(activities, fs)
    % calculate DFTs
    dftACT = {};
    for i=1:length(activities)
        ACT = activities{i};
        dftAXIS = {};
        for j=1:3
            OCC = ACT{j};
            dftOCC = {};
            for k=1:length(OCC)
                dft = abs(fftshift(fft(OCC{k})));
                dftOCC{k} = dft;
            end
            dftAXIS{j} = dftOCC;
        end
        dftACT{i} = dftAXIS;
    end
        
    % for plotting
%     L = numel(activities{1, 1}{1, 1});
%     if (mod(L,2)==0)
%         f = -fs/2 : fs/L : fs/2-fs/L;
%     else
%         f = -fs/2+fs/(2*L) : fs/L : fs/2-fs/(2*L);
%     end
    
end

