global Re_num condition_idx Timestair initCondition Exp
% ���ݷ�����˳��/����ʱ��֪���Ĳ������
% ��3s/30Hz���Ӿ��̼�Ϊ�������γ�90����λ��
% ���ѡȡһ������Ϊ��ʼ�㣬�����Ӿ��̼�
% ǰ�������Ӿ��̼���ʱ����죬ѡ���ĸ�ʱ�����
% ��ʵ���жϵ��ǡ�1.9~2.5����Χ�ڣ���0.6/18(��33ms)Ϊ����жϿ���С�ɾ���
% ���У�ʵ������������2�ݶȷ���(����Ӵ�С,�����С����)��2�Ⱥ�˳��(��׼�̼���ǰ,��׼�̼��ں�)��2�Ƿ�����(����,����)
% �����������������Ⱥ���ֵ������Ӿ��̼���������ʼλ�����ѡȡһ���㣬����ȡҪ���ֵ�ʱ������Ӧ�ĵ�λ�á�
% Ҳ����˵����ʹ����������������е����һ����ɵĻ���Ҳ�Ͷ�Ӧ������������ͬ
% 
mouse_.showcursor(false);
hotkey('x', 'escape_screen(); assignin(''caller'',''continue_'',false);');
bhv_code(101,'white noise',102,'stimulus start',21,'stimulus first on',103,'stimulus first off',...
    104,'stimulus second on',105,'stimulus second off',106,'select first',107,'select second'); 
RightMarker = [203,205];% ѡ����ȷ�İ�����203��ʾ�����205��ʾ�Ҽ�

%% variable
time_jnd = [1.9,2.5];
Time_All = {[time_jnd;time_jnd],[time_jnd;time_jnd],[time_jnd;time_jnd],[time_jnd;time_jnd]};% ��������block
% Time_All = {[1,2;1,2;1,2;1,2],[1,2;1,2;1,2;1,2],[1,2;1,2;1,2;1,2],[1,2;1,2;1,2;1,2]};
upordown_all = {[-1,-1],[1,1],[1,1],[-1,-1]};
% upordown_all = {[1,1,1,1],[-1,-1,-1,-1]};
% ��ʼһ����˲��á������������򣬽��򡿣�֮����е��������С����򣬽��򣬽�������
order = [1,0];% 2��ʵ�������У�ǰһ��������ģ���һ���������
% 1����������2����������3����������4����������
C_style = {[1,2],[3,4],[3,4],[1,2]};

Current_Block = TrialRecord.CurrentBlock;%��ǰ���е����ĸ�block
if Current_Block == 1 % ��ϰ�׶�
    Block_Max = 1;
    rest_ntrial = 10; % ���ٸ� trial ֮�������Ϣ
    max_ntrial = 10; % ÿ��ʵ�����������ٸ� trial
    upordown_all = {[-1,-1]};
    C_style = {[1,2]};
else
    Block_Max = 4; % �����м��� block
    rest_ntrial = 30; % ���ٸ� trial ֮�������Ϣ
    max_ntrial = 40; % ÿ��ʵ�����������ٸ� trial
end

refresh_rate = 120;
Center = [0 0];%���ô̼����ֵ�λ��
Radius = 3; %degree
Dot_size = 0.3;
Dot_color = [1 1 1];
Time_Max = 3; % �� 3s �Ӿ��̼�Ϊ׼ѡȡ Time_All ʱ�䳤�ȵ��Ӿ��̼�
Fre = 20; % �¼�����Ƶ��ʹ��20Hz
C_num = round((max(time_jnd)-min(time_jnd))*Fre); % ÿ�����͵�ʵ��̼����ö��ٸ���ʵ������
initJump = ceil(C_num/3); % ��ʼ����
ncorinarow = 2; % ����������ξͿ��Խ�����һ��
nrevstosmall = 3; % ������ת3���򲽷���С
%% ȷ����ǰΪ�ĸ� block
if TrialRecord.CurrentTrialNumber == 1
    Exp.ntrial = max_ntrial; % ÿ��ʵ�����������ٸ� trial
    Exp.Block = 1;  % ��¼��ǰ�����ڼ��� block
    Exp.TinB = 1; % ��ǰ��� trial ����� block �еĵڼ��� 
    Re_num = 1;% ��¼����ʵ��һ�������˶��ٸ� trial������ȷ��ʲôʱ����Գ�����Ϣ����
else
    if length(TrialRecord.LastTrialCodes.CodeNumbers) == 11
        Re_num = Re_num + 1;
    end
end
%% ȷ����ǰ��� block �����е�ʵ������
if Exp.TinB == 1 % �������� block �ĵ�һ��������Ҫ��ǰԤ������ block ����������
    Time_List = Time_All{Exp.Block}; % ��ǰ��� block ���е����ĸ�����
    initCondition = Time_JND_InitCondition(Time_Max,Time_List,order,upordown_all{Exp.Block},Fre,C_num,Radius,RightMarker);% �õ���ʵ�������У��ֱ��� ����S-Q ����Q-S ����S-Q ����Q-S
    upordown = initCondition.upordown;
    Timestair = Time_JND_InitStair(upordown, C_num, Exp.ntrial, initJump); % ��ʼ��ʵ������
end
%% ���õ�ǰʵ������
time_shift = (1000/refresh_rate)*2;
C_Class = Timestair.whichstair(Exp.TinB); % ��ǰ���е��ĸ����͵�ʵ��
C_S = Timestair.trials(Timestair.st_num(C_Class),C_Class);  % ��ǰ���е����ĸ����͵��ĸ�ʵ������
condition_idx.Time_first = initCondition.Condition{C_Class}.FirstTime(C_S) - time_shift; %��һ��ʵ��̼��ĳ���ʱ��
condition_idx.Time_second = initCondition.Condition{C_Class}.SecondTime(C_S) - time_shift; % �ڶ���ʵ��̼��ĳ���ʱ��
condition_idx.interleaf = ceil(refresh_rate/Fre); % ÿһ֡ʵ��̼�ͼ����ظ�����
condition_idx.Dot_position_first = initCondition.Condition{C_Class}.FirstPo{C_S}; % ��һ��ʵ�������ĵ�λ������
condition_idx.Dot_position_second = initCondition.Condition{C_Class}.SecondPo{C_S}; % �ڶ���ʵ�������ĵ�λ������
condition_idx.Dot_num_first = size(condition_idx.Dot_position_first,3); % ��һ��ʵ���������ֵĻ��������
condition_idx.Dot_num_second = size(condition_idx.Dot_position_second,3); % �ڶ���ʵ���������ֵĻ��������
condition_idx.Right = initCondition.Right{C_Class}(C_S); % ѡ���ĸ����ǶԵ�
JND = abs(condition_idx.Time_first - condition_idx.Time_second)/1000;
condition_idx.C_style = C_style{Exp.Block}(C_Class);
Con_style = condition_idx.C_style;
bhv_variable('Exp',Exp);
%% ʱ��
% fix_time = round(random('unif',500,800,[1,1]));%ע�ӵ�������޴������ע�ӵ㣬ע�ӵ����ʱ����0.3~0.5s�����
fix_time_hold = 1000;
white_time = 300;
white_black = 200;
white2_list = SelectPicture(17,17,2);
white5_list = SelectPicture(17,17,2);

%% trial
% ���ڳ��ֵ�ָ����
txt = ImageGraphic(null_);
txt.List = {'txt.bmp',[0 0],0.5};
kc = KeyChecker(mouse_);
kc.KeyNum = 1;
and = AndAdapter(txt);
and.add(kc);
scene = create_scene(and);

% ���ڳ�����Ϣ����
txt0 = ImageGraphic(null_);
txt0.List = {'txt_rest.bmp',[0 0],0.5};
kc0 = KeyChecker(mouse_);
kc0.KeyNum = 1;
and0 = AndAdapter(txt0);
and0.add(kc0);
scene0 = create_scene(and0);

% ���ڳ��ֵ�ָ����
txt_E = ImageGraphic(null_);
txt_E.List = {'txt_end.bmp',[0 0],0.5};
kc_E = KeyChecker(mouse_);
kc_E.KeyNum = 1;
and_E = AndAdapter(txt_E);
and_E.add(kc_E);
scene_E = create_scene(and_E);

% scene 2:wait first
box2 = BoxGraphic(null_);
box2.List = {[1 0 0],[1 0 0],[0.5,0.05],[0,0],1,0;...
[1 0 0],[1 0 0],[0.05,0.5],[0,0],1,0};
tc2 = TimeCounter(box2);
tc2.Duration = white_black;
scene2 = create_scene(tc2);
% scene_w2 : white noise
white2 = ImageChanger(null_);
white2.ImageList = white2_list;
con2 = Concurrent(white2);
con2.add(box2);
scene_w2 = create_scene(con2);



% scene3:stimulus first on
box3 = CircleGraphic(null_);
box3.List = {Dot_color,Dot_color,Dot_size,Center,1,0};
dot3 = CircleTime(null_); %��fix3�ɹ�ʱ��dot�Ż����У���fix3ֹͣʱdot��ֹͣ
dot3.Center = Center;
dot3.DotSize = Dot_size;
dot3.DotColor = Dot_color;
dot3.Dot_position = condition_idx.Dot_position_first;
dot3.Frame = condition_idx.Dot_num_first;
dot3.Interleaf = condition_idx.interleaf;
con3 = Concurrent(box3);
con3.add(dot3);
tc3 = TimeCounter(con3);
tc3.Duration = condition_idx.Time_first;
scene3 = create_scene(tc3);

% scene4: hold
box4 = BoxGraphic(null_);
box4.List = {[0 0 0],[0 0 0],[0.5,0.05],[0,0],1,0;...
[0 0 0],[0 0 0],[0.05,0.5],[0,0],1,0};
tc4 = TimeCounter(box4);
tc4.Duration = fix_time_hold;
scene4 =create_scene(tc4);


% scene 5:wait second
box5 = BoxGraphic(null_);
box5.List = {[1 0 0],[1 0 0],[0.5,0.05],[0,0],1,0;...
[1 0 0],[1 0 0],[0.05,0.5],[0,0],1,0};
tc5 = TimeCounter(box5);
tc5.Duration = white_black;
scene5 = create_scene(tc5);
% scene : white noise
white5 = ImageChanger(null_);
white5.ImageList = white5_list;
con5 = Concurrent(white5);
con5.add(box5);
scene_w5 = create_scene(con5);

% scene6:stimulus second on
box6 = CircleGraphic(null_);
box6.List = {Dot_color,Dot_color,Dot_size,Center,1,0};
dot6 = CircleTime(null_); %��fix4�ɹ�ʱ��dot�Ż����У���fix4ֹͣʱdot��ֹͣ
dot6.Center = Center;
dot6.DotSize = Dot_size;
dot6.DotColor = Dot_color;
dot6.Dot_position = condition_idx.Dot_position_second;
dot6.Frame = condition_idx.Dot_num_second;
dot6.Interleaf = condition_idx.interleaf;
con6 = Concurrent(box6);
con6.add(dot6);
tc6 = TimeCounter(con6);
tc6.Duration = condition_idx.Time_second;
scene6 = create_scene(tc6);


% scene 7:select
box7 = BoxGraphic(null_);
box7.List = {[1 0 0],[1 0 0],[0.5,0.05],[0,0],1,0;...
[1 0 0],[1 0 0],[0.05,0.5],[0,0],1,0};
tc7 = TimeCounter_Han(box7);
tc7.Duration = 3000;
kc7_1 = KeyChecker(mouse_);
kc7_1.KeyNum = 2;
kc7_2 = KeyChecker(mouse_);
kc7_2.KeyNum = 3;
or7_1 = OrAdapter(kc7_1);
or7_1.add(kc7_2);
or7_2 = OrAdapter(or7_1);
or7_2.add(tc7);
scene7 = create_scene(or7_2);


% task
dashboard(1,sprintf('First: Time = %d, Dot_num = %d',round(condition_idx.Time_first+time_shift),condition_idx.Dot_num_first));
dashboard(2,sprintf('Second: Time = %d, Dot_num = %d',round(condition_idx.Time_second+time_shift),condition_idx.Dot_num_second));

error_type = 0;
if TrialRecord.CurrentTrialNumber == 1 % ���������ʵ���еĵ�һ�� trial������ָ����
    run_scene(scene);
end
before_s = trialtime;
run_scene(scene_w2,101); % ����
run_scene(scene2,102);%�м�ע��ʮ�ֳ��֣�������marker102
run_scene(scene3,21);  %���ֵ�һ���̼���������marker
run_scene(scene4,103);% �м������ʼ����һ���Ӿ��̼�����
run_scene(scene_w5,101); % ����
run_scene(scene5,102);% �м�ע��ʮ�ֳ��֣�������marker102
run_scene(scene6,104);% ���ֵڶ����̼���������marker
after_s = trialtime;
run_scene(scene7,105);% ��ʼ��ѡ���ڶ����Ӿ��̼�����
idle(0);
if kc7_1.Success
    eventmarker(106);
    select_time = kc7_1.Time; % ��ѡ���ʱ��
    rt = kc7_1.Time - tc7.start_time; % ��Ӧʱ
    scancode = 203;% ѡ�����
elseif kc7_2.Success
    eventmarker(107);
    select_time = kc7_2.Time;
    rt = kc7_2.Time - tc7.start_time;
    scancode = 205;% ѡ���Ҽ�
else
    error_type = 1;
    select_time = 0;
    rt = 0;
    scancode = 0;
end
%% �ж�ѡ���Ƿ���ȷ
TorF = 0;
if scancode % �������ѡ��
    Exp.TinB = Exp.TinB + 1; % ��� block �������� trial ������
    if condition_idx.Right == scancode,TorF = 1;end
    Timestair = Time_JND_StairUpdate(Timestair, TorF, ncorinarow, nrevstosmall);
end
if Timestair.ExpRun ~= 1 % �����ǰ��� block �������� block �������ӣ����� TinB ���¹� 1
    Exp.Block = Exp.Block + 1;
    disp(['�Ѿ���ʼ���� ',num2str(Exp.Block),' �� block'])
    disp(['֮ǰ�Ѿ������� ',num2str(Exp.TinB),' �� trial'])
    Exp.TinB = 1;
end
if Exp.Block > Block_Max
    run_scene(scene_E);% ���������� block ��������ֽ�����ͼ��
    escape_screen(); % �˳�ʵ��
else
    if mod(Re_num,rest_ntrial) == 0,run_scene(scene0);end % ������Ϣ�Ļ���
end 

bhv_variable('condition_idx',condition_idx,'initCondition',initCondition,'Timestair',Timestair);
bhv_variable('select_time',select_time,'answer',scancode,'Con_style',Con_style,'JND',JND,'TorF',TorF)
bhv_variable('before_s',before_s,'after_s',after_s)
%��������¼��Trial.UserVars��
trialerror(error_type);

dashboard(1,'');
dashboard(2,'');
dashboard(3,'');
idle(0);  % clear screen

set_iti(200);%trial�ļ��ʱ��

