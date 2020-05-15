close all;
clear;

matfiles = dir( fullfile('dataset\', '*.txt' ));

fs = 50;

%Activity labels
labels_fid = fopen('dataset\activity_labels.txt');
activity_labels = textscan(labels_fid, '%d %s');
activity_labels = activity_labels{2};

%Activity intervals
f = fopen('dataset\labels.txt');
lines = textscan(f, '%d %d %d %d %d');
experiment_id = lines{1};
user_id = lines{2};
activity_id = lines{3};
label_start = lines{4};
label_end = lines{5};
fclose(f);

every_spmW = [];
every_spmWU = [];
every_spmWD = [];

for i=1:1 %length(matfiles) - 2
    
    % 3 - IMPORTING AND PLOTTING RAW DATA
    % open data file
    [acc_x, acc_y, acc_z] = openExperimentFile(matfiles, i);
    experiment_window = find(experiment_id == i);
    sample_time = linspace(1, length(acc_x) / (fs * 60), length(acc_x));
    
    % plot raw data and label activities from file
    %figure(i);
    plotExperiment(sample_time, acc_x, acc_y, ...
        acc_z, label_start, label_end, activity_labels, ...
        activity_id, experiment_window);Dis
    
    % 4 - ANALYSIS
    % 4.1 - Calculating the DFT and comparing windows
    W = getActivityVectors("W", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    WU = getActivityVectors("W-U", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    WD = getActivityVectors("W-D", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    SIT = getActivityVectors("SIT", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    STAND = getActivityVectors("STAND", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    LAY = getActivityVectors("LAY", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    STAND2SIT = getActivityVectors("STAND-SIT", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    SIT2STAND = getActivityVectors("SIT-STAND", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    SIT2LIE = getActivityVectors("SIT-LIE", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    LIE2SIT = getActivityVectors("LIE-SIT", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    STAND2LIE = getActivityVectors("STAND-LIE", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    LIE2STAND = getActivityVectors("LIE-STAND", label_start, label_end, acc_x, acc_y, acc_z, experiment_window, activity_id, activity_labels);
    
    DINAMIC = {W, WU, WD};
    STATIC = {SIT, LAY, STAND};
    TRANSITION = {STAND2SIT, SIT2STAND, SIT2LIE, LIE2SIT, STAND2LIE, LIE2STAND};
    
    % DFT for raw signals
    dftDINAMIC = calcActivityDFT(DINAMIC, fs);
    dftSTATIC = calcActivityDFT(STATIC, fs);
    dftTRANSITION = calcActivityDFT(TRANSITION, fs);
    
    % Raw signal w/ windowing
    % Hann (good for most cases, eliminates discontinuities)
%     DINAMICwin = viewThroughWindow(DINAMIC, "hann");
%     STATICwin = viewThroughWindow(STATIC, "hann");
%     TRANSITIONwin = viewThroughWindow(TRANSITION, "hann");
    
    % Hamming (good freq.res, detects fair amount of m components)
    DINAMICwin = viewThroughWindow(DINAMIC, "hamming");
    STATICwin = viewThroughWindow(STATIC, "hamming");
    TRANSITIONwin = viewThroughWindow(TRANSITION, "hamming");
    
    % DFT w/ windowing
    % Hann
%     dftDINAMICwin = viewThroughWindow(dftDINAMIC, "hann");
%     dftSTATICwin = viewThroughWindow(dftSTATIC, "hann");
%     dftTRANSITIONwin = viewThroughWindow(dftTRANSITION, "hann");
    
    %Hamming
    dftDINAMICwin = viewThroughWindow(dftDINAMIC, "hamming");
    dftSTATICwin = viewThroughWindow(dftSTATIC, "hamming");
    dftTRANSITIONwin = viewThroughWindow(dftTRANSITION, "hamming");
    
    % 4.2 - Step stats for dynamic activities
    spmW = getSPM(dftDINAMICwin{1}, "false", fs);
    spmWU = getSPM(dftDINAMICwin{2}, "false", fs);
    spmWD = getSPM(dftDINAMICwin{3}, "false", fs);
    every_spmW(i) = spmW;
    every_spmWU(i) = spmWU;
    every_spmWD(i) = spmWD;
    
    % Usámos apenas os valores do deslocamento no eixo xx
    % pois é nesse eixo que grande parte do movimento se processa.
    % Como é explicado nos videos (falta link) que acompanham o artigo,
    % os sujeitos andam em linha reta, sem deslocamento lateral 
    % ou vertical (excetuando WU e WD) e, como tal, as medições nos
    % eixos yy e zz descriminam com menos fidelidade a frequência da passada.
    
    % The cadence range of an average person walking is [90, 130] steps/min
    % [BenAbdelkader et al., 2002] which denotes a minimum speed of 1.5 steps/sec;
    
    
    % 4.3 - Distinguishing dynamic from static/transition activities
    % Comparing signals amplitude-wise
    %plotMaxAmplitude(DINAMICwin, STATICwin, TRANSITIONwin);
    % Comparing signals frequency-wise
    plotMaxFrequency(dftDINAMICwin, dftSTATICwin, dftTRANSITIONwin, fs);
    % Comparing signals period-wise
    %plotDuration()
    
    % 4.4 - Distinguishing non-dynamic activities
    

    % 4.5 - Distinguishing dynamic activities
    % Empiricamente, a única diferença entre W, WU, WD é a quantidade
    % de deslocamento no eixo dos ZZ. Assim sendo, optamos por isolar e
    % processar as medições no eixo dos zz de cada atividade.
    % Iremos utilizar, numa 1a abordagem, os sinais raw - para analisar possíveis
    % discrepâncias de amplitude entre as medições no eixo dos zz.
    % Posteriormente, utilizaremos também a amplitude
    
end

% Correct outliers and calculate stats for SPM

every_smpW_no_outliers = filloutliers(every_spmW, 'pchip');
every_smpWU_no_outliers = filloutliers(every_spmWU, 'pchip');
every_smpWD_no_outliers = filloutliers(every_spmWD, 'pchip');

mean_spm_W = mean(every_smpW_no_outliers);
mean_spm_WU = mean(every_smpWU_no_outliers);
mean_spm_WD = mean(every_smpWD_no_outliers);

std_spm_W = std(every_smpW_no_outliers);
std_spm_WU = std(every_smpWU_no_outliers);
std_spm_WD = std(every_smpWD_no_outliers);
