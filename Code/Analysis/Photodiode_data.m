data = mlread();
data_num = size(data,2);
PhotoDiode_data = cell(data_num,2);
for i = 1:data_num
   % 每一个数据进行计算 
   marker = data(i).BehavioralCodes.CodeNumbers;
   time_event = data(i).BehavioralCodes.CodeTimes;
   first_on = ceil(time_event(find(marker == 103)-1));% 第一个视觉刺激开始的相对时间
   first_off = ceil(time_event(marker == 103));       % 第一个视觉刺激结束的相对时间
   second_on = ceil(time_event(marker == 104));       % 第二个视觉刺激开始的相对时间
   second_off = ceil(time_event(marker == 105));      % 第二个视觉刺激结束的相对时间
   PhotoDiode = data(i).AnalogData.PhotoDiode;
   PhotoDiode_data{i,1} = PhotoDiode(first_on:first_off);
   PhotoDiode_data{i,2} = PhotoDiode(second_on:second_off);
end
i1 = 1;i2 = 1;
for i = 1:data_num*2
   % 每个间隔进行画图
   figure
   plot(PhotoDiode_data{i1,i2})
   if i2 == 2,i1 = i1 + 1;end
   if i2 == 1,i2 = 2;else,i2 = 1;end
end

%% 
for i = data_num
    data_i = i;
    draw_data = data(data_i).AnalogData.PhotoDiode;
    draw_lineX = data(data_i).BehavioralCodes.CodeTimes';
    figure
    plot(draw_data)
    hold on
    %line([起点x1,起点x2;终点x1,终点x2],[起点y1,起点y2;终点y1,终点y2])
    line([draw_lineX;draw_lineX],[ones(1,length(draw_lineX)).*4.9;ones(1,length(draw_lineX)).*4.6])
end

% 看某一个具体的数据内的内容
data_i = 9;
figure
plot(data(data_i).AnalogData.PhotoDiode(100:500))
set(gca,'xtick',(0:1:51))% 设置y轴显示的标尺
min_data = find(PhotoDiode_data{data_i,1} == min(PhotoDiode_data{data_i,1}(1000:end)));
plot(PhotoDiode_data{data_i,1}(min_data(end)-10:end))
hold on
% line([(1:30);(1:30)],[ones(1,30).*4.65;ones(1,30).*4.8])
plot(PhotoDiode_data{data_i,1}(min_data(end)-10:min_data(end)+20))

%% 滤波
data_i = 20;
signal_num = [1550,1700];
signal = data(data_i).AnalogData.PhotoDiode(signal_num(1):signal_num(2));
marker_t = data(data_i).BehavioralCodes.CodeTimes(4);
t= (0:size(signal,1)-1);
[b,a] = butter(6,0.15*2,'low' );
B = filtfilt(b,a,signal);
figure()
plot(t,signal)
hold on
plot(t,B)
line([marker_t-signal_num(1);marker_t-signal_num(1)],[4.85;4.65],'Color','r')
% legend('原函数','滤波')

