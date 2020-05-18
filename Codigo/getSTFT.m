function getSTFT(z_axis, fs)
    Ts = 1/fs;
    N = numel(z_axis);
    t = N * Ts;
    Tframe = 0.005 * t;
    Toverlap = Tframe/2;
    Nframe = round(Tframe*fs);
    h = hamming(Nframe);
    
    Noverlap = round(Toverlap*fs);
    spectrum = [];
    f = linspace(-fs/2,fs/2,Nframe);
    x = f>=0;
    for ii = 1:Nframe-Noverlap:N-Nframe
        x_frame = z_axis(ii:ii+Nframe-1) .* h;
        m_X_frame = abs(fftshift(fft(x_frame)));
        spectrum = [spectrum, m_X_frame(x)];
    end
    figure();
    imagesc(log10(spectrum));
    set(gca,'YDir','normal');
    hold on
    xlabel("Time");
    ylabel("Amplitude [dB]");

    
    
end

