function [acc_x, acc_y, acc_z] = openExperimentFile(matfiles, i)
    f2 = fopen([matfiles(i).folder '\' matfiles(i).name]);
    acc_data = textscan(f2, '%f %f %f');
    acc_x = acc_data{1};
    acc_y = acc_data{2};
    acc_z = acc_data{3};
    fclose(f2);
end

