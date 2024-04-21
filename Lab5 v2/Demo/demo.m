clc
clear all
close all
w_razomkn = tf([6], [1, 6, 11, 7, 0]);
f_x = feedback(w_razomkn, 1, -1);
plotoptions= nyquistoptions('cstprefs') ;   % default options
plotoptions.ShowFullContour = 'off';        % exclude negative frequencies
nyquist(w_razomkn, plotoptions);
[num, den] = tfdata(f_x);
hurwitz = hurwitz_matrix(den);
% в дз реализовать проверку на положительность коэффициентов на главной диагонали
% и проверку определителей
det(hurwitz)
det(hurwitz(1:3, 1:3))
det(hurwitz(1:2, 1:2))
det(hurwitz(1:1, 1:1))
