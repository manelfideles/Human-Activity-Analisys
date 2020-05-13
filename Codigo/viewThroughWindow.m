function aux = viewThroughWindow(activity, type)
    xx = activity{1,1}{1,1};
    yy = activity{1,2}{1,1};
    zz = activity{1,3}{1,1};
    if (type == "hann")
        window = hann(length(xx));
        aux = xx .* window;
        %wvtool(window);
    else
        window = hamming(length(xx));
        aux = xx .* window;
        %wvtool(window);
    end
    
%     L = numel(xx);
%     fs = 50;
%     if (mod(L,2)==0)
%         f = -fs/2 : fs/L : fs/2-fs/L;
%     else
%         f = -fs/2+fs/(2*L) : fs/L : fs/2-fs/(2*L);
%     end
    
%     tiledlayout(1,2);
%     nexttile;
%     plot(f, xx);
%     xlabel("freq");
%     ylabel("amplitude");
%     title("w/out window");
%     nexttile;
%     plot(f, aux);
%     xlabel("freq");
%     ylabel("amplitude");
%     title("w/ window");
end

