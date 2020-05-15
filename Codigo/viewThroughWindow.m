function ACTwin = viewThroughWindow(ACTIVITIES, window_type)
    ACTwin = {};
    for i = 1 : length(ACTIVITIES)
        ACT = ACTIVITIES{i};
        AXISwin = {};
        for j = 1:3
            OCC = ACT{j};
            OCCwin = {};
            for k = 1:length(OCC)
                VEC = OCC{k};
                if (window_type == "hann")
                    window = hann(length(VEC));
                    %wvtool(window);
                else
                    window = hamming(length(VEC));
                    %wvtool(window);
                end
                OCCwin{k} = VEC .* window;
            end
            AXISwin{j} = OCCwin;
        end
        ACTwin{i} = AXISwin;
    end
    
%     L = numel(xx);
%     fs = 50;
%     if (mod(L,2)==0)
%         f = -fs/2 : fs/L : fs/2-fs/L;
%     else
%         f = -fs/2+fs/(2*L) : fs/L : fs/2-fs/(2*L);
%     end
    
end

