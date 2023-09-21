
global right_num
mouse_.showcursor(false);
hotkey('x', 'escape_screen(); assignin(''caller'',''continue_'',false);');
current_condition = TrialRecord.CurrentCondition;
marker_shift = 20;
stimulus_on_marker = current_condition+marker_shift;
bhv_code(101,'fixation start',103,'stimulus off',104,'select first',105,'select second'); 
for ii = 1:14
    bhv_code(ii+marker_shift,'stimulus on');
end
if TrialRecord.CurrentTrialNumber == 1
    right_num = 1;
else
    if length(TrialRecord.LastTrialCodes.CodeNumbers) == 6
            right_num = right_num + 1;
    end
end

%% variable
% current_condition = 4;
refresh_rate = 120;
time = 3;%3s
frame = time*refresh_rate;
Center = [0 0];%���ô̼����ֵ�λ��
Radius = 3; %degree
Dot_size = 0.3;
Dot_color = [1 1 1];
angle = [0,2*pi];
condition = [frame/8,frame/6,frame/5,frame/4,frame/3,frame/2,frame];
condition = [condition,condition];
clockwise = [ones(1,length(condition)/2),ones(1,length(condition)/2)*(-1)];
Dot_num = condition(current_condition);
Dot_position = CircleTimePosition(Dot_num,Radius,angle,clockwise(current_condition));%ÿ�����λ��
interleaf = frame/Dot_num;%ÿ����λ���ظ��Ĵ���
Time = time*1000-(1000/refresh_rate)*1;
block_count = MLConfig.TotalNumberOfBlocksToRun;%һ��ѭ�����ٸ�block
block_num = MLConfig.NumberOfTrialsToRunInThisBlock;% ��ͬʵ��ÿ��block��Ҫ�����ٸ�trial
trial_block = block_num(MLConfig.BlocksToRun);% ��ǰʵ����Ҫÿ��block������trial
bhv_variable('Dot_num',Dot_num,'clockwise',clockwise,'time',time);
%��������¼��Trial.UserVars��
%% ʱ��
fix_time = round(random('unif',500,800,[1,1]));%ע�ӵ�������޴������ע�ӵ㣬ע�ӵ����ʱ����0.3~0.5s�����


%% trial
% ���ڳ��ֵ�ָ����
txt = ImageGraphic(null_);
txt.List = {'txt2.bmp',[0 0],0.5};
kc = KeyChecker(mouse_);
kc.KeyNum = 1;
and = AndAdapter(txt);
and.add(kc);
scene = create_scene(and);

% ���ڳ�����Ϣ����
txt = ImageGraphic(null_);
txt.List = {'txt_rest.bmp',[0 0],0.5};
kc = KeyChecker(mouse_);
kc.KeyNum = 1;
and = AndAdapter(txt);
and.add(kc);
scene0 = create_scene(and);

% scene 1: wait first
box1 = BoxGraphic(null_);
box1.List = {[1 0 0],[1 0 0],[0.5,0.05],[0,0],1,0;...
[1 0 0],[1 0 0],[0.05,0.5],[0,0],1,0};
tc1 = TimeCounter(box1);
tc1.Duration = fix_time;
scene1 = create_scene(tc1);


% scene2:stimulus on
box3 = CircleGraphic(null_);
box3.List = {[1 1 1],[1 1 1],Dot_size,[0,0],1,0};
dot3 = CircleTime(null_); %��fix3�ɹ�ʱ��dot�Ż����У���fix3ֹͣʱdot��ֹͣ
dot3.Center = Center;
dot3.Dot_position = Dot_position;
dot3.NumDot = 1;
dot3.Frame = Dot_num;
dot3.DotSize = Dot_size;
dot3.DotColor = Dot_color;
dot3.Interleaf = interleaf;
dot3.first_Interleaf = 1;
con3 = Concurrent(box3);
con3.add(dot3);
tc3 = TimeCounter(con3);
tc3.Duration = Time;
scene2 = create_scene(tc3);

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
dashboard(1,sprintf('Dot_num = %d',Dot_num));
dashboard(2,sprintf('clockwise = %d',clockwise(current_condition)));


error_type = 0;
if TrialRecord.CurrentTrialNumber == 1
    run_scene(scene);
end
before_s = trialtime;
run_scene(scene1,101);%����ע�ӵ㣬������marker101
run_scene(scene2,stimulus_on_marker);%�۶��źŽ���ע�ӵ����ޣ�������marker102
after_s = trialtime;
run_scene(scene7,103);
idle(0);
if kc7_1.Success
    eventmarker(104);
    select_time = kc7_1.Time;
    rt = kc7_1.Time - tc7.start_time;
    scancode = 203;
elseif kc7_2.Success
    eventmarker(105);
    select_time = kc7_2.Time;
    rt = kc7_2.Time - tc7.start_time;
    scancode = 205;
else
    error_type = 1;
    select_time = 0;
    rt = 0;
    scancode = 0;
end


if mod(right_num,trial_block) == 0 && fix(right_num/trial_block) ~= block_count
    run_scene(scene0);% ������Ϣ�Ļ���
end

bhv_variable('select_time',select_time,'answer',scancode)%203�������205���Ҽ�
bhv_variable('before_s',before_s,'after_s',after_s)

% rt = wth1.AcquiredTime;
trialerror(error_type);

dashboard(1,'');
dashboard(2,'');
dashboard(3,'');
idle(0);  % clear screen

set_iti(2000);%trial�ļ��ʱ��

