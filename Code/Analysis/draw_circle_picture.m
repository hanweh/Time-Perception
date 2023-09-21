clc;clear;
%% ����ʵ������
Hz_Threshold = 30;
current_block = 2;
current_condition = 1;
refresh_rate = 120;

Center = [0 0];%���ô̼����ֵ�λ��
Radius = 5; %degree
Dot_size = 0.5;
Dot_color = [1 0 0];
idle_color = [0 0 0];
angle = [0,2*pi];

%% ʵ���������
if find(current_block == 1)
    real_condition_list = (1:24);test_condition_list = (25:32);
elseif find(current_block == 2)
    real_condition_list = (1:24);test_condition_list = (25:32);
elseif find(current_block == 3)
    real_condition_list = (1:12);test_condition_list = (13:16);
elseif find(current_block == 4)
    real_condition_list = (1:12);test_condition_list = (13:16);
elseif find(current_block == 6)
    real_condition_list = (1:12);test_condition_list = (13:16);
elseif find(current_block == 8)
    real_condition_list = (1:12);test_condition_list = (13:16);
end
Frame_list = [3*refresh_rate,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate;2.5*refresh_rate,3*refresh_rate;2.5*refresh_rate,3*refresh_rate];
Frame_list = [Frame_list;Frame_list];
if find(current_condition == real_condition_list)
    Frame_first = 3 * refresh_rate;
    Frame_second = 3 * refresh_rate;
elseif find(current_condition == test_condition_list)
    if find(current_block == 1)
        Frame_first = Frame_list(current_condition - 24,1);Frame_second = Frame_list(current_condition - 24,2);
    elseif find(current_block == 2)
        Frame_first = Frame_list(current_condition - 24,1);Frame_second = Frame_list(current_condition - 24,2);
    elseif find(current_block == 3)
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    elseif find(current_block == 4)
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    elseif find(current_block == 6)
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    elseif find(current_block == 8)
        Frame_list = [360,296;360,296;296,360;296,360];
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    end
end
Time_first = (Frame_first-1) * (1000/refresh_rate); %ms,
Time_second = (Frame_second-1) * (1000/refresh_rate); %ms,
fixation_point = 1;%TaskObjects#1
errorwindow = 3;
if find(current_block == 1)
    % �����˶�
    % ����ʵ������
%     refresh_rate = 120;
    Frame = 3*refresh_rate;
    Dot_num_list = [45,90,180,360];
%     Dot_num_list = [45,90,180,360];
    condition = [nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2);nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2)];
    % nchoosek��n��k������n��ȡ��k����ֵ������������ϵķ�ʽ��
    % flip��A,n�����ŵ�n��ά�ȷ�תA
    condition(1:size(condition,1)/2,3) = 1;condition(size(condition,1)/2+1:end,3) = -1;
    condition(1:size(condition,1)/2,4) = 1;condition(size(condition,1)/2+1:end,4) = -1;
    condition = sortrows(condition,2);
    a = condition(:,1);condition(:,1) = condition(:,2);condition(:,2) = a;
    % ���ɲ�������
    test_condition = [3*refresh_rate/2,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate/2;2.5*refresh_rate/2,3*refresh_rate;2.5*refresh_rate,3*refresh_rate/2];
    test_condition = [test_condition;test_condition];
    test_condition(1:size(test_condition,1)/2,3) = 1;test_condition(size(test_condition,1)/2+1:end,3) = -1;
    test_condition(1:size(test_condition,1)/2,4) = 1;test_condition(size(test_condition,1)/2+1:end,4) = -1;
%     test_condition = sortrows(test_condition,1);
    % ��������
    condition = [condition;test_condition];
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    interleaf_first = ceil(Frame_first / Dot_num_first);
    [Dot_position,MoveDirection,PositionStartTime,PositionEndTime,velocity,DotAngle] = MonkeyTimePositionAnalyse(Dot_num_first,Radius,angle,clockwise_first,3);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    color_change_second = 0;%�м��ظ��ĵ���ɫ����
elseif find(current_block == 2)
    % ����ʵ������
%     refresh_rate = 120;
    Frame = 3*refresh_rate;
    Dot_num_list = [Frame/6,Frame/6,Frame/6,Frame/2];%��λ�õĸ���
    condition_1 = nchoosek(Dot_num_list,2);
%     condition_1(3,:) = [];
    condition_2(:,1) = condition_1(:,2);condition_2(:,2) = condition_1(:,1);
    condition = [condition_1;condition_1;condition_2;condition_2];%�õ�ÿ��������ǰ���У���ÿ������ǰ�������̼��ĵ�λ�ø���
    % nchoosek��n��k������n��ȡ��k����ֵ������������ϵķ�ʽ��
    % flip��A,n�����ŵ�n��ά�ȷ�תA
    size_n = size(condition,1)/4;
    condition(1:size_n,3:4) = 1;  condition(size_n+1:size_n*2,3:4) = -1;  %�õ�ÿ��������3��4�в�������ÿ������ǰ�������̼�����ת����
    condition(size_n*2+1:size_n*3,3:4) = 1;  condition(size_n*3+1:end,3:4) = -1;
    condition_3 = [1,0;1,0;1,0;0,0;0,0;0,0];%ǰ5�������Ƿ��ظ������м�֡
    condition_3_1(:,1) = condition_3(:,2);condition_3_1(:,2) = condition_3(:,1);
    condition_4 = [0,0;0,1;0,0;0,1;0,0;1,0];%ǰ��������Ƿ��м�֡�ı���ɫ
    condition_4_1(:,1) = condition_4(:,2);condition_4_1(:,2) = condition_4(:,1);
    condition(:,5:6) = [condition_3;condition_3;condition_3_1;condition_3_1];
    condition(:,7:8) = [condition_4;condition_4;condition_4_1;condition_4_1];
    %condition����λ����1����λ����2����ת����1����ת����2���ظ�����1���ظ�����2����ɫ1����ɫ2
    
    % ���ɲ�������
    test_condition = Frame_list./6;%�õ�ÿ��������ǰ���У���ÿ������ǰ�������̼��ĵ�λ�ø���
%     test_condition = [test_condition;test_condition;test_condition;test_condition];%�õ�ÿ��������ǰ���У���ÿ������ǰ�������̼��ĵ�λ�ø���
    test_condition(1:size(test_condition,1)/2,3:4) = 1;test_condition(size(test_condition,1)/2+1:end,3:4) = -1;%�õ�ÿ��������3��4�в�������ÿ������ǰ�������̼�����ת����
    test_condition(:,5:6) = 0;%ǰ�������������ظ������м�֡
    test_condition_4 = [0,1;1,0;0,1;1,0];%ǰ�ĸ������Ƿ��м�֡�ı���ɫ
    test_condition(:,7:8) = [test_condition_4;test_condition_4];
    
    % ��������
    condition = [condition;test_condition];
    %��λ��1����λ��2����ת����1����ת����2���ظ�֡�Ƿ����1���ظ�֡�Ƿ����2����ɫ�Ƿ�ı�1����ɫ�Ƿ�ı�2
    % ��һ���̼��Ĳ���
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    interleaf_first = ceil(Frame_first / Dot_num_first);
    [Dot_position,MoveDirection,PositionStartTime,PositionEndTime,velocity,DotAngle] = MonkeyTimePositionAnalyse(Dot_num_first,Radius,angle,clockwise_first,3);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    position_change_first = condition(current_condition,5);%�м���ʾ�ظ�֡��λ��
    color_change_first = condition(current_condition,7);%�м��ظ��ĵ���ɫ����
    % �ڶ����̼��Ĳ���
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    position_change_second = condition(current_condition,6);%�м���ʾ�ظ�֡��λ��
    color_change_second = condition(current_condition,8);%�м��ظ��ĵ���ɫ����
    
    
elseif find(current_block == 3)
    % �ȱ����˶�
    if find(current_condition == real_condition_list)
        condition_first_list = [1,1;1,1;1,2;-1,1;-1,1;-1,2;1,2;1,0;1,0;-1,2;-1,0;-1,0];
        condition_second_list = [1,2;1,0;1,0;-1,2;-1,0;-1,0;1,1;1,1;1,2;-1,1;-1,1;-1,2];
        condition_first = condition_first_list(current_condition,:);
        condition_second = condition_second_list(current_condition,:);
    elseif find(current_condition == test_condition_list)
        condition_first_list = [1,1;1,2;1,1;1,2];condition_second_list = [1,2;1,1;1,2;1,1];
        condition_first = condition_first_list(current_condition-12,:);
        condition_second = condition_second_list(current_condition-12,:);
    end
    Dot_num_first = Frame_first/4;
    interleaf_first = 4;
    clockwise_first = condition_first(1);accelerate_style_first = condition_first(2);
    [Dot_position,MoveDirection,PositionStartTime,PositionEndTime,velocity,DotAngle] = MonkeyTimePositionAnalyse(Dot_num_first,Radius,angle,clockwise_first,3,accelerate_style_first);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first,accelerate_style_first);
    position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = Frame_second/4;
    interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    color_change_second = 0;%�м��ظ��ĵ���ɫ����
    
elseif find(current_block == 4)
    % �ȼ��ٺ���� �� �ȼ��ٺ����
    if find(current_condition == real_condition_list)
        condition_first_list = [1,3;1,3;1,4;-1,3;-1,3;-1,4;1,4;1,0;1,0;-1,4;-1,0;-1,0];
        condition_second_list = [1,4;1,0;1,0;-1,4;-1,0;-1,0;1,3;1,3;1,4;-1,3;-1,3;-1,4];
        condition_first = condition_first_list(current_condition,:);
        condition_second = condition_second_list(current_condition,:);
    elseif find(current_condition == test_condition_list)
        condition_first_list = [1,3;1,4;1,3;1,4];condition_second_list = [1,4;1,3;1,4;1,3];
        condition_first = condition_first_list(current_condition-12,:);
        condition_second = condition_second_list(current_condition-12,:);
    end
    Dot_num_first = Frame_first/4;
    interleaf_first = 4;
    clockwise_first = condition_first(1);accelerate_style_first = condition_first(2);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first,accelerate_style_first);
    position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = Frame_second/4;
    interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    color_change_second = 0;%�м��ظ��ĵ���ɫ����
elseif find(current_block == 6)
    % �����˶�
    Frame = 3*refresh_rate;
    Dot_num_list = [Frame/4,Frame/3,Frame/2];
    condition = [nchoosek(Dot_num_list,2);nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2);flip(nchoosek(Dot_num_list,2),2)];
    % nchoosek��n��k������n��ȡ��k����ֵ������������ϵķ�ʽ��
    % flip��A,n�����ŵ�n��ά�ȷ�תA
    condition(1:3,3:4) = 1;condition(4:6,3:4) = -1;
    condition(7:9,3:4) = 1;condition(10:12,3:4) = -1;
    
    % ���ɲ�������
    test_condition = [3*refresh_rate/2,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate/2;2.5*refresh_rate/2,3*refresh_rate;2.5*refresh_rate,3*refresh_rate/2];
    test_condition([1,3],3:4) = 1;test_condition([2,4],3:4) = -1;
    
    % ��������
    condition = [condition;test_condition];
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    interleaf_first = ceil(Frame_first / Dot_num_first);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    color_change_second = 0;%�м��ظ��ĵ���ɫ����
    
elseif find(current_block == 8)
    % �����˶���������45���㣬��15Hz���Ӿ��̼�����������/���ٲ��Ǿ��ȱ仯�ģ��������С����Ҳ����30Hzʱ�ľ���
    % 1 -> ����-����; 2 -> ����-����; 3 -> ����-����;----˳ʱ��
    % 4 -> ����-����; 5 -> ����-����; 6 -> ����-����;----��ʱ��
    % 7 -> ����-����; 8 -> ����-����; 9 -> ����-����;----˳ʱ��
    % 10-> ����-����; 11-> ����-����; 12-> ����-����;----��ʱ��
    % ����
    % 13-> ���ٳ�-���ٶ�; 14-> ���ٳ�-���ٶ�; 15-> ���ٶ�-���ٳ�; 16-> ���ٶ�-���ٳ�;----˳ʱ��
    Frame = 40; % ��24��30Hz������Ϊ45��û�е�Ϊ40
    condition = ones(12,2).*Frame;
    % conditionǰ����Ϊǰ�����̼��ĵ�������3~4��Ϊ��ת����1������-1����������5~6�ٶȱ仯��1���٣�2���٣�0���٣�
    condition([1:3,7:9,13:16],3:4) = 1;condition([4:6,10:12],3:4) = -1;% ��ת����
    condition(1:12,5:6) = [repmat([1,2;1,0;2,0],2,1);repmat(flip([1,2;1,0;2,0],2),2,1)];% ʵ�������ļӼ���
    condition(13:16,1:2) = [repmat([40,33],2,1);repmat(flip([40,33],2),2,1)]; % ����������֡������24��30Hz������Ϊ[45,37],��Ӧ[360s��296s]��û�е�Ϊ[40,33]������[360s��297s]
    condition(13:16,5:6) = [1,0;2,0;0,2;0,1]; % ���������ļӼ���
    
    % ���ٵĵ�λ�ã��õ�������ʱ����ٵ�λ�ã�
%     % 8/10/12/15/20/24/30Hz������
%     degree_F = [4,5,6,8,10,12,15]; % ��֮��ļ�����Ƕ�
%     degree_N = [7,7,7,6,6,6,5]; % ÿ�ֽǶȶ�Ӧ�ĵ���ִ���
    % 8/10/12/15/20Hz������
    degree_F = [6,8,10,12,15]; % ��֮��ļ�����Ƕ�
    degree_N = [14,7,7,5,6]; % ÿ�ֽǶȶ�Ӧ�ĵ���ִ���
    degree = 0;p_i = 2;
    DotAngle = zeros(Frame,1);
    position_1 = zeros(Frame,2);position_1(1,:) = [Radius*sind(0),Radius*cosd(0)];
    for N_i = 1:length(degree_F)
        for N_ii = 1:degree_N(N_i)
            degree = degree + degree_F(N_i);
            DotAngle(p_i) = degree;
            position_1(p_i,:) = [Radius*sind(degree),Radius*cosd(degree)];
            p_i = p_i + 1;            
        end
    end
    position_1 = reshape(position_1',[1,2,Frame]);    
    
    
    Dot_num_first = condition(current_condition,1);
    clockwise_first = condition(current_condition,3);
    accelerate_style_first = condition(current_condition,5);    
    interleaf_first = ceil(Frame_first / Dot_num_first);
    if accelerate_style_first == 0 % �����˶�
        angle_dot = linspace(0,2*pi,condition(current_condition,1));
        position_0 = zeros(1,2,condition(current_condition,1));
        for ii = 1:condition(current_condition,1)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        Dot_position_first = position_0;
    elseif accelerate_style_first == 1 % �����˶�
        Dot_position_first = position_1;
    elseif accelerate_style_first == 2 % �����˶�
        Dot_position_first = position_1(:,:,(end:-1:1)).*[-1,1];
        DotAngle = DotAngle(end:-1:1);
    end
    if clockwise_first == 1
        Dot_position_first = Dot_position_first .* [-1,1];
    end
    position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);
    clockwise_second = condition(current_condition,4);
    accelerate_style_second = condition(current_condition,6);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    if accelerate_style_second == 0 % �����˶�
        angle_dot = linspace(0,2*pi,condition(current_condition,2));
        position_0 = zeros(1,2,condition(current_condition,2));
        for ii = 1:condition(current_condition,2)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        Dot_position_second = position_0;
    elseif accelerate_style_second == 1 % �����˶�
        Dot_position_second = position_1;
    elseif accelerate_style_second == 2 % �����˶�
        Dot_position_second = position_1(:,:,(end:-1:1)).*[-1,1];
    end
    if clockwise_second == 1
        Dot_position_second = Dot_position_second .* [-1,1];
    end
    position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    color_change_second = 0;%�м��ظ��ĵ���ɫ����
end

%% ��ͼ
% ͼ1
Dot_position_first(:,2,:) = Dot_position_first(:,2,:).*(-1);
Dot_position_second(:,2,:) = Dot_position_second(:,2,:).*(-1);
[Angle_Dot_first,Dot_Hz_first] = CircleTimeAngle(Dot_num_first,angle,accelerate_style_first);
Dot1_Alpha_low = Dot_Hz_first>=Hz_Threshold;Dot1_Alpha_high = Dot_Hz_first<Hz_Threshold;
p1 = figure;
scatter(Dot_position_first(:,1,:),Dot_position_first(:,2,:),'filled','w','SizeData',300);
% scatter(Dot_position_first(:,1,Dot1_Alpha_low),Dot_position_first(:,2,Dot1_Alpha_low),'filled','w','SizeData',300,'MarkerFaceAlpha',0.2);
hold on
% scatter(Dot_position_first(:,1,Dot1_Alpha_high),Dot_position_first(:,2,Dot1_Alpha_high),'filled','r','SizeData',300,'MarkerFaceAlpha',0.8);
axis square
set(gca, 'color',[0 0 0]);
scatter(0,0,'filled','w','SizeData',100);
% scatter(Dot_position_first(:,1,1),Dot_position_first(:,2,1),'filled','w','SizeData',300);
% xlim([-6,6]);ylim([-6,6]);
text_text = ['�̼�һ���¼�����Ϊ:',num2str(sum(Dot1_Alpha_high))];
text_axis = [-5.5,5.5];
text(text_axis(1),text_axis(2),text_text,'FontSize',15,'Color','w');
set(gca,'Visible','off');
set(gcf,'color','k');
% axis off
hold off

% ͼ2
[Angle_Dot_second,Dot_Hz_second] = CircleTimeAngle(Dot_num_second,angle,accelerate_style_second);
Dot2_Alpha_low = Dot_Hz_second>=Hz_Threshold;Dot2_Alpha_high = Dot_Hz_second<Hz_Threshold;
p2 = figure;
scatter(Dot_position_second(:,1,Dot2_Alpha_low),Dot_position_second(:,2,Dot2_Alpha_low),'filled','w','SizeData',300,'MarkerFaceAlpha',0.2);
hold on
scatter(Dot_position_second(:,1,Dot2_Alpha_high),Dot_position_second(:,2,Dot2_Alpha_high),'filled','r','SizeData',300,'MarkerFaceAlpha',0.8);
axis square
set(gca, 'color',[0 0 0]);
scatter(0,0,'filled','w','SizeData',100);
% scatter(Dot_position_second(:,1,1),Dot_position_second(:,2,1),'filled','w','SizeData',300);
% xlim([-6,6]);ylim([-6,6]);
text_text = ['�̼������¼�����Ϊ:',num2str(sum(Dot2_Alpha_high))];
text_axis = [-5.5,5.5];
text(text_axis(1),text_axis(2),text_text,'FontSize',15,'Color','w');
set(gca,'Visible','off');
set(gcf,'color','k');
% axis off
hold off
message = sprintf('�̼�һ���¼�����Ϊ:%1.0f\n�̼������¼�����Ϊ:%1.0f\n',sum(Dot1_Alpha_high),sum(Dot2_Alpha_high));
fprintf(message);


% %% ע�ӵ�ͼ
% figure
% scatter(0,0,'+','w','SizeData',100,'LineWidth',2);
% axis square
% set(gca, 'color',[0 0 0]);









%% ���㲻ͬ������ spatial interval
Radius = 3.2; % �Ӿ��̼��뾶���ӽǶ�
Distence = 55; % �Ӿ��̼����۵ľ��룬��λcm
DistenceEye = 1.7; % ��״�嵽����Ĥ�ľ��룬��λcm
AngleIntervalList = abs(diff(DotAngle));
SpatialInterval = zeros(length(AngleIntervalList),1);
for LI = 1:length(AngleIntervalList)
    AngleInterval = AngleIntervalList(LI); % �Ӿ��̼�ת����Բ�Ľ�
    Chord = 2 * Radius * sind(AngleInterval / 2); % �ҳ�����λ���ӽǶ�
    DisCho2CenAng = Radius * cosd(AngleInterval / 2); % ���ľ࣬��λ���ӽǶ�
    DisCho2CenCm = Distence * tand(DisCho2CenAng); % ���ľ࣬��λ��cm
    ChordCm = Chord * DisCho2CenCm / DisCho2CenAng; % �ҳ�����λ��cm
    DistenceDot = Distence * cosd(Radius); % �۵��ҵľ��룬��λcm
    SpatialInterval(LI) = DistenceEye / DistenceDot * ChordCm; % ������Ĥ������֮��Ŀռ�������λcm
end











