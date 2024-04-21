k1 = 120;
k2 = 30;
T = 18;
T1 = 0.02;
tau = 3;
w1 = tf([tau, 1], [T, 1]);
[w1_num, w1_den] = tfdata(w1);
w1_num = cell2mat(w1_num);
w1_den = cell2mat(w1_den);
w2 = tf([k1], [T1 1 0]);
[w2_num, w2_den] = tfdata(w2);
w2_num = cell2mat(w2_num);
w2_den = cell2mat(w2_den);
w3 = tf([k2], [1, 0]);
[w3_num, w3_den] = tfdata(w3);
w3_num = cell2mat(w3_num);
w3_den = cell2mat(w3_den);
w4 = tf([10],[1]);
[w4_num, w4_den] = tfdata(w4);
w4_num = cell2mat(w4_num);
w4_den = cell2mat(w4_den);
w24 = feedback(w2, w4, -1);
w124 = series(w1, w24);
w1234 = series(w124, w3);
f_x = feedback(w1234, 1, -1);
plotoptions= nyquistoptions('cstprefs') ;   % default options
plotoptions.ShowFullContour = 'off';        % exclude negative frequencies
nyquist(w_razomkn, plotoptions);
[num, den] = tfdata(f_x);
hurwitz = hurwitz_matrix(den);
% в дз реализовать проверку на положительность коэффициентов на главной диагонали
% и проверку определителей
det(hurwitz)
det(hurwitz(1:4, 1:4))
det(hurwitz(1:3, 1:3))
det(hurwitz(1:2, 1:2))
det(hurwitz(1:1, 1:1))
