N = 1024;% ����������
Fs = 1000; % ����Ƶ��
t = (0:1/Fs:(N-1)/Fs); % ����ʱ��

x = (0:2*pi/N:2*pi-2*pi/N);
y = sin(x);
s = y; 
% s=2+3*cos(2*pi*200*t+60*pi/180)+4*cos(2*pi*300*t+120*pi/180);  % ���źŲ���
F = fft(s);
% FFT��һ��Ϊԭʼ�źŵ�ֱ����������ģֵΪԭʼ�ź�ģֵ��N��

% FFT�����N/2(����ΪƵ�ʼ�Ϊ�˿�˹��Ƶ�ʣ�Fs/2)�Գơ��������ֻ��Ҫǰ�벿�ֵĽ��
i = 1:N/2;
% ��k������ʾ��Ƶ��Ϊ��FK=(K-1)Fs/N������FFT���ܴﵽ��Ƶ�ʷֱ���ΪFs/N��
draw_Fs = (i-1).*(Fs/N); % FFT֮��ÿ�����Ӧ��Ƶ��ֵ
% ��Ƶ���Ӧ��FFT�㸴����ģֵΪ��ֵ��N/2��
draw_A = abs(F(i))./(N/2);
draw_Angle = angle(F(i));
% ԭʼͼ��
figure
plot(t,s);
% �����
figure
plot(draw_Fs,draw_A);
% ��λ��
figure
plot(draw_Fs,draw_Angle);

