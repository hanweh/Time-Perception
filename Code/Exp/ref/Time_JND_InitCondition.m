function Condition = Time_JND_InitCondition(Time_Max,Time_List,order,upordown,Fre,C_num,radius,RightMarker)
% 设置每个种类的实验条件中包括哪些实验条件
% Time_Max = 3; % 点位置坐标是通过 Time_Max 计算出来的
% Time_List = [3,2;3,2;3,2;3,2;2,3;2,3;2,3;2,3]; % 每种条件下的标准时间长度
% order = [1,1,0,0,1,1,0,0]; % 是否是有序的,1是有序，0是无序
% upordown = [1,1,1,1,-1,-1,-1,-1];
% C_num = 10; % 每种条件设置多少个条件
% Fre = 30;  % 事件发生频率，即每秒多少帧画面
% radius = 3; % 点运动半径
% RightMarker = [203,205]; % 正确选择的标记
%%
C_Class = size(Time_List,1); % 一共有几类实验条件
%% 每个实验条件梯度方向的确定及先后两个视觉刺激的时间安排
Condition.TimeList = cell(1,C_Class); % 每一类条件对应一个cell
Condition.upordown = upordown; % 每个实验条件分别对应的是递增还是递减

for i = 1:C_Class  % 每一类条件中有两列数据，包含第一次呈现的时间长度和第二次呈现的时间长度
    s = zeros(C_num,2);
    TimeList_i = Time_List(i,:);  % 当前这种类型的实验条件起始时间和终止时间
    Condition.TimeList{i} = ones(C_num,2).*max(TimeList_i);
    
    TimeList_step = (max(TimeList_i)-min(TimeList_i))/C_num; % 时间间隔
    TimeList = (min(TimeList_i):TimeList_step:max(TimeList_i)-TimeList_step)';
    % 确定每个实验先后两个时间
    Condition.TimeList{i}(:,1) = flip(TimeList,1);% 第一列是时间短的
    % 打乱先后两个顺序,并确定选 1/2 哪个才是对的
    Condition.Right{i} = ones(C_num,1);
    s(1:ceil(C_num/2),:) = repmat([1,2],ceil(C_num/2),1);s(ceil(C_num/2)+1:end,:) = repmat([2,1],C_num-ceil(C_num/2),1);
    s = s(randperm(C_num),:); % 随机将1、2两个数进行排序
    for ci = 1:size(Condition.TimeList{i},1)
        buf = [Condition.TimeList{i}(ci,s(ci,1)),Condition.TimeList{i}(ci,s(ci,2))];
        Condition.TimeList{i}(ci,:) = buf; % 打乱顺序
        Condition.Right{i}(ci,1) = RightMarker(s(ci,:)==2);% 选择哪个刺激呈现的时间更长，则选择2是正确的
    end
end
% %% 判断每个条件是不是满足每个单独的点呈现的时间相同
% for i = 1:C_Class
%     TimeList_i = Time_List(i,:);
%     Time_i = max(TimeList_i)-min(TimeList_i);
%     
%     if Time_i*Fre/C_num ~= round(Time_i*Fre/C_num)
%         text_i = ['第',num2str(i),'种实验条件中存在最后一个点呈现时间不足的条件'];
%         disp(text_i);
%     end
% end
%% 确定先后两个实验条件的各项参数
Condition.Condition = cell(1,C_Class); % 预设实验条件空间
p_num = Time_Max * Fre; % 一共有多少个点位置
angle_list = linspace(0,2*pi,p_num); % 根据点位置数量，确定出点位置弧度数
angle_list = [angle_list,angle_list]; % 之后要随机确定运动起始位置，所以形成两个圆的点位置
move_con = zeros(C_num,2);
for i = 1:C_Class
    
    Condition.Condition{i} = struct;  % 预设实验条件空间
    Condition.Condition{i}.FirstTime = Condition.TimeList{i}(:,1).*1000; % 第一个实验刺激时间长度，ms
    Condition.Condition{i}.SecondTime = Condition.TimeList{i}(:,2).*1000; % 第二个实验刺激时间长度，ms
    p_num_F = round(Condition.TimeList{i}(:,1) .* Fre);  % 第一次呈现的刺激每个实验条件有多少个点位置
    p_num_S = round(Condition.TimeList{i}(:,2) .* Fre); % 第二次呈现的刺激每个实验条件有多少个点位置
    angle_F = cell(length(p_num_F),1);
    angle_S = cell(length(p_num_F),1);
    for c_n = 1:length(p_num_F)
        if i == 1 % 如果是第一种实验条件，则确定有序视觉刺激的条件，之后的无序、有序都与第一次这个是相同的位置
            move_con(c_n,:) = randperm(p_num,2); % 前后两个实验刺激的起始点位置
        end
        angle_F{c_n} = angle_list(move_con(c_n,1):move_con(c_n,1)+p_num_F(c_n)-1); % 第一个实验刺激各个点位置的弧度数
        angle_S{c_n} = angle_list(move_con(c_n,2):move_con(c_n,2)+p_num_S(c_n)-1); % 第二个实验刺激各个点位置的弧度数
    end
    Condition.Condition{i}.FirstPo = cell(length(p_num_F),1);
    Condition.Condition{i}.SecondPo = cell(length(p_num_F),1);
    for p_i = 1:length(p_num_F) % 对于每一个实验条件中的刺激，设置点位置坐标
        % 第一个实验刺激的点位置坐标
        po_i = length(angle_F{p_i});
        for ii = 1:po_i
            Condition.Condition{i}.FirstPo{p_i}(1,1,ii) = radius .* sin(angle_F{p_i}(ii));
            Condition.Condition{i}.FirstPo{p_i}(1,2,ii) = radius .* cos(angle_F{p_i}(ii));
        end
        % 第二个实验刺激的点位置坐标
        po_i = length(angle_S{p_i});
        for ii = 1:po_i
            Condition.Condition{i}.SecondPo{p_i}(1,1,ii) = radius .* sin(angle_S{p_i}(ii));
            Condition.Condition{i}.SecondPo{p_i}(1,2,ii) = radius .* cos(angle_S{p_i}(ii));
        end
        if order(i) == 0 % 如果是无序的条件，则将不同帧的顺序打乱
            F_P = Condition.Condition{i}.FirstPo{p_i};
            S_P = Condition.Condition{i}.SecondPo{p_i};
            F_P = F_P(:,:,randperm(size(F_P,3)));
            S_P = S_P(:,:,randperm(size(S_P,3)));
            Condition.Condition{i}.FirstPo{p_i} = F_P;
            Condition.Condition{i}.SecondPo{p_i} = S_P;
        end
    end
    
end








end