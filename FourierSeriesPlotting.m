% By KHOA NGO
% Requires FourierSeries.m
% Fourier Series approximation of 3 different functions to the 4th and 8th degrees. 

clc
clearvars

syms x

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      3 sample functions       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Function 1: Parabola
f_1 = x.^2;

% Function 2: Piecewise (jump discontinuity)
f_2 = piecewise(x < -2, -5, -2 <= x < 1, 0, x >= 1, -1);

slope_1 = 1/(-1 + pi());
y_intercept_1 = 1 + 1/(-1 + pi());
segment_1 = slope_1 * x + y_intercept_1;

slope_2 = -5/3;
y_intercept_2 = -4 + 10/3;
segment_2 = slope_2 * x + y_intercept_2;

slope_3 = 7/(pi() - 2);
y_intercept_3 = 3 - 7 * pi()/(pi() - 2);
segment_3 = slope_3 * x + y_intercept_3;

% Function 3: Piecewise (smooth)
f_3 = piecewise(-pi() < x < -1, segment_1, -1 < x < 2, segment_2, 2 < x < pi(), segment_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   4th degree Fourier Series   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);
fplot(f_1, [-pi(), pi()]);
grid on;
hold on;
FS1 = FourierSeries(f_1, 4);
fplot(FS1, [-pi(), pi()]);
title('Function 1 Fourier Series Approximation (4th degree)')
legend({'f(x)','$\mathcal{F}$(x)'}, 'Location', 'southwest', 'Interpreter', 'latex')
hold off;
%Fourier series approximation works well for continuous functions.
%Therefore, the approximation is close at all points.

figure(2);
fplot(f_2, [-pi(), pi()]);
grid on;
hold on;
FS2 = FourierSeries(f_2, 4);
fplot(FS2, [-pi(), pi()]);
title('Function 2 Fourier Series Approximation (4th degree)')
legend({'f(x)','$\mathcal{F}$(x)'}, 'Location', 'southwest', 'Interpreter', 'latex')
hold off;
%The approximation works poorly for piecewise functions
%with high vertical displacements between each segment.
%Therefore, the approximation is only close at some points.

figure(3);
fplot(f_3, [-pi(), pi()]);
grid on;
hold on;
FS3 = FourierSeries(f_3, 4);
fplot(FS3, [-pi(), pi()]);
title('Function 3 Fourier Series Approximation (4th degree)')
legend({'f(x)','$\mathcal{F}$(x)'}, 'Location', 'southwest', 'Interpreter', 'latex')
hold off;
%The approximation works well in this case
%when there are no vertical displacements between each segment.
%Therefore, the approximation is close at all points,
%but still not as good compared to that of a smooth, continuous functions.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   8th degree Fourier Series   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4);
fplot(f_1, [-pi(), pi()]);
grid on;
hold on;
FS1 = FourierSeries(f_1, 8);
fplot(FS1, [-pi(), pi()]);
title('Function 1 Fourier Series Approximation (8th degree)')
legend({'f(x)','$\mathcal{F}$(x)'}, 'Location', 'southwest', 'Interpreter', 'latex')
hold off;
%The approximation's accuracy improves at higher degree.
%Therefore, the approximation is even closer at all points compared to before.

figure(5);
fplot(f_2, [-pi(), pi()]);
grid on;
hold on;
FS2 = FourierSeries(f_2, 8);
fplot(FS2, [-pi(), pi()]);
title('Function 2 Fourier Series Approximation (8th degree)')
legend({'f(x)','$\mathcal{F}$(x)'}, 'Location', 'southwest', 'Interpreter', 'latex')
hold off;
%The approximation's accuracy improved a bit,
%however, the approximation is still only close at some points.

figure(6);
fplot(f_3, [-pi(), pi()]);
grid on;
hold on;
FS3 = FourierSeries(f_3, 8);
fplot(FS3, [-pi(), pi()]);
title('Function 3 Fourier Series Approximation (8th degree)')
legend({'f(x)','$\mathcal{F}$(x)'}, 'Location', 'southwest', 'Interpreter', 'latex')
hold off;
%The approximation's accuracy improved a bit.
%The approximation is now as close at all points as the case in Figure 1.
