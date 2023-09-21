data = mlread();
data_num = size(data,2);
PhotoDiode_data = cell(data_num,2);
for i = 1:data_num
   % ÿһ�����ݽ��м��� 
   marker = data(i).BehavioralCodes.CodeNumbers;
   time_event = data(i).BehavioralCodes.CodeTimes;
   first_on = ceil(time_event(find(marker == 103)-1));% ��һ���Ӿ��̼���ʼ�����ʱ��
   first_off = ceil(time_event(marker == 103));       % ��һ���Ӿ��̼����������ʱ��
   second_on = ceil(time_event(marker == 104));       % �ڶ����Ӿ��̼���ʼ�����ʱ��
   second_off = ceil(time_event(marker == 105));      % �ڶ����Ӿ��̼����������ʱ��
   PhotoDiode = data(i).AnalogData.PhotoDiode;
   PhotoDiode_data{i,1} = PhotoDiode(first_on:first_off);
   PhotoDiode_data{i,2} = PhotoDiode(second_on:second_off);
end
i1 = 1;i2 = 1;
for i = 1:data_num*2
   % ÿ��������л�ͼ
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
    %line([���x1,���x2;�յ�x1,�յ�x2],[���y1,���y2;�յ�y1,�յ�y2])
    line([draw_lineX;draw_lineX],[ones(1,length(draw_lineX)).*4.9;ones(1,length(draw_lineX)).*4.6])
end

% ��ĳһ������������ڵ�����
data_i = 9;
figure
plot(data(data_i).AnalogData.PhotoDiode(100:500))
set(gca,'xtick',(0:1:51))% ����y����ʾ�ı��
min_data = find(PhotoDiode_data{data_i,1} == min(PhotoDiode_data{data_i,1}(1000:end)));
plot(PhotoDiode_data{data_i,1}(min_data(end)-10:end))
hold on
% line([(1:30);(1:30)],[ones(1,30).*4.65;ones(1,30).*4.8])
plot(PhotoDiode_data{data_i,1}(min_data(end)-10:min_data(end)+20))

%% �˲�
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
% legend('ԭ����','�˲�')

