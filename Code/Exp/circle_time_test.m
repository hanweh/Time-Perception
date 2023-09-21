global right_num
% ʵ��һ���¼�����Ƶ�ʲ���
% ʵ�������ɫ���ظ�������λ�ò���
% ʵ�������ȱ����˶�
% ʵ�����Ǳ���ٶ��˶�
% ʵ��������ϰ�׶�
% ʵ�����������¼�����Ƶ�ʲ���
% ʵ����������/���������������������ȣ�����������
% ʵ����Ǽ���/����/�����˶�֮��ıȽϣ�������45���㣬��15Hz���Ӿ��̼�����������/���ٲ��Ǿ��ȱ仯�ģ��������С����Ҳ����30Hzʱ�ľ���
mouse_.showcursor(false);
hotkey('x', 'escape_screen(); assignin(''caller'',''continue_'',false);');
current_block = TrialRecord.CurrentBlock;
current_condition = TrialRecord.CurrentCondition;
marker_shift = 20;
stimulus_first_on_marker = current_condition+marker_shift;
bhv_code(101,'white noise',102,'stimulus start',103,'stimulus first off',104,'stimulus second on',105,'stimulus second off',106,'select first',107,'select second'); 
for ii = 1:32
    bhv_code(ii+marker_shift,'stimulus first on');
end

%% variable
refresh_rate = 120;
Center = [0 0];%���ô̼����ֵ�λ��
Radius = 3; %degree
Dot_size = 0.3;
Dot_color = [1 1 1];
angle = [0,2*pi];
block_count = MLConfig.TotalNumberOfBlocksToRun;%һ��ѭ�����ٸ�block
block_num = MLConfig.NumberOfTrialsToRunInThisBlock;% ��ͬʵ��ÿ��block��Ҫ�����ٸ�trial
trial_block = block_num(MLConfig.BlocksToRun);% ��ǰʵ����Ҫÿ��block������trial
% ȷ���ڴ�֮ǰһ������˼���trial���Ӷ�ȷ����ʲôʱ����ֵȴ�
if TrialRecord.CurrentTrialNumber == 1
    right_num = 1;
else
    if length(TrialRecord.LastTrialCodes.CodeNumbers) == 11
            right_num = right_num + 1;
    end
end
condition_idx = CicleTimeCondition(current_block,current_condition,refresh_rate,Radius,angle);%��ò����Ӿ��̼��ĸ��ֲ���

bhv_variable('condition_idx',condition_idx);
%��������¼��Trial.UserVars��
%% ʱ��
% fix_time = round(random('unif',500,800,[1,1]));%ע�ӵ�������޴������ע�ӵ㣬ע�ӵ����ʱ����0.3~0.5s�����
% fix_time_hold = 1000;
fix_time_hold = [1000 5000 1000 3000];
editable('-range','fix_time_hold');
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
txt = ImageGraphic(null_);
txt.List = {'txt_rest.bmp',[0 0],0.5};
kc = KeyChecker(mouse_);
kc.KeyNum = 1;
and = AndAdapter(txt);
and.add(kc);
scene0 = create_scene(and);

% scene 2:wait first
box2 = BoxGraphic(null_);
box2.List = {[1 0 0],[1 0 0],[0.5,0.05],[0,0],1,0;...
[1 0 0],[1 0 0],[0.05,0.5],[0,0],1,0};
tc2 = TimeCounter(box2);
tc2.Duration = white_black;
scene2 = create_scene(tc2);
% scene : white noise
white2 = ImageChanger(null_);
white2.ImageList = white2_list;
con2 = Concurrent(white2);
con2.add(box2);
% tc_white2 = TimeCounter(white2);
% tc_white2.Duration = white_time;
scene_w2 = create_scene(con2);



% scene3:stimulus first on
box3 = CircleGraphic(null_);
box3.List = {Dot_color,Dot_color,Dot_size,Center,1,0};
dot3 = CircleTime(null_); %��fix3�ɹ�ʱ��dot�Ż����У���fix3ֹͣʱdot��ֹͣ
dot3.Center = Center;
dot3.Dot_position = condition_idx.Dot_position_first;
dot3.NumDot = 1;
dot3.Frame = condition_idx.Dot_num_first;
dot3.DotSize = Dot_size;
dot3.DotColor = Dot_color;
dot3.Interleaf = condition_idx.interleaf_first;
dot3.first_Interleaf = 1;
dot3.color_change = condition_idx.color_change_first;
dot3.position_change = condition_idx.position_change_first;
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
dot6.Dot_position = condition_idx.Dot_position_second;
dot6.NumDot = 1;
dot6.Frame = condition_idx.Dot_num_second;% һ�����ڶ���֡����
dot6.DotSize = Dot_size;
dot6.DotColor = Dot_color;
dot6.Interleaf = condition_idx.interleaf_second;% ÿһ֡�����ظ����ֶ��ٴ�
dot6.first_Interleaf = 1;
dot6.color_change = condition_idx.color_change_second;
dot6.position_change = condition_idx.position_change_second;
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
if current_block == 1 || current_block == 6
    dashboard(1,sprintf('First: Frame = %d, Dot_num = %d, clockwise = %d',...
        condition_idx.Frame_first,condition_idx.Dot_num_first,condition_idx.clockwise_first));
    dashboard(2,sprintf('Second: Frame = %d, Dot_num = %d, clockwise = %d',...
        condition_idx.Frame_second,condition_idx.Dot_num_second,condition_idx.clockwise_second));
elseif current_block == 2
    dashboard(1,sprintf('First: Frame = %d, Dot_num = %d, clockwise = %d, position = %d, color = %d',...
        condition_idx.Frame_first,condition_idx.Dot_num_first,condition_idx.clockwise_first,...
        condition_idx.position_change_first,condition_idx.color_change_first));
    dashboard(2,sprintf('Second: Frame = %d, Dot_num = %d, clockwise = %d, position = %d, color = %d',...
        condition_idx.Frame_second,condition_idx.Dot_num_second,condition_idx.clockwise_second,...
        condition_idx.position_change_second,condition_idx.color_change_second));
else
    dashboard(1,sprintf('First: Frame = %d, Dot_num = %d, clockwise = %d, accelerate_style = %d',...
        condition_idx.Frame_first,condition_idx.Dot_num_first,condition_idx.clockwise_first,condition_idx.accelerate_style_first));
    dashboard(2,sprintf('Second: Frame = %d, Dot_num = %d, clockwise = %d, accelerate_style = %d',...
        condition_idx.Frame_second,condition_idx.Dot_num_second,condition_idx.clockwise_second,condition_idx.accelerate_style_second));
end



error_type = 0;
if TrialRecord.CurrentTrialNumber == 1
    run_scene(scene);
end
before_s = trialtime;
run_scene(scene_w2,101);
run_scene(scene2,102);%�м�ע��ʮ�ֳ��֣�������marker102
run_scene(scene3,stimulus_first_on_marker);  %���ֵ�һ���̼���������marker
run_scene(scene4,103);% �м������ʼ����һ���Ӿ��̼�����
run_scene(scene_w5,101);
run_scene(scene5,102);% �м�ע�ӵ���֣�������marker102
run_scene(scene6,104);% ���ֵڶ����̼���������marker
after_s = trialtime;
run_scene(scene7,105);% ��ʼ��ѡ���ڶ����Ӿ��̼�����
idle(0);
if kc7_1.Success
    eventmarker(106);
    select_time = kc7_1.Time;
    rt = kc7_1.Time - tc7.start_time;
    scancode = 203;
elseif kc7_2.Success
    eventmarker(107);
    select_time = kc7_2.Time;
    rt = kc7_2.Time - tc7.start_time;
    scancode = 205;
else
    error_type = 1;
    select_time = 0;
    rt = 0;
    scancode = 0;
end

if mod(right_num,trial_block) == 0 && fix(right_num/trial_block) ~= block_count && MLConfig.BlocksToRun ~= 5
    run_scene(scene0);% ������Ϣ�Ļ���
end

bhv_variable('select_time',select_time,'answer',scancode)%203�������205���Ҽ�
bhv_variable('before_s',before_s,'after_s',after_s)

trialerror(error_type);

dashboard(1,'');
dashboard(2,'');
dashboard(3,'');
idle(0);  % clear screen

set_iti(200);%trial�ļ��ʱ��

