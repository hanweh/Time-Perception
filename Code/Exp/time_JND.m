global Re_num condition_idx Timestair initCondition Exp
% 阶梯法测量顺序/乱序时间知觉的差别阈限
% 以3s/30Hz的视觉刺激为基础，形成90个点位置
% 随机选取一个点作为起始点，呈现视觉刺激
% 前后两个视觉刺激有时间差异，选择哪个时间更长
% 本实验判断的是【1.9~2.5】范围内，以0.6/18(即33ms)为间隔判断看最小可觉差
% 其中，实验条件包括：2梯度方向(差异从大到小,差异从小到大)×2先后顺序(标准刺激在前,标准刺激在后)×2是否有序(有序,无序)
% 无论是有序还是无序，先后呈现的两个视觉刺激，都是起始位置随机选取一个点，并读取要呈现的时长所对应的点位置。
% 也就是说，即使是无序的条件，所有点放在一起组成的弧度也和对应的有序条件相同
% 
mouse_.showcursor(false);
hotkey('x', 'escape_screen(); assignin(''caller'',''continue_'',false);');
bhv_code(101,'white noise',102,'stimulus start',21,'stimulus first on',103,'stimulus first off',...
    104,'stimulus second on',105,'stimulus second off',106,'select first',107,'select second'); 
RightMarker = [203,205];% 选择正确的按键，203表示左键，205表示右键

%% variable
time_jnd = [1.9,2.5];
Time_All = {[time_jnd;time_jnd],[time_jnd;time_jnd],[time_jnd;time_jnd],[time_jnd;time_jnd]};% 设置两个block
% Time_All = {[1,2;1,2;1,2;1,2],[1,2;1,2;1,2;1,2],[1,2;1,2;1,2;1,2],[1,2;1,2;1,2;1,2]};
upordown_all = {[-1,-1],[1,1],[1,1],[-1,-1]};
% upordown_all = {[1,1,1,1],[-1,-1,-1,-1]};
% 开始一半的人采用【降序，升序，升序，降序】，之后进行调整，进行【升序，降序，降序，升序】
order = [1,0];% 2种实验条件中，前一种是有序的，后一种是无序的
% 1：降序有序，2：降序无序，3：升序有序，4：升序无序
C_style = {[1,2],[3,4],[3,4],[1,2]};

Current_Block = TrialRecord.CurrentBlock;%当前运行的是哪个block
if Current_Block == 1 % 练习阶段
    Block_Max = 1;
    rest_ntrial = 10; % 多少个 trial 之后进行休息
    max_ntrial = 10; % 每种实验条件做多少个 trial
    upordown_all = {[-1,-1]};
    C_style = {[1,2]};
else
    Block_Max = 4; % 最多进行几个 block
    rest_ntrial = 30; % 多少个 trial 之后进行休息
    max_ntrial = 40; % 每种实验条件做多少个 trial
end

refresh_rate = 120;
Center = [0 0];%设置刺激呈现的位置
Radius = 3; %degree
Dot_size = 0.3;
Dot_color = [1 1 1];
Time_Max = 3; % 以 3s 视觉刺激为准选取 Time_All 时间长度的视觉刺激
Fre = 20; % 事件发生频率使用20Hz
C_num = round((max(time_jnd)-min(time_jnd))*Fre); % 每种类型的实验刺激设置多少个个实验条件
initJump = ceil(C_num/3); % 初始步幅
ncorinarow = 2; % 连续答对两次就可以进入下一层
nrevstosmall = 3; % 连续反转3次则步幅减小
%% 确定当前为哪个 block
if TrialRecord.CurrentTrialNumber == 1
    Exp.ntrial = max_ntrial; % 每种实验条件做多少个 trial
    Exp.Block = 1;  % 记录当前做到第几个 block
    Exp.TinB = 1; % 当前这个 trial 是这个 block 中的第几个 
    Re_num = 1;% 记录整个实验一共运行了多少个 trial，用来确定什么时候可以呈现休息画面
else
    if length(TrialRecord.LastTrialCodes.CodeNumbers) == 11
        Re_num = Re_num + 1;
    end
end
%% 确定当前这个 block 的所有的实验条件
if Exp.TinB == 1 % 如果是这个 block 的第一个条件，要提前预设好这个 block 的所有条件
    Time_List = Time_All{Exp.Block}; % 当前这个 block 运行的是哪个序列
    initCondition = Time_JND_InitCondition(Time_Max,Time_List,order,upordown_all{Exp.Block},Fre,C_num,Radius,RightMarker);% 得到的实验条件中，分别是 有序S-Q 有序Q-S 无序S-Q 无序Q-S
    upordown = initCondition.upordown;
    Timestair = Time_JND_InitStair(upordown, C_num, Exp.ntrial, initJump); % 初始化实验条件
end
%% 设置当前实验条件
time_shift = (1000/refresh_rate)*2;
C_Class = Timestair.whichstair(Exp.TinB); % 当前运行的哪个类型的实验
C_S = Timestair.trials(Timestair.st_num(C_Class),C_Class);  % 当前运行的是哪个类型的哪个实验条件
condition_idx.Time_first = initCondition.Condition{C_Class}.FirstTime(C_S) - time_shift; %第一个实验刺激的呈现时间
condition_idx.Time_second = initCondition.Condition{C_Class}.SecondTime(C_S) - time_shift; % 第二个实验刺激的呈现时间
condition_idx.interleaf = ceil(refresh_rate/Fre); % 每一帧实验刺激图像的重复次数
condition_idx.Dot_position_first = initCondition.Condition{C_Class}.FirstPo{C_S}; % 第一个实验条件的点位置坐标
condition_idx.Dot_position_second = initCondition.Condition{C_Class}.SecondPo{C_S}; % 第二个实验条件的点位置坐标
condition_idx.Dot_num_first = size(condition_idx.Dot_position_first,3); % 第一个实验条件呈现的画面的数量
condition_idx.Dot_num_second = size(condition_idx.Dot_position_second,3); % 第二个实验条件呈现的画面的数量
condition_idx.Right = initCondition.Right{C_Class}(C_S); % 选择哪个才是对的
JND = abs(condition_idx.Time_first - condition_idx.Time_second)/1000;
condition_idx.C_style = C_style{Exp.Block}(C_Class);
Con_style = condition_idx.C_style;
bhv_variable('Exp',Exp);
%% 时间
% fix_time = round(random('unif',500,800,[1,1]));%注视点进入阈限窗后呈现注视点，注视点呈现时间在0.3~0.5s内随机
fix_time_hold = 1000;
white_time = 300;
white_black = 200;
white2_list = SelectPicture(17,17,2);
white5_list = SelectPicture(17,17,2);

%% trial
% 用于呈现第指导语
txt = ImageGraphic(null_);
txt.List = {'txt.bmp',[0 0],0.5};
kc = KeyChecker(mouse_);
kc.KeyNum = 1;
and = AndAdapter(txt);
and.add(kc);
scene = create_scene(and);

% 用于呈现休息画面
txt0 = ImageGraphic(null_);
txt0.List = {'txt_rest.bmp',[0 0],0.5};
kc0 = KeyChecker(mouse_);
kc0.KeyNum = 1;
and0 = AndAdapter(txt0);
and0.add(kc0);
scene0 = create_scene(and0);

% 用于呈现第指导语
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
dot3 = CircleTime(null_); %当fix3成功时，dot才会运行，当fix3停止时dot会停止
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
dot6 = CircleTime(null_); %当fix4成功时，dot才会运行，当fix4停止时dot会停止
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
if TrialRecord.CurrentTrialNumber == 1 % 如果是所有实验中的第一个 trial，呈现指导语
    run_scene(scene);
end
before_s = trialtime;
run_scene(scene_w2,101); % 噪音
run_scene(scene2,102);%中间注视十字出现，并打上marker102
run_scene(scene3,21);  %呈现第一个刺激，并打上marker
run_scene(scene4,103);% 中间空屏开始，第一个视觉刺激结束
run_scene(scene_w5,101); % 噪音
run_scene(scene5,102);% 中间注视十字出现，并打上marker102
run_scene(scene6,104);% 呈现第二个刺激，并打上marker
after_s = trialtime;
run_scene(scene7,105);% 开始迫选，第二个视觉刺激结束
idle(0);
if kc7_1.Success
    eventmarker(106);
    select_time = kc7_1.Time; % 做选择的时刻
    rt = kc7_1.Time - tc7.start_time; % 反应时
    scancode = 203;% 选择左键
elseif kc7_2.Success
    eventmarker(107);
    select_time = kc7_2.Time;
    rt = kc7_2.Time - tc7.start_time;
    scancode = 205;% 选择右键
else
    error_type = 1;
    select_time = 0;
    rt = 0;
    scancode = 0;
end
%% 判断选择是否正确
TorF = 0;
if scancode % 如果做了选择
    Exp.TinB = Exp.TinB + 1; % 这个 block 中做过的 trial 数增加
    if condition_idx.Right == scancode,TorF = 1;end
    Timestair = Time_JND_StairUpdate(Timestair, TorF, ncorinarow, nrevstosmall);
end
if Timestair.ExpRun ~= 1 % 如果当前这个 block 结束，则 block 计数增加，并且 TinB 重新归 1
    Exp.Block = Exp.Block + 1;
    disp(['已经开始做第 ',num2str(Exp.Block),' 个 block'])
    disp(['之前已经进行了 ',num2str(Exp.TinB),' 个 trial'])
    Exp.TinB = 1;
end
if Exp.Block > Block_Max
    run_scene(scene_E);% 如果大于最大 block 数，则呈现结束的图像
    escape_screen(); % 退出实验
else
    if mod(Re_num,rest_ntrial) == 0,run_scene(scene0);end % 呈现休息的画面
end 

bhv_variable('condition_idx',condition_idx,'initCondition',initCondition,'Timestair',Timestair);
bhv_variable('select_time',select_time,'answer',scancode,'Con_style',Con_style,'JND',JND,'TorF',TorF)
bhv_variable('before_s',before_s,'after_s',after_s)
%将变量记录在Trial.UserVars中
trialerror(error_type);

dashboard(1,'');
dashboard(2,'');
dashboard(3,'');
idle(0);  % clear screen

set_iti(200);%trial的间隔时间

