N = 1024;% 采样点数量
Fs = 1000; % 采样频率
t = (0:1/Fs:(N-1)/Fs); % 采样时刻

x = (0:2*pi/N:2*pi-2*pi/N);
y = sin(x);
s = y; 
% s=2+3*cos(2*pi*200*t+60*pi/180)+4*cos(2*pi*300*t+120*pi/180);  % 对信号采样
F = fft(s);
% FFT第一点为原始信号的直流分量，其模值为原始信号模值的N倍

% FFT结果以N/2(换算为频率即为乃奎斯特频率，Fs/2)对称。因此我们只需要前半部分的结果
i = 1:N/2;
% 第k点所表示的频率为：FK=(K-1)Fs/N。所以FFT所能达到的频率分辨率为Fs/N。
draw_Fs = (i-1).*(Fs/N); % FFT之后每个点对应的频率值
% 该频点对应的FFT点复数的模值为幅值的N/2倍
draw_A = abs(F(i))./(N/2);
draw_Angle = angle(F(i));
% 原始图像
figure
plot(t,s);
% 振幅谱
figure
plot(draw_Fs,draw_A);
% 相位谱
figure
plot(draw_Fs,draw_Angle);

