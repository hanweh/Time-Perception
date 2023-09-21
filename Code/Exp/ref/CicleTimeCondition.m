function condition_idx = CicleTimeCondition(current_block,current_condition,refresh_rate,Radius,angle)
% ����ʱ��֪��ʵ�����������
% block: 1->�����˶�    2->�����˶��м���˸���    3->�ȱ����˶�    4->�ȼ��ٺ���ٻ����ȼ��ٺ����
% 1->���¼�����Ƶ�ʲ���
% 2->����ɫ���ظ�������λ�ò���
% 3->���ȱ����˶�
% 4->�Ǳ���ٶ��˶�
% 5->����ϰ�׶�
% 6->�������¼�����Ƶ�ʲ���
% 7->������/���������������������ȣ�����������
% 8->�Ǽ���/����/�����˶�֮��ıȽϣ�������45���㣬��15Hz���Ӿ��̼�����������/���ٲ��Ǿ��ȱ仯�ģ��������С����Ҳ����30Hzʱ�ľ���
% condition�� 
    % block == 1 ʱ�������˶�
    % 1:45��λ�ã�2��90��λ�ã�3��180��λ�ã�4��360��λ��
    % [֡�� ���� ����1 ����1��֡�� ���� ����-1 ����2]
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
        
    % block == 2 ʱ�������˶��м���˸���
    % 1:20��λ�ó���1�Σ�2��20��λ�ó���3�Σ�3��20��λ�ó���3�β�ͬ��ɫ��4��60��λ��
    %[֡��������������1������0���м䲻��ʾ1���м����ɫ1]
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
        
    % block == 3 ʱ���ȱ����˶�
    % 1���ȼ��٣�2���ȼ��٣�3������
        % real condition
        % 1 ->[360, 90, 1, 1; 360, 90, 1, 2]; 2 ->[360, 90, 1, 1; 360, 90, 1, 0]; 3 ->[360, 90, 1, 2; 360, 90, 1, 0];
        % 4 ->[360, 90,-1, 1; 360, 90,-1, 2]; 5 ->[360, 90,-1, 1; 360, 90,-1, 0]; 6 ->[360, 90,-1, 2; 360, 90,-1, 0];
        % 7 ->[360, 90, 1, 2; 360, 90, 1, 1]; 8 ->[360, 90, 1, 0; 360, 90, 1, 1]; 9 ->[360, 90, 1, 0; 360, 90, 1, 2];
        % 10->[360, 90,-1, 2; 360, 90,-1, 1]; 11->[360, 90,-1, 0; 360, 90,-1, 1]; 12->[360, 90,-1, 0; 360, 90,-1, 2];
        % test condition
        % 13->[360, 90, 1, 1; 300, 75, 1, 2]; 14->[360, 90, 1, 2; 300, 75, 1, 1];
        % 15->[300, 75, 1, 1; 360, 90, 1, 2]; 16->[300, 75, 1, 2; 360, 90, 1, 1];
        
    % block == 4 ʱ���ȼ��ٺ���ٻ����ȼ��ٺ����
    % 1���ȼ��ٺ���٣�2���ȼ��ٺ���٣�3������
        % real condition
        % 1 ->[360, 90, 1, 3; 360, 90, 1, 4]; 2 ->[360, 90, 1, 3; 360, 90, 1, 0]; 3 ->[360, 90, 1, 4; 360, 90, 1, 0];
        % 4 ->[360, 90,-1, 3; 360, 90,-1, 4]; 5 ->[360, 90,-1, 3; 360, 90,-1, 0]; 6 ->[360, 90,-1, 4; 360, 90,-1, 0];
        % 7 ->[360, 90, 1, 4; 360, 90, 1, 3]; 8 ->[360, 90, 1, 0; 360, 90, 1, 3]; 9 ->[360, 90, 1, 0; 360, 90, 1, 4];
        % 10->[360, 90,-1, 4; 360, 90,-1, 3]; 11->[360, 90,-1, 0; 360, 90,-1, 3]; 12->[360, 90,-1, 0; 360, 90,-1, 4];
        % test condition
        % 13->[360, 90, 1, 3; 300, 75, 1, 4]; 14->[360, 90, 1, 4; 300, 75, 1, 3];
        % 15->[300, 75, 1, 3; 360, 90, 1, 4]; 16->[300, 75, 1, 4; 360, 90, 1, 3];
        
    % block == 6 ʱ�������˶�
    % [֡�� ���� ����1 ��֡�� ���� ����-1 ]
        % 1 ->[360,120, 1,0; 360,180, 1,0]; 2 ->[360,120, 1,0; 360,360, 1,0]; 3 ->[360,180, 1,0; 360,360, 1,0];
        % 4 ->[360,120,-1,0; 360,180,-1,0]; 5 ->[360,120,-1,0; 360,360,-1,0]; 6 ->[360,180,-1,0; 360,360,-1,0];
        % 7 ->[360,180, 1,0; 360,120, 1,0]; 8 ->[360,360, 1,0; 360,120, 1,0]; 9 ->[360,360, 1,0; 360,180, 1,0];
        %10 ->[360,180,-1,0; 360,120,-1,0];11 ->[360,360,-1,0; 360,120,-1,0];12 ->[360,360,-1,0; 360,180,-1,0];
        %13 ->[360,180, 1,0; 300,300, 1,0];14 ->[360,360,-1,0; 300,150,-1,0];
        %15 ->[300,150, 1,0; 360,180, 1,0];16 ->[300,300,-1,0; 360,180,-1,0];
        
    % block == 7 ʱ������/����
        % 1 -> 30Hz����-40Hz����; 2 -> 30Hz����-60Hz����; 3 -> 40Hz����-60Hz����;
        % 4 -> 40Hz����-30Hz����; 5 -> 60Hz����-30Hz����; 6 -> 60Hz����-40Hz����;
        % 7 -> 30Hz����-30Hz����; 8 -> 40Hz����-40Hz����; 9 -> 60Hz����-60Hz����;
        % 10-> 30Hz����-30Hz����; 11-> 40Hz����-40Hz����; 12-> 60Hz����-60Hz����;
        % ����
        % 13-> 30Hz����-60Hz����(3-2s); 14-> 40Hz����-40Hz����(3-2s); 15-> 60Hz����-30Hz����(2-3s); 16-> 40Hz����-40Hz����(2-3s);
        
    % block == 8 ʱ�������˶���������45���㣬��15Hz���Ӿ��̼�����������/���ٲ��Ǿ��ȱ仯�ģ��������С����Ҳ����30Hzʱ�ľ���
    % 1�����٣�2�����٣�3������
        % real condition
        % 1 ->[360, 45, 1, 1; 360, 45, 1, 2]; 2 ->[360, 45, 1, 1; 360, 45, 1, 0]; 3 ->[360, 45, 1, 2; 360, 45, 1, 0];
        % 4 ->[360, 45,-1, 1; 360, 45,-1, 2]; 5 ->[360, 45,-1, 1; 360, 45,-1, 0]; 6 ->[360, 45,-1, 2; 360, 45,-1, 0];
        % 7 ->[360, 45, 1, 2; 360, 45, 1, 1]; 8 ->[360, 45, 1, 0; 360, 45, 1, 1]; 9 ->[360, 45, 1, 0; 360, 45, 1, 2];
        % 10->[360, 45,-1, 2; 360, 45,-1, 1]; 11->[360, 45,-1, 0; 360, 45,-1, 1]; 12->[360, 45,-1, 0; 360, 45,-1, 2];
        % test condition
        % 13->[360, 45, 1, 1; 296, 37, 1, 0]; 14->[360, 45, 1, 2; 296, 37, 1, 0];
        % 15->[296, 37, 1, 0; 360, 45, 1, 2]; 16->[296, 37, 1, 0; 360, 45, 1, 1];

%% ������Щ�Դ���ʵ����������Щ�ǿ�������
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

%% ����ʵ�������Ϳ���������֡����ʱ��
Frame_list = [3*refresh_rate,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate;2.5*refresh_rate,3*refresh_rate;2.5*refresh_rate,3*refresh_rate];
Frame_list = [Frame_list;Frame_list];
if find(current_condition == real_condition_list) % �������ʽʵ������
    Frame_first = 3 * refresh_rate;
    Frame_second = 3 * refresh_rate;
elseif find(current_condition == test_condition_list) % ����ǲ�������
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

%% ����ʵ������
if find(current_block == 1)
    % �����˶���15/30/60/120Hz
    % ����ʵ������
    Frame = 3*refresh_rate;
    Dot_num_list = [Frame/(2^3),Frame/(2^2),Frame/2,Frame];
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
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = 0;%�м��ظ��ĵ���ɫ����
    
elseif find(current_block == 2)
    % ���γ���/�ظ�����/��ɫ�仯/λ�ñ仯
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
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = condition(current_condition,5);%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = condition(current_condition,7);%�м��ظ��ĵ���ɫ����
    % �ڶ����̼��Ĳ���
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = condition(current_condition,6);%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = condition(current_condition,8);%�м��ظ��ĵ���ɫ����
    
    
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
    condition_idx.interleaf_first = 4;
    clockwise_first = condition_first(1);accelerate_style_first = condition_first(2);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first,accelerate_style_first);
    condition_idx.position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = Frame_second/4;
    condition_idx.interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    condition_idx.position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = 0;%�м��ظ��ĵ���ɫ����
    
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
    condition_idx.interleaf_first = 4;
    clockwise_first = condition_first(1);accelerate_style_first = condition_first(2);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first,accelerate_style_first);
    condition_idx.position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = Frame_second/4;
    condition_idx.interleaf_second = 4;
    clockwise_second = condition_second(1);accelerate_style_second = condition_second(2);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second,accelerate_style_second);
    condition_idx.position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = 0;%�м��ظ��ĵ���ɫ����
    
    
elseif find(current_block == 5)
    % �����˶�
    % ������ϰ����
    test_condition = [3*refresh_rate/2,2.5*refresh_rate;3*refresh_rate,2.5*refresh_rate/2;2.5*refresh_rate/2,3*refresh_rate;2.5*refresh_rate,3*refresh_rate/2];
    test_condition = [test_condition;test_condition];
    test_condition(1:size(test_condition,1)/2,3) = 1;test_condition(size(test_condition,1)/2+1:end,3) = -1;
    test_condition(1:size(test_condition,1)/2,4) = 1;test_condition(size(test_condition,1)/2+1:end,4) = -1;
%     test_condition = sortrows(test_condition,1);
    % ��������
    condition = test_condition;
    Dot_num_first = condition(current_condition,1);accelerate_style_first = 0;
    clockwise_first = condition(current_condition,3);
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = 0;%�м��ظ��ĵ���ɫ����
    
elseif find(current_block == 6)
    % �����˶���30/40/60Hz
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
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    condition_idx.position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = 0;
    clockwise_second = condition(current_condition,4);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    condition_idx.position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = 0;%�м��ظ��ĵ���ɫ����
elseif find(current_block == 7)
    % ������������������֮��Ƚϣ�����-����֮��Ƚ�
    % 1 -> 30Hz����-40Hz����; 2 -> 30Hz����-60Hz����; 3 -> 40Hz����-60Hz����;
    % 4 -> 40Hz����-30Hz����; 5 -> 60Hz����-30Hz����; 6 -> 60Hz����-40Hz����;
    % 7 -> 30Hz����-30Hz����; 8 -> 40Hz����-40Hz����; 9 -> 60Hz����-60Hz����;
    % 10-> 30Hz����-30Hz����; 11-> 40Hz����-40Hz����; 12-> 60Hz����-60Hz����;
    % ����
    % 13-> 30Hz����-60Hz����(3-2s); 14-> 40Hz����-40Hz����(3-2s); 15-> 60Hz����-30Hz����(2-3s); 16-> 40Hz����-40Hz����(2-3s);
    
    Frame = 3*refresh_rate; % һ��Ҫ���ֶ���֡����
    Dot_num_list = [Frame/4,Frame/3,Frame/2];% 30/40/60Hz
    % nchoosek��n��k������n��ȡ��k����ֵ������������ϵķ�ʽ��
    % flip��A,n�����ŵ�n��ά�ȷ�תA
    condition = [nchoosek(Dot_num_list,2);flip(nchoosek(Dot_num_list,2),2);repmat(Dot_num_list',2,2)];
    % 1~6��������֮��Ƚϣ����ֲ�ͬ�¼�����Ƶ�ʵ��Ⱥ�˳�����Ϊ3*2=6��ʵ������
    % 7~12������ͬ�¼�����Ƶ�ʵ����������֮��ıȽϣ�7~9Ϊ������ǰ��10~12Ϊ������ǰ
    % conditionǰ����Ϊǰ�����̼��ĵ���������~����Ϊ�Ƿ���������Ϊ-1������Ϊ-2
    condition(1:6,3:4) = -2;condition(7:9,3:4) = repmat([-1,-2],3,1);condition(10:12,3:4) = repmat([-2,-1],3,1);
    test_condition = [90,120,-2,-2;120,80,-1,-2;120,90,-2,-2;80,120,-2,-1];
    % ��������
    condition = [condition;test_condition];
    
    Dot_num_first = condition(current_condition,1);accelerate_style_first = condition(current_condition,3);
    clockwise_first = 1;
    condition_idx.interleaf_first = ceil(Frame_first / Dot_num_first);
    condition_idx.Dot_position_first = CircleTimePosition(Dot_num_first,Radius,angle,clockwise_first);
    if accelerate_style_first == -2 % �����ǰ�������������򽫵�λ�ô���
        condition_idx.Dot_position_first = condition_idx.Dot_position_first(:,:,randperm(size(condition_idx.Dot_position_first,3)));
    end
    condition_idx.position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);accelerate_style_second = condition(current_condition,4);
    clockwise_second = 1;
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    condition_idx.Dot_position_second = CircleTimePosition(Dot_num_second,Radius,angle,clockwise_second);
    if accelerate_style_second == -2 % �����ǰ�������������򽫵�λ�ô���
        condition_idx.Dot_position_second = condition_idx.Dot_position_second(:,:,randperm(size(condition_idx.Dot_position_second,3)));
    end
    condition_idx.position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = 0;%�м��ظ��ĵ���ɫ����
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
    if accelerate_style_first == 0 % �����˶�
        angle_dot = linspace(0,2*pi,condition(current_condition,1));
        position_0 = zeros(1,2,condition(current_condition,1));
        for ii = 1:condition(current_condition,1)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        condition_idx.Dot_position_first = position_0;
    elseif accelerate_style_first == 1 % �����˶�
        condition_idx.Dot_position_first = position_1;
    elseif accelerate_style_first == 2 % �����˶�
        condition_idx.Dot_position_first = position_1(:,:,(end:-1:1)).*[-1,1];
    end
    if clockwise_first == 1
        condition_idx.Dot_position_first = condition_idx.Dot_position_first .* [-1,1];
    end
    condition_idx.position_change_first = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_first = 0;%�м��ظ��ĵ���ɫ����
    
    Dot_num_second = condition(current_condition,2);
    clockwise_second = condition(current_condition,4);
    accelerate_style_second = condition(current_condition,6);
    condition_idx.interleaf_second = ceil(Frame_second / Dot_num_second);
    if accelerate_style_second == 0 % �����˶�
        angle_dot = linspace(0,2*pi,condition(current_condition,2));
        position_0 = zeros(1,2,condition(current_condition,2));
        for ii = 1:condition(current_condition,2)
            position_0(1,1,ii) = Radius .* sin(angle_dot(ii));
            position_0(1,2,ii) = Radius .* cos(angle_dot(ii));
        end
        condition_idx.Dot_position_second = position_0;
    elseif accelerate_style_second == 1 % �����˶�
        condition_idx.Dot_position_second = position_1;
    elseif accelerate_style_second == 2 % �����˶�
        condition_idx.Dot_position_second = position_1(:,:,(end:-1:1)).*[-1,1];
    end
    if clockwise_second == 1
        condition_idx.Dot_position_second = condition_idx.Dot_position_second .* [-1,1];
    end
    condition_idx.position_change_second = 0;%�м���ʾ�ظ�֡��λ��
    condition_idx.color_change_second = 0;%�м��ظ��ĵ���ɫ����
    
end

condition_idx.Frame_first = Frame_first;            condition_idx.Dot_num_first = Dot_num_first;
condition_idx.clockwise_first = clockwise_first;    condition_idx.accelerate_style_first = accelerate_style_first;
condition_idx.Frame_second = Frame_second;          condition_idx.Dot_num_second = Dot_num_second;
condition_idx.clockwise_second = clockwise_second;  condition_idx.accelerate_style_second = accelerate_style_second;



end