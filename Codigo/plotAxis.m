function plotAxis(dftDINAMICwin, fs, t, mode, axis)
% 1 - X
% 2 - Y
% 3 - Z
    labels = ["W", "W-U", "W-D"];
    for i=1:length(dftDINAMICwin)
        ACT = dftDINAMICwin{i};
        figure();
        tiledlayout(1, length(ACT{3}));
        for j=1:length(ACT{3})
            nexttile;
            OCC = ACT{axis};
            if (mode == "dft")
                L = numel(OCC{j});
                if (mod(L,2)==0)
                    f = -fs/2 : fs/L : fs/2-fs/L;
                else
                    f = -fs/2+fs/(2*L) : fs/L : fs/2-fs/(2*L);
                end
                plot(f, OCC{j});
                if j==round(length(OCC)/2)
                    title(strcat("X-Axis DFT for occurrences of ", labels{i}));
                end
            else
                plot(t(1:length(OCC{j}))-1, OCC{j});
                if j==round(length(OCC)/2)
                    title(strcat("X-Axis for occurrences of ", labels{i}));
                end
            end
            xlabel(j);
        end
    end
end

