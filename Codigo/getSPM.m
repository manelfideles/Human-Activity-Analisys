function my_spm = getSPM(dftACT, all, fs)
    % max freq para o eixo dos x
    % recebe uma atividade
    if (all == "false")
        OCC = dftACT{1};
        spmOCC = [];
        for j = 1:length(OCC)
            L = numel(OCC{j});
            if (mod(L,2)==0)
                f = -fs/2 : fs/L : fs/2-fs/L;
            else
                f = -fs/2+fs/(2*L) : fs/L : fs/2-fs/(2*L);
            end
            peaks = findpeaks(OCC{j});
            mag = peaks(peaks == max(peaks));
            mag = mag(1);
            C = OCC{j};
            spm_ind = C == mag;
            spm = f(spm_ind);
            spmOCC(j) = abs(spm(1)) * 60;
        end
        my_spm = mean(spmOCC);
    else
    % max freq para os 3 eixos;
    % recebe um vector de atividades
        my_spm = [];
        for i=1:length(dftACT)
            ACT = dftACT{i};
            maxAXIS = [];
            for j = 1:3
                OCC = ACT{j};
                maxOCC = [];
                for k = 1:length(OCC)
                    L = numel(OCC{k});
                    if (mod(L,2)==0)
                        f = -fs/2 : fs/L : fs/2-fs/L;
                    else
                        f = -fs/2+fs/(2*L) : fs/L : fs/2-fs/(2*L);
                    end
                    maxAmplitude = max(OCC{k});
                    C = OCC{k};
                    ind = C == maxAmplitude;
                    maxFreq = f(ind);
                    maxOCC{k} = abs(maxFreq);
                end
                maxAXIS{j} = maxOCC;
            end
            my_spm{i} = maxAXIS;
        end
    end
end

