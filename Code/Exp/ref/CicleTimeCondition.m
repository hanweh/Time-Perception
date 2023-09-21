function condition_idx = CicleTimeCondition(current_block,current_condition,refresh_rate,Radius,angle)
% 生成时间知觉实验的条件参数
% block: 1->匀速运动    2->匀速运动中间闪烁与否    3->匀变速运动    4->先加速后减速或者先减速后加速
% 1->是事件发生频率差异
% 2->是颜色、重复次数、位置差异
% 3->是匀变速运动
% 4->是变加速度运动
% 5->是练习阶段
% 6->是阈下事件发生频率差异
% 7->是有序/非有序条件，有序和无序比，无序和无序比
% 8->是加速/减速/匀速运动之间的比较，都包括45个点，即15Hz的视觉刺激。不过加速/减速不是均匀变化的，两点间最小距离也等于30Hz时的距离
% condition： 
    % block == 1 时：匀速运动
    % 1:45个位置；2：90个位置；3：180个位置；4：360个位置
    % [帧数 点数 正旋1 加速1；帧数 点数 逆旋-1 减速2]
        % real condition
        % 1 ->[360, 45, 1,0; 360, 90, 1,0]; 2 ->[360, 45, 1,0; 360,180, 1,0]; 3 ->[360, 45, 1,0; 360,360, 1,0];
        % 4 ->[360, 45,-1,0; 360, 90,-1,0]; 5 ->[360, 45,-1,0; 360,180,-1,0]; 6 ->[360, 45,-1,0; 360,360,-1,0];
        % 7 ->[360, 90, 1,0; 360, 45, 1,0]; 8 ->[360, 90, 1,0; 360,180, 1,0]; 9 ->[360, 90, 1,0; 360,360, 1,0];
        % 10->[360, 90,-1,0; 360, 45,-1,0]; 11->[360, 90,-1,0; 360,180,-1,0]; 12->[360, 90,-1,0; 360,360,-1,0];
        % 13->[360,180, 1,0; 360, 45, 1,0]; 14->[360,180, 1,0; 360, 90, 1,0]; 15->[360,180, 1,0; 360,360, 1,0];
        % 16->[360,180,-1,0; 360, 45,-1,0]; 17->[360,180,-1,0; 360, 90,-1,0]; 18->[360,180,-1,0; 360,360,-1,0];
        % 19->[360,360, 1,0; 360, 45, 1,0]; 20->[360,360, 1,0; 360, 90, 1,0]; 21->[360,360, 1,0; 360,180, 1,0];
        % 22->[360,360,-1,0; 360, 45,-1,0]; 23->[360,360,-1,0; 360, 90,-1,0]; 24->[360,360,-1,0; 360,180,-1,0];
        % test condition
        % 25->[360,180, 1,0; 300,300, 1,0]; 26->[360,360, 1,0; 300,150, 1,0]; 27->[300,150, 1,0; 360,360, 1,0]; 28->[300,300, 1,0; 360,180, 1,0];
        % 29->[360,180,-1,0; 300,300,-1,0]; 30->[360,360,-1,0; 300,150,-1,0]; 31->[300,150,-1,0; 360,360,-1,0]; 32->[300,300,-1,0; 360,180,-1,0];
        
    % block == 2 时：匀速运动中间闪烁与否
    % 1:20个位置呈现1次；2：20个位置呈现3次；3：20个位置呈现3次不同颜色；4：60个位置
    %[帧数，点数，正旋1，匀速0，中间不显示1，中间变颜色1]
        % real condition
        % 1 ->[360,60 , 1,0,1,0; 360,60 , 1,0,0,0]; 2 ->[360,60 , 1,0,1,0; 360,60 , 1,0,0,1]; 3 ->[360,60 , 1,0,1,0; 360,180, 1,0,0,0]; 
        % 4 ->[360,60 , 1,0,0,0; 360,60 , 1,0,0,1]; 5 ->[360,60 , 1,0,0,0; 360,180, 1,0,0,0]; 6 ->[360,60 , 1,0,0,1; 360,180, 1,0,0,0]; 
        % 7 ->[360,60 ,-1,0,1,0; 360,60 ,-1,0,0,0]; 8 ->[360,60 ,-1,0,1,0; 360,60 ,-1,0,0,1]; 9 ->[360,60 ,-1,0,1,0; 360,180,-1,0,0,0]; 
        %10 ->[360,60 ,-1,0,0,0; 360,60 ,-1,0,0,1];11 ->[360,60 ,-1,0,0,0; 360,180,-1,0,0,0];12 ->[360,60 ,-1,0,0,1; 360,180,-1,0,0,0]; 
        %13 ->[360,60 , 1,0,0,0; 360,60 , 1,0,1,0];14 ->[360,60 , 1,0,0,1; 360,60 , 1,0,1,0];15 ->[360,180, 1,0,0,0; 360,60 , 1,0,1,0]; 
        %16 ->[360,60 , 1,0,0,1; 360,60 , 1,0,0,0];17 ->[360,180, 1,0,0,0; 360,60 , 1,0,0,0];18 ->[360,180, 1,0,0,0; 360,60 , 1,0,0,1]; 
        %19 ->[360,60 ,-1,0,0,0; 360,60 ,-1,0,1,0];20 ->[360,60 ,-1,0,0,1; 360,60 ,-1,0,1,0];21 ->[360,180,-1,0,0,0; 360,60 ,-1,0,1,0]; 
        %22 ->[360,60 ,-1,0,0,1; 360,60 ,-1,0,0,0];23 ->[360,180,-1,0,0,0; 360,60 ,-1,0,0,0];24 ->[360,180,-1,0,0,0; 360,60 ,-1,0,0,1]; 
        % test condition
        % 25->[360,60 , 1,0,0,0;300,50 , 1,0,0,1];26->[360,60 , 1,0,0,1;300,50 , 1,0,0,0];
        % 27->[300,50 , 1,0,0,0;360,60 , 1,0,0,1];28->[300,50 , 1,0,0,1;360,60 , 1,0,0,0];
        % 29->[360,60 ,-1,0,0,0;300,50 ,-1,0,0,1];30->[360,60 ,-1,0,0,1;300,50 ,-1,0,0,0];
        % 31->[300,50 ,-1,0,0,0;360,60 ,-1,0,0,1];32->[300,50 ,-1,0,0,1;360,60 ,-1,0,0,0];
        
    % block == 3 时：匀变速运动
    % 1：匀加速；2：匀减速；3：匀速
        % real condition
        % 1 ->[360, 90, 1, 1; 360, 90, 1, 2]; 2 ->[360, 90, 1, 1; 360, 90, 1, 0]; 3 ->[360, 90, 1, 2; 360, 90, 1, 0];
        % 4 ->[360, 90,-1, 1; 360, 90,-1, 2]; 5 ->[360, 90,-1, 1; 360, 90,-1, 0]; 6 ->[360, 90,-1, 2; 360, 90,-1, 0];
        % 7 ->[360, 90, 1, 2; 360, 90, 1, 1]; 8 ->[360, 90, 1, 0; 360, 90, 1, 1]; 9 ->[360, 90, 1, 0; 360, 90, 1, 2];
        % 10->[360, 90,-1, 2; 360, 90,-1, 1]; 11->[360, 90,-1, 0; 360, 90,-1, 1]; 12->[360, 90,-1, 0; 360, 90,-1, 2];
        % test condition
        % 13->[360, 90, 1, 1; 300, 75, 1, 2]; 14->[360, 90, 1, 2; 300, 75, 1, 1];
        % 15->[300, 75, 1, 1; 360, 90, 1, 2]; 16->[300, 75, 1, 2; 360, 90, 1, 1];
        
    % block == 4 时：先加速后减速或者先减速后加速
    % 1：先加速后减速；2：先减速后加速；3：匀速
        % real condition
        % 1 ->[360, 90, 1, 3; 360, 90, 1, 4]; 2 ->[360, 90, 1, 3; 360, 90, 1, 0]; 3 ->[360, 90, 1, 4; 360, 90, 1, 0];
        % 4 ->[360, 90,-1, 3; 360, 90,-1, 4]; 5 ->[360, 90,-1, 3; 360, 90,-1, 0]; 6 ->[360, 90,-1, 4; 360, 90,-1, 0];
        % 7 ->[360, 90, 1, 4; 360, 90, 1, 3]; 8 ->[360, 90, 1, 0; 360, 90, 1, 3]; 9 ->[360, 90, 1, 0; 360, 90, 1, 4];
        % 10->[360, 90,-1, 4; 360, 90,-1, 3]; 11->[360, 90,-1, 0; 360, 90,-1, 3]; 12->[360, 90,-1, 0; 360, 90,-1, 4];
        % test condition
        % 13->[360, 90, 1, 3; 300, 75, 1, 4]; 14->[360, 90, 1, 4; 300, 75, 1, 3];
        % 15->[300, 75, 1, 3; 360, 90, 1, 4]; 16->[300, 75, 1, 4; 360, 90, 1, 3];
        
    % block == 6 时：匀速运动
    % [帧数 点数 正旋1 ；帧数 点数 逆旋-1 ]
        % 1 ->[360,120, 1,0; 360,180, 1,0]; 2 ->[360,120, 1,0; 360,360, 1,0]; 3 ->[360,180, 1,0; 360,360, 1,0];
        % 4 ->[360,120,-1,0; 360,180,-1,0]; 5 ->[360,120,-1,0; 360,360,-1,0]; 6 ->[360,180,-1,0; 360,360,-1,0];
        % 7 ->[360,180, 1,0; 360,120, 1,0]; 8 ->[360,360, 1,0; 360,120, 1,0]; 9 ->[360,360, 1,0; 360,180, 1,0];
        %10 ->[360,180,-1,0; 360,120,-1,0];11 ->[360,360,-1,0; 360,120,-1,0];12 ->[360,360,-1,0; 360,180,-1,0];
        %13 ->[360,180, 1,0; 300,300, 1,0];14 ->[360,360,-1,0; 300,150,-1,0];
        %15 ->[300,150, 1,0; 360,180, 1,0];16 ->[300,300,-1,0; 360,180,-1,0];
        
    % block == 7 时：有序/无序
        % 1 -> 30Hz无序-40Hz无序; 2 -> 30Hz无序-60Hz无序; 3 -> 40Hz无序-60Hz无序;
        % 4 -> 40Hz无序-30Hz无序; 5 -> 60Hz无序-30Hz无序; 6 -> 60Hz无序-40Hz无序;
        % 7 -> 30Hz有序-30Hz无序; 8 -> 40Hz有序-40Hz无序; 9 -> 60Hz有序-60Hz无序;
        % 10-> 30Hz无序-30Hz有序; 11-> 40Hz无序-40Hz有序; 12-> 60Hz无序-60Hz有序;
        % 测试
        % 13-> 30Hz无序-60Hz无序(3-2s); 14-> 40Hz有序-40Hz无序(3-2s); 15-> 60Hz无序-30Hz无序(2-3s); 16-> 40Hz无序-40Hz有序(2-3s);
        
    % block == 8 时：变速运动，都包括45个点，即15Hz的视觉刺激。不过加速/减速不是均匀变化的，两点间最小距离也等于30Hz时的距离
    % 1：加速；2：减速；3：匀速
        % real condition
        % 1 ->[360, 45, 1, 1; 360, 45, 1, 2]; 2 ->[360, 45, 1, 1; 360, 45, 1, 0]; 3 ->[360, 45, 1, 2; 360, 45, 1, 0];
        % 4 ->[360, 45,-1, 1; 360, 45,-1, 2]; 5 ->[360, 45,-1, 1; 360, 45,-1, 0]; 6 ->[360, 45,-1, 2; 360, 45,-1, 0];
        % 7 ->[360, 45, 1, 2; 360, 45, 1, 1]; 8 ->[360, 45, 1, 0; 360, 45, 1, 1]; 9 ->[360, 45, 1, 0; 360, 45, 1, 2];
        % 10->[360, 45,-1, 2; 360, 45,-1, 1]; 11->[360, 45,-1, 0; 360, 45,-1, 1]; 12->[360, 45,-1, 0; 360, 45,-1, 2];
        % test condition
        % 13->[360, 45, 1, 1; 296, 37, 1, 0]; 14->[360, 45, 1, 2; 296, 37, 1, 0];
        % 15->[296, 37, 1, 0; 360, 45, 1, 2]; 16->[296, 37, 1, 0; 360, 45, 1, 1];

%% 设置哪些试次是实验条件，哪些是控制条件
if find(current_block == 1)
    real_condition_list = (1:24);test_condition_list = (25:32);
elseif find(current_block == 2)
    real_condition_list = (1:24);test_condition_list = (25:32);
elseif find(current_block == 3)
    real_condition_list = (1:12);test_condition_list = (13:16);
elseif find(current_block == 4)
    real_condition_list = (1:12);test_condition_list = (13:16);
elseif find(current_block == 5)
    real_condition_list = [];test_condition_list = (1:8);
elseif find(current_block == 6)
    real_condition_list = (1:12);test_condition_list = (13:16);
elseif find(current_block == 7)
    real_condition_list = (1:12);test_condition_list = (13:16);
elseif find(current_block == 8)
    real_condition_list = (1:12);test_condition_list = (13:16);
end

%% 设置实验条件和控制条件的帧数和时间
Frame_list = [3*refresh_rate,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate;2.5*refresh_rate,3*refresh_rate;2.5*refresh_rate,3*refresh_rate];
Frame_list = [Frame_list;Frame_list];
if find(current_condition == real_condition_list) % 如果是正式实验条件
    Frame_first = 3 * refresh_rate;
    Frame_second = 3 * refresh_rate;
elseif find(current_condition == test_condition_list) % 如果是测试条件
    if find(current_block == 1)
        Frame_first = Frame_list(current_condition - 24,1);Frame_second = Frame_list(current_condition - 24,2);
    elseif find(current_block == 2)
        Frame_first = Frame_list(current_condition - 24,1);Frame_second = Frame_list(current_condition - 24,2);
    elseif find(current_block == 3)
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    elseif find(current_block == 4)
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    elseif find(current_block == 5)
        Frame_first = Frame_list(current_condition,1);Frame_second = Frame_list(current_condition,2);
    elseif find(current_block == 6)
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    elseif find(current_block == 7)
        Frame_list = [360,240;360,240;240,360;240,360];
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    elseif find(current_block == 8)
        Frame_list = [360,296;360,296;296,360;296,360];
        Frame_first = Frame_list(current_condition - 12,1);Frame_second = Frame_list(current_condition - 12,2);
    end
end
condition_idx.Time_first = (Frame_first-2) * (1000/refresh_rate); %ms,
condition_idx.Time_second = (Frame_second-2) * (1000/refresh_rate); %ms,

%% 生成实验条件
if find(current_block == 1)
    % 匀速运动，15/30/60/120Hz
    % 生成实验条件
    Frame = 3*refresh_rate;
    Dot_num_list = [Frame/(2^3),Frame/(2^2),Frame/2,Frame];
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
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = 0;%中间显示重复帧的位置
    condition_idx.color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = 0;%中间显示重复帧的位置
    condition_idx.color_change_second = 0;%中间重复的点颜色不变
    
elseif find(current_block == 2)
    % 单次呈现/重复呈现/颜色变化/位置变化
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
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = condition(current_condition,5);%中间显示重复帧的位置
    condition_idx.color_change_first = condition(current_condition,7);%中间重复的点颜色不变
    % 第二个刺激的参数
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = condition(current_condition,6);%中间显示重复帧的位置
    condition_idx.color_change_second = condition(current_condition,8);%中间重复的点颜色不变
    
    
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
    condition_idx.interleaf_first = 4;
    clockwise_first = condition_first(1);accelerate_style_first = condition_first(2);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first,accelerate_style_first);
    condition_idx.position_change_first = 0;%中间显示重复帧的位置
    condition_idx.color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = Frame_second/4;
    condition_idx.interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    condition_idx.position_change_second = 0;%中间显示重复帧的位置
    condition_idx.color_change_second = 0;%中间重复的点颜色不变
    
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
    condition_idx.interleaf_first = 4;
    clockwise_first = condition_first(1);accelerate_style_first = condition_first(2);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first,accelerate_style_first);
    condition_idx.position_change_first = 0;%中间显示重复帧的位置
    condition_idx.color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = Frame_second/4;
    condition_idx.interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    condition_idx.position_change_second = 0;%中间显示重复帧的位置
    condition_idx.color_change_second = 0;%中间重复的点颜色不变
    
    
elseif find(current_block == 5)
    % 匀速运动
    % 生成练习条件
    test_condition = [3*refresh_rate/2,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate/2;2.5*refresh_rate/2,3*refresh_rate;2.5*refresh_rate,3*refresh_rate/2];
    test_condition = [test_condition;test_condition];
    test_condition(1:size(test_condition,1)/2,3) = 1;test_condition(size(test_condition,1)/2+1:end,3) = -1;
    test_condition(1:size(test_condition,1)/2,4) = 1;test_condition(size(test_condition,1)/2+1:end,4) = -1;
%     test_condition = sortrows(test_condition,1);
    % 所有条件
    condition = test_condition;
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = 0;%中间显示重复帧的位置
    condition_idx.color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = 0;%中间显示重复帧的位置
    condition_idx.color_change_second = 0;%中间重复的点颜色不变
    
elseif find(current_block == 6)
    % 匀速运动，30/40/60Hz
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
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = 0;%中间显示重复帧的位置
    condition_idx.color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = 0;%中间显示重复帧的位置
    condition_idx.color_change_second = 0;%中间重复的点颜色不变
elseif find(current_block == 7)
    % 生成匀速条件，无序之间比较，有序-无序之间比较
    % 1 -> 30Hz无序-40Hz无序; 2 -> 30Hz无序-60Hz无序; 3 -> 40Hz无序-60Hz无序;
    % 4 -> 40Hz无序-30Hz无序; 5 -> 60Hz无序-30Hz无序; 6 -> 60Hz无序-40Hz无序;
    % 7 -> 30Hz有序-30Hz无序; 8 -> 40Hz有序-40Hz无序; 9 -> 60Hz有序-60Hz无序;
    % 10-> 30Hz无序-30Hz有序; 11-> 40Hz无序-40Hz有序; 12-> 60Hz无序-60Hz有序;
    % 测试
    % 13-> 30Hz无序-60Hz无序(3-2s); 14-> 40Hz有序-40Hz无序(3-2s); 15-> 60Hz无序-30Hz无序(2-3s); 16-> 40Hz无序-40Hz有序(2-3s);
    
    Frame = 3*refresh_rate; % 一共要呈现多少帧画面
    Dot_num_list = [Frame/4,Frame/3,Frame/2];% 30/40/60Hz
    % nchoosek（n，k），从n中取出k个数值，采用排列组合的方式。
    % flip（A,n）沿着第n个维度翻转A
    condition = [nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2);repmat(Dot_num_list',2,2)];
    % 1~6行是无序之间比较，区分不同事件发生频率的先后顺序，因此为3*2=6个实验条件
    % 7~12行是相同事件发生频率的有序和无序之间的比较，7~9为有序在前，10~12为无序在前
    % condition前两列为前后两刺激的点数，第三~四列为是否有序，有序为-1，无序为-2
    condition(1:6,3:4) = -2;condition(7:9,3:4) = repmat([-1,-2],3,1);condition(10:12,3:4) = repmat([-2,-1],3,1);
    test_condition = [90,120,-2,-2;120,80,-1,-2;120,90,-2,-2;80,120,-2,-1];
    % 所有条件
    condition = [condition;test_condition];
    
    Dot_num_first = condition(current_condition,1);accelerate_style_first = condition(current_condition,3);
    clockwise_first = 1;
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    if accelerate_style_first == -2 % 如果当前是乱序条件，则将点位置打乱
        condition_idx.Dot_position_first = condition_idx.Dot_position_first(:,:,randperm(size(condition_idx.Dot_position_first,3)));
    end
    condition_idx.position_change_first = 0;%中间显示重复帧的位置
    condition_idx.color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = condition(current_condition,4);
    clockwise_second = 1;
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    if accelerate_style_second == -2 % 如果当前是乱序条件，则将点位置打乱
        condition_idx.Dot_position_second = condition_idx.Dot_position_second(:,:,randperm(size(condition_idx.Dot_position_second,3)));
    end
    condition_idx.position_change_second = 0;%中间显示重复帧的位置
    condition_idx.color_change_second = 0;%中间重复的点颜色不变
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
    position_1 = zeros(Frame,2);position_1(1,:) = [Radius*sind(0),Radius*cosd(0)];
    for N_i = 1:length(degree_F)
        for N_ii = 1:degree_N(N_i)
            degree = degree + degree_F(N_i);
            position_1(p_i,:) = [Radius*sind(degree),Radius*cosd(degree)];
            p_i = p_i + 1;            
        end
    end
    position_1 = reshape(position_1',[1,2,Frame]);    
    
    
    Dot_num_first = condition(current_condition,1);
    clockwise_first = condition(current_condition,3);
    accelerate_style_first = condition(current_condition,5);    
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    if accelerate_style_first == 0 % 匀速运动
        angle_dot = linspace(0,2*pi,condition(current_condition,1));
        position_0 = zeros(1,2,condition(current_condition,1));
        for ii = 1:condition(current_condition,1)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        condition_idx.Dot_position_first = position_0;
    elseif accelerate_style_first == 1 % 加速运动
        condition_idx.Dot_position_first = position_1;
    elseif accelerate_style_first == 2 % 减速运动
        condition_idx.Dot_position_first = position_1(:,:,(end:-1:1)).*[-1,1];
    end
    if clockwise_first == 1
        condition_idx.Dot_position_first = condition_idx.Dot_position_first .* [-1,1];
    end
    condition_idx.position_change_first = 0;%中间显示重复帧的位置
    condition_idx.color_change_first = 0;%中间重复的点颜色不变
    
    Dot_num_second = condition(current_condition,2);
    clockwise_second = condition(current_condition,4);
    accelerate_style_second = condition(current_condition,6);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    if accelerate_style_second == 0 % 匀速运动
        angle_dot = linspace(0,2*pi,condition(current_condition,2));
        position_0 = zeros(1,2,condition(current_condition,2));
        for ii = 1:condition(current_condition,2)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        condition_idx.Dot_position_second = position_0;
    elseif accelerate_style_second == 1 % 加速运动
        condition_idx.Dot_position_second = position_1;
    elseif accelerate_style_second == 2 % 减速运动
        condition_idx.Dot_position_second = position_1(:,:,(end:-1:1)).*[-1,1];
    end
    if clockwise_second == 1
        condition_idx.Dot_position_second = condition_idx.Dot_position_second .* [-1,1];
    end
    condition_idx.position_change_second = 0;%中间显示重复帧的位置
    condition_idx.color_change_second = 0;%中间重复的点颜色不变
    
end

condition_idx.Frame_first = Frame_first;            condition_idx.Dot_num_first = Dot_num_first;
condition_idx.clockwise_first = clockwise_first;    condition_idx.accelerate_style_first = accelerate_style_first;
condition_idx.Frame_second = Frame_second;          condition_idx.Dot_num_second = Dot_num_second;
condition_idx.clockwise_second = clockwise_second;  condition_idx.accelerate_style_second = accelerate_style_second;



end