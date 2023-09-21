clc;clear;
%% 设置实验条件
Hz_Threshold = 30;
current_block = 2;
current_condition = 1;
refresh_rate = 120;

Center = [0 0];%设置刺激呈现的位置
Radius = 5; %degree
Dot_size = 0.5;
Dot_color = [1 0 0];
idle_color = [0 0 0];
angle = [0,2*pi];

%% 实验矩阵生成
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
    % 匀速运动
    % 生成实验条件
%     refresh_rate = 120;
    Frame = 3*refresh_rate;
    Dot_num_list = [45,90,180,360];
%     Dot_num_list = [45,90,180,360];
    condition = [nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2);nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2)];
    % nchoosek（n，k），从n中取出k个数值，采用排列组合的方式。
    % flip（A,n）沿着第n个维度翻转A
    condition(1:size(condition,1)/2,3) = 1;condition(size(condition,1)/2+1:end,3) = -1;
    condition(1:size(condition,1)/2,4) = 1;condition(size(condition,1)/2+1:end,4) = -1;
    condition = sortrows(condition,2);
    a = condition(:,1);condition(:,1) = condition(:,2);condition(:,2) = a;
    % 生成测试条件
    test_condition = [3*refresh_rate/2,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate/2;2.5*refresh_rate/2,3*refresh_rate;2.5*refresh_rate,3*refresh_rate/2];
    test_condition = [test_condition;test_condition];
    test_condition(1:size(test_condition,1)/2,3) = 1;test_condition(size(test_condition,1)/2+1:end,3) = -1;
    test_condition(1:size(test_condition,1)/2,4) = 1;test_condition(size(test_condition,1)/2+1:end,4) = -1;
%     test_condition = sortrows(test_condition,1);
    % 所有条件
    condition = [condition;test_condition];
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    interleaf_first = ceil(Frame_first / Dot_num_first);
    [Dot_position,MoveDirection,PositionStartTime,PositionEndTime,velocity,DotAngle] = MonkeyTimePositionAnalyse(Dot_num_first,Radius,angle,clockwise_first,3);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    position_change_first = 0;%中间显示重复帧的位置
    color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    position_change_second = 0;%中间显示重复帧的位置
    color_change_second = 0;%中间重复的点颜色不变
elseif find(current_block == 2)
    % 生成实验条件
%     refresh_rate = 120;
    Frame = 3*refresh_rate;
    Dot_num_list = [Frame/6,Frame/6,Frame/6,Frame/2];%点位置的个数
    condition_1 = nchoosek(Dot_num_list,2);
%     condition_1(3,:) = [];
    condition_2(:,1) = condition_1(:,2);condition_2(:,2) = condition_1(:,1);
    condition = [condition_1;condition_1;condition_2;condition_2];%得到每个条件的前两列，即每个条件前后两个刺激的点位置个数
    % nchoosek（n，k），从n中取出k个数值，采用排列组合的方式。
    % flip（A,n）沿着第n个维度翻转A
    size_n = size(condition,1)/4;
    condition(1:size_n,3:4) = 1;  condition(size_n+1:size_n*2,3:4) = -1;  %得到每个条件的3、4列参数，即每个条件前后两个刺激的旋转方向。
    condition(size_n*2+1:size_n*3,3:4) = 1;  condition(size_n*3+1:end,3:4) = -1;
    condition_3 = [1,0;1,0;1,0;0,0;0,0;0,0];%前5个条件是否重复出现中间帧
    condition_3_1(:,1) = condition_3(:,2);condition_3_1(:,2) = condition_3(:,1);
    condition_4 = [0,0;0,1;0,0;0,1;0,0;1,0];%前五个条件是否中间帧改变颜色
    condition_4_1(:,1) = condition_4(:,2);condition_4_1(:,2) = condition_4(:,1);
    condition(:,5:6) = [condition_3;condition_3;condition_3_1;condition_3_1];
    condition(:,7:8) = [condition_4;condition_4;condition_4_1;condition_4_1];
    %condition：点位置数1，点位置数2，旋转方向1，旋转方向2，重复出现1，重复出现2，变色1，变色2
    
    % 生成测试条件
    test_condition = Frame_list./6;%得到每个条件的前两列，即每个条件前后两个刺激的点位置个数
%     test_condition = [test_condition;test_condition;test_condition;test_condition];%得到每个条件的前两列，即每个条件前后两个刺激的点位置个数
    test_condition(1:size(test_condition,1)/2,3:4) = 1;test_condition(size(test_condition,1)/2+1:end,3:4) = -1;%得到每个条件的3、4列参数，即每个条件前后两个刺激的旋转方向。
    test_condition(:,5:6) = 0;%前后两个条件都重复出现中间帧
    test_condition_4 = [0,1;1,0;0,1;1,0];%前四个条件是否中间帧改变颜色
    test_condition(:,7:8) = [test_condition_4;test_condition_4];
    
    % 所有条件
    condition = [condition;test_condition];
    %点位置1，点位置2，旋转方向1，旋转方向2，重复帧是否呈现1，重复帧是否呈现2，颜色是否改变1，颜色是否改变2
    % 第一个刺激的参数
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    interleaf_first = ceil(Frame_first / Dot_num_first);
    [Dot_position,MoveDirection,PositionStartTime,PositionEndTime,velocity,DotAngle] = MonkeyTimePositionAnalyse(Dot_num_first,Radius,angle,clockwise_first,3);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    position_change_first = condition(current_condition,5);%中间显示重复帧的位置
    color_change_first = condition(current_condition,7);%中间重复的点颜色不变
    % 第二个刺激的参数
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    position_change_second = condition(current_condition,6);%中间显示重复帧的位置
    color_change_second = condition(current_condition,8);%中间重复的点颜色不变
    
    
elseif find(current_block == 3)
    % 匀变速运动
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
    position_change_first = 0;%中间显示重复帧的位置
    color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = Frame_second/4;
    interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    position_change_second = 0;%中间显示重复帧的位置
    color_change_second = 0;%中间重复的点颜色不变
    
elseif find(current_block == 4)
    % 先加速后减速 或 先减速后加速
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
    position_change_first = 0;%中间显示重复帧的位置
    color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = Frame_second/4;
    interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    position_change_second = 0;%中间显示重复帧的位置
    color_change_second = 0;%中间重复的点颜色不变
elseif find(current_block == 6)
    % 匀速运动
    Frame = 3*refresh_rate;
    Dot_num_list = [Frame/4,Frame/3,Frame/2];
    condition = [nchoosek(Dot_num_list,2);nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2);flip(nchoosek(Dot_num_list,2),2)];
    % nchoosek（n，k），从n中取出k个数值，采用排列组合的方式。
    % flip（A,n）沿着第n个维度翻转A
    condition(1:3,3:4) = 1;condition(4:6,3:4) = -1;
    condition(7:9,3:4) = 1;condition(10:12,3:4) = -1;
    
    % 生成测试条件
    test_condition = [3*refresh_rate/2,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate/2;2.5*refresh_rate/2,3*refresh_rate;2.5*refresh_rate,3*refresh_rate/2];
    test_condition([1,3],3:4) = 1;test_condition([2,4],3:4) = -1;
    
    % 所有条件
    condition = [condition;test_condition];
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    interleaf_first = ceil(Frame_first / Dot_num_first);
    Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    position_change_first = 0;%中间显示重复帧的位置
    color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    position_change_second = 0;%中间显示重复帧的位置
    color_change_second = 0;%中间重复的点颜色不变
    
elseif find(current_block == 8)
    % 变速运动，都包括45个点，即15Hz的视觉刺激。不过加速/减速不是均匀变化的，两点间最小距离也等于30Hz时的距离
    % 1 -> 加速-减速; 2 -> 加速-匀速; 3 -> 减速-匀速;----顺时针
    % 4 -> 加速-减速; 5 -> 加速-匀速; 6 -> 减速-匀速;----逆时针
    % 7 -> 减速-加速; 8 -> 匀速-加速; 9 -> 匀速-减速;----顺时针
    % 10-> 减速-加速; 11-> 匀速-加速; 12-> 匀速-减速;----逆时针
    % 测试
    % 13-> 加速长-匀速短; 14-> 减速长-匀速短; 15-> 匀速短-减速长; 16-> 匀速短-加速长;----顺时针
    Frame = 40; % 有24和30Hz的条件为45，没有的为40
    condition = ones(12,2).*Frame;
    % condition前两列为前后两刺激的点数，第3~4列为旋转方向（1正旋，-1逆旋），第5~6速度变化（1加速，2减速，0匀速）
    condition([1:3,7:9,13:16],3:4) = 1;condition([4:6,10:12],3:4) = -1;% 旋转方向
    condition(1:12,5:6) = [repmat([1,2;1,0;2,0],2,1);repmat(flip([1,2;1,0;2,0],2),2,1)];% 实验条件的加减速
    condition(13:16,1:2) = [repmat([40,33],2,1);repmat(flip([40,33],2),2,1)]; % 测试条件的帧数，有24和30Hz的条件为[45,37],对应[360s和296s]，没有的为[40,33]，对用[360s和297s]
    condition(13:16,5:6) = [1,0;2,0;0,2;0,1]; % 测试条件的加减速
    
    % 变速的点位置（得到的是逆时针加速的位置）
%     % 8/10/12/15/20/24/30Hz的条件
%     degree_F = [4,5,6,8,10,12,15]; % 点之间的间隔，角度
%     degree_N = [7,7,7,6,6,6,5]; % 每种角度对应的点呈现次数
    % 8/10/12/15/20Hz的条件
    degree_F = [6,8,10,12,15]; % 点之间的间隔，角度
    degree_N = [14,7,7,5,6]; % 每种角度对应的点呈现次数
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
    if accelerate_style_first == 0 % 匀速运动
        angle_dot = linspace(0,2*pi,condition(current_condition,1));
        position_0 = zeros(1,2,condition(current_condition,1));
        for ii = 1:condition(current_condition,1)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        Dot_position_first = position_0;
    elseif accelerate_style_first == 1 % 加速运动
        Dot_position_first = position_1;
    elseif accelerate_style_first == 2 % 减速运动
        Dot_position_first = position_1(:,:,(end:-1:1)).*[-1,1];
        DotAngle = DotAngle(end:-1:1);
    end
    if clockwise_first == 1
        Dot_position_first = Dot_position_first .* [-1,1];
    end
    position_change_first = 0;%中间显示重复帧的位置
    color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);
    clockwise_second = condition(current_condition,4);
    accelerate_style_second = condition(current_condition,6);
    interleaf_second = ceil(Frame_second / Dot_num_second);
    if accelerate_style_second == 0 % 匀速运动
        angle_dot = linspace(0,2*pi,condition(current_condition,2));
        position_0 = zeros(1,2,condition(current_condition,2));
        for ii = 1:condition(current_condition,2)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        Dot_position_second = position_0;
    elseif accelerate_style_second == 1 % 加速运动
        Dot_position_second = position_1;
    elseif accelerate_style_second == 2 % 减速运动
        Dot_position_second = position_1(:,:,(end:-1:1)).*[-1,1];
    end
    if clockwise_second == 1
        Dot_position_second = Dot_position_second .* [-1,1];
    end
    position_change_second = 0;%中间显示重复帧的位置
    color_change_second = 0;%中间重复的点颜色不变
end

%% 画图
% 图1
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
text_text = ['刺激一的事件数量为:',num2str(sum(Dot1_Alpha_high))];
text_axis = [-5.5,5.5];
text(text_axis(1),text_axis(2),text_text,'FontSize',15,'Color','w');
set(gca,'Visible','off');
set(gcf,'color','k');
% axis off
hold off

% 图2
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
text_text = ['刺激二的事件数量为:',num2str(sum(Dot2_Alpha_high))];
text_axis = [-5.5,5.5];
text(text_axis(1),text_axis(2),text_text,'FontSize',15,'Color','w');
set(gca,'Visible','off');
set(gcf,'color','k');
% axis off
hold off
message = sprintf('刺激一的事件数量为:%1.0f\n刺激二的事件数量为:%1.0f\n',sum(Dot1_Alpha_high),sum(Dot2_Alpha_high));
fprintf(message);


% %% 注视点图
% figure
% scatter(0,0,'+','w','SizeData',100,'LineWidth',2);
% axis square
% set(gca, 'color',[0 0 0]);









%% 计算不同条件的 spatial interval
Radius = 3.2; % 视觉刺激半径的视角度
Distence = 55; % 视觉刺激到眼的距离，单位cm
DistenceEye = 1.7; % 晶状体到视网膜的距离，单位cm
AngleIntervalList = abs(diff(DotAngle));
SpatialInterval = zeros(length(AngleIntervalList),1);
for LI = 1:length(AngleIntervalList)
    AngleInterval = AngleIntervalList(LI); % 视觉刺激转过的圆心角
    Chord = 2 * Radius * sind(AngleInterval / 2); % 弦长，单位是视角度
    DisCho2CenAng = Radius * cosd(AngleInterval / 2); % 弦心距，单位是视角度
    DisCho2CenCm = Distence * tand(DisCho2CenAng); % 弦心距，单位是cm
    ChordCm = Chord * DisCho2CenCm / DisCho2CenAng; % 弦长，单位是cm
    DistenceDot = Distence * cosd(Radius); % 眼到弦的距离，单位cm
    SpatialInterval(LI) = DistenceEye / DistenceDot * ChordCm; % 在视网膜上两点之间的空间间隔，单位cm
end











