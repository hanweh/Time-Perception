% 计算加速/减速情况下可能被识别为独立事件的数量
%% 
clear all;clc;
%% 基础设置
Dot_num_first = 90;
angle = 360;
%% 
accelerate = 2*angle/((Dot_num_first-1)^2);% S = 1/2 * a * t^2,并且最后点回到原来位置(起始和终止重合)
angle_dot_first = zeros(1,Dot_num_first);
%匀加速运动
for ii = 2:Dot_num_first
    angle_dot_first(ii) = (accelerate * ((ii-1)^2))/2;
end
angle_dot_first = fliplr(angle_dot_first); % 将行左右翻转
angle_dif = abs(diff(angle_dot_first)); % 两个点之间的角度差
angle_s = angle/(Dot_num_first-1); % 匀速运动时的角度差

%% 计算事件数量
EventId = find(angle_dif<angle_s,1); % 最后一个被认为是独立事件的点
angle_r = angle_dot_first(EventId + 1) - angle_s; % 还有多少角度可以被用来计算独立事件
SingleEvent = EventId + 1 + floor(angle_r/angle_s); % 一共包括多少事件
text = ['一共包括 ',num2str(SingleEvent),' 个事件'];
disp(text);