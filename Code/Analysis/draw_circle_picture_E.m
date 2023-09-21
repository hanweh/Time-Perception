clc;clear;
%% 设置实验条件
Hz_Threshold = 60;
current_block = 1;
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
%     Dot_num_list = [72,Frame/(2^2),Frame/2,Frame];
    Dot_num_list = [90,120,180,360];
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
end

% %% 画图
% % 图1
% Dot_position_first(:,2,:) = Dot_position_first(:,2,:).*(-1);
% Dot_position_second(:,2,:) = Dot_position_second(:,2,:).*(-1);
% [Angle_Dot_first,Dot_Hz_first] = CircleTimeAngle(Dot_num_first,angle,accelerate_style_first);
% Dot1_Alpha_low = Dot_Hz_first>=Hz_Threshold;Dot1_Alpha_high = Dot_Hz_first<Hz_Threshold;
% p1 = figure;
% scatter(Dot_position_first(:,1,Dot1_Alpha_low),Dot_position_first(:,2,Dot1_Alpha_low),'filled','w','SizeData',300,'MarkerFaceAlpha',0.2);
% hold on
% scatter(Dot_position_first(:,1,Dot1_Alpha_high),Dot_position_first(:,2,Dot1_Alpha_high),'filled','r','SizeData',300,'MarkerFaceAlpha',0.8);
% axis square
% set(gca, 'color',[0 0 0]);
% scatter(0,0,'filled','w','SizeData',100);
% % scatter(Dot_position_first(:,1,1),Dot_position_first(:,2,1),'filled','w','SizeData',300);
% % xlim([-6,6]);ylim([-6,6]);
% text_text = ['刺激一的事件数量为:',num2str(sum(Dot1_Alpha_high))];
% text_axis = [-5.5,5.5];
% text(text_axis(1),text_axis(2),text_text,'FontSize',15,'Color','w');
% set(gca,'Visible','off');
% set(gcf,'color','k');
% % axis off
% hold off
% 
% % 图2
% [Angle_Dot_second,Dot_Hz_second] = CircleTimeAngle(Dot_num_second,angle,accelerate_style_second);
% Dot2_Alpha_low = Dot_Hz_second>=Hz_Threshold;Dot2_Alpha_high = Dot_Hz_second<Hz_Threshold;
% p2 = figure;
% scatter(Dot_position_second(:,1,Dot2_Alpha_low),Dot_position_second(:,2,Dot2_Alpha_low),'filled','w','SizeData',300,'MarkerFaceAlpha',0.2);
% hold on
% scatter(Dot_position_second(:,1,Dot2_Alpha_high),Dot_position_second(:,2,Dot2_Alpha_high),'filled','r','SizeData',300,'MarkerFaceAlpha',0.8);
% axis square
% set(gca, 'color',[0 0 0]);
% scatter(0,0,'filled','w','SizeData',100);
% % scatter(Dot_position_second(:,1,1),Dot_position_second(:,2,1),'filled','w','SizeData',300);
% % xlim([-6,6]);ylim([-6,6]);
% text_text = ['刺激二的事件数量为:',num2str(sum(Dot2_Alpha_high))];
% text_axis = [-5.5,5.5];
% text(text_axis(1),text_axis(2),text_text,'FontSize',15,'Color','w');
% set(gca,'Visible','off');
% set(gcf,'color','k');
% % axis off
% hold off
% message = sprintf('刺激一的事件数量为:%1.0f\n刺激二的事件数量为:%1.0f\n',sum(Dot1_Alpha_high),sum(Dot2_Alpha_high));
% fprintf(message);

%% 画图
% 图1
p1 = figure;
set(gcf,'position',[200 50 900 700]);
scatter(Dot_position_first(:,1,:),Dot_position_first(:,2,:),'filled','w','SizeData',300,'MarkerFaceAlpha',0.3);
axis square
set(gca, 'color',[0 0 0]);
hold on
scatter(0,0,'filled','w','SizeData',300);
scatter(Dot_position_first(:,1,1),Dot_position_first(:,2,1),'filled','w','SizeData',300);
xlim([-6,6]);ylim([-6,6]);
% axis off
hold off
% saveas(p1,'45.png')

% 图2
p2 = figure;
set(gcf,'position',[200 50 900 700]);
scatter(Dot_position_second(:,1,:),Dot_position_second(:,2,:),'filled','w','SizeData',300,'MarkerFaceAlpha',0.3);
axis square
set(gca, 'color',[0 0 0]);
hold on
scatter(0,0,'filled','w','SizeData',300);
scatter(Dot_position_second(:,1,1),Dot_position_second(:,2,1),'filled','w','SizeData',300);
xlim([-6,6]);ylim([-6,6]);
% axis off
hold off
% saveas(p2,'60.png')


%% 画无序的图
% 图1
Dot_position_first = Dot_position_first(:,:,randperm(size(Dot_position_first,3)));
p3 = figure;hold on;
set(gcf,'position',[200 50 900 700]);
for i = 1:size(Dot_position_first,3)
scatter(Dot_position_first(:,1,i),Dot_position_first(:,2,i),'fill','w','SizeData',300,'MarkerFaceAlpha',1/size(Dot_position_first,3)*i);
end
axis square
set(gca, 'color',[0 0 0]);
hold on
scatter(0,0,'filled','w','SizeData',300);
% scatter(Dot_position_first(:,1,1),Dot_position_first(:,2,1),'filled','w','SizeData',300);
xlim([-6,6]);ylim([-6,6]);
% axis off
hold off















