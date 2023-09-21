function Condition = Time_JND_InitCondition(Time_Max,Time_List,order,upordown,Fre,C_num,radius,RightMarker)
% ����ÿ�������ʵ�������а�����Щʵ������
% Time_Max = 3; % ��λ��������ͨ�� Time_Max ���������
% Time_List = [3,2;3,2;3,2;3,2;2,3;2,3;2,3;2,3]; % ÿ�������µı�׼ʱ�䳤��
% order = [1,1,0,0,1,1,0,0]; % �Ƿ��������,1������0������
% upordown = [1,1,1,1,-1,-1,-1,-1];
% C_num = 10; % ÿ���������ö��ٸ�����
% Fre = 30;  % �¼�����Ƶ�ʣ���ÿ�����֡����
% radius = 3; % ���˶��뾶
% RightMarker = [203,205]; % ��ȷѡ��ı��
%%
C_Class = size(Time_List,1); % һ���м���ʵ������
%% ÿ��ʵ�������ݶȷ����ȷ�����Ⱥ������Ӿ��̼���ʱ�䰲��
Condition.TimeList = cell(1,C_Class); % ÿһ��������Ӧһ��cell
Condition.upordown = upordown; % ÿ��ʵ�������ֱ��Ӧ���ǵ������ǵݼ�

for i = 1:C_Class  % ÿһ�����������������ݣ�������һ�γ��ֵ�ʱ�䳤�Ⱥ͵ڶ��γ��ֵ�ʱ�䳤��
    s = zeros(C_num,2);
    TimeList_i = Time_List(i,:);  % ��ǰ�������͵�ʵ��������ʼʱ�����ֹʱ��
    Condition.TimeList{i} = ones(C_num,2).*max(TimeList_i);
    
    TimeList_step = (max(TimeList_i)-min(TimeList_i))/C_num; % ʱ����
    TimeList = (min(TimeList_i):TimeList_step:max(TimeList_i)-TimeList_step)';
    % ȷ��ÿ��ʵ���Ⱥ�����ʱ��
    Condition.TimeList{i}(:,1) = flip(TimeList,1);% ��һ����ʱ��̵�
    % �����Ⱥ�����˳��,��ȷ��ѡ 1/2 �ĸ����ǶԵ�
    Condition.Right{i} = ones(C_num,1);
    s(1:ceil(C_num/2),:) = repmat([1,2],ceil(C_num/2),1);s(ceil(C_num/2)+1:end,:) = repmat([2,1],C_num-ceil(C_num/2),1);
    s = s(randperm(C_num),:); % �����1��2��������������
    for ci = 1:size(Condition.TimeList{i},1)
        buf = [Condition.TimeList{i}(ci,s(ci,1)),Condition.TimeList{i}(ci,s(ci,2))];
        Condition.TimeList{i}(ci,:) = buf; % ����˳��
        Condition.Right{i}(ci,1) = RightMarker(s(ci,:)==2);% ѡ���ĸ��̼����ֵ�ʱ���������ѡ��2����ȷ��
    end
end
% %% �ж�ÿ�������ǲ�������ÿ�������ĵ���ֵ�ʱ����ͬ
% for i = 1:C_Class
%     TimeList_i = Time_List(i,:);
%     Time_i = max(TimeList_i)-min(TimeList_i);
%     
%     if Time_i*Fre/C_num ~= round(Time_i*Fre/C_num)
%         text_i = ['��',num2str(i),'��ʵ�������д������һ�������ʱ�䲻�������'];
%         disp(text_i);
%     end
% end
%% ȷ���Ⱥ�����ʵ�������ĸ������
Condition.Condition = cell(1,C_Class); % Ԥ��ʵ�������ռ�
p_num = Time_Max * Fre; % һ���ж��ٸ���λ��
angle_list = linspace(0,2*pi,p_num); % ���ݵ�λ��������ȷ������λ�û�����
angle_list = [angle_list,angle_list]; % ֮��Ҫ���ȷ���˶���ʼλ�ã������γ�����Բ�ĵ�λ��
move_con = zeros(C_num,2);
for i = 1:C_Class
    
    Condition.Condition{i} = struct;  % Ԥ��ʵ�������ռ�
    Condition.Condition{i}.FirstTime = Condition.TimeList{i}(:,1).*1000; % ��һ��ʵ��̼�ʱ�䳤�ȣ�ms
    Condition.Condition{i}.SecondTime = Condition.TimeList{i}(:,2).*1000; % �ڶ���ʵ��̼�ʱ�䳤�ȣ�ms
    p_num_F = round(Condition.TimeList{i}(:,1) .* Fre);  % ��һ�γ��ֵĴ̼�ÿ��ʵ�������ж��ٸ���λ��
    p_num_S = round(Condition.TimeList{i}(:,2) .* Fre); % �ڶ��γ��ֵĴ̼�ÿ��ʵ�������ж��ٸ���λ��
    angle_F = cell(length(p_num_F),1);
    angle_S = cell(length(p_num_F),1);
    for c_n = 1:length(p_num_F)
        if i == 1 % ����ǵ�һ��ʵ����������ȷ�������Ӿ��̼���������֮��������������һ���������ͬ��λ��
            move_con(c_n,:) = randperm(p_num,2); % ǰ������ʵ��̼�����ʼ��λ��
        end
        angle_F{c_n} = angle_list(move_con(c_n,1):move_con(c_n,1)+p_num_F(c_n)-1); % ��һ��ʵ��̼�������λ�õĻ�����
        angle_S{c_n} = angle_list(move_con(c_n,2):move_con(c_n,2)+p_num_S(c_n)-1); % �ڶ���ʵ��̼�������λ�õĻ�����
    end
    Condition.Condition{i}.FirstPo = cell(length(p_num_F),1);
    Condition.Condition{i}.SecondPo = cell(length(p_num_F),1);
    for p_i = 1:length(p_num_F) % ����ÿһ��ʵ�������еĴ̼������õ�λ������
        % ��һ��ʵ��̼��ĵ�λ������
        po_i = length(angle_F{p_i});
        for ii = 1:po_i
            Condition.Condition{i}.FirstPo{p_i}(1,1,ii) = radius .* sin(angle_F{p_i}(ii));
            Condition.Condition{i}.FirstPo{p_i}(1,2,ii) = radius .* cos(angle_F{p_i}(ii));
        end
        % �ڶ���ʵ��̼��ĵ�λ������
        po_i = length(angle_S{p_i});
        for ii = 1:po_i
            Condition.Condition{i}.SecondPo{p_i}(1,1,ii) = radius .* sin(angle_S{p_i}(ii));
            Condition.Condition{i}.SecondPo{p_i}(1,2,ii) = radius .* cos(angle_S{p_i}(ii));
        end
        if order(i) == 0 % �����������������򽫲�ͬ֡��˳�����
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