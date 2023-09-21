
%% clear all
%删除命令行窗口和工作区数据
clc;
clear all;

%% 获得当前路径
current_path = cd;

%% read data
%打开选择窗，选择要分析的data文件，读取该文件,并在命令行显示读取的文件名称
[f, p] = uigetfile('.bhv2','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p, f);
cd(p);
behave_data_folder = [p,'behave\'];
% behave_RAW_data_folder = [p,'\behave_RAW\'];
if ~exist(behave_data_folder,'dir') %%判断文件夹是否存在,第二个输入(可选)必须为 'var'、'builtin'、'class'、'dir' 或 'file'
    mkdir(behave_data_folder);
end
% if ~exist(behave_RAW_data_folder,'dir') %%判断文件夹是否存在,第二个输入(可选)必须为 'var'、'builtin'、'class'、'dir' 或 'file'
%     mkdir(behave_RAW_data_folder);
% end

waitbar_h=waitbar(0,'waittttttttttttt....');
if ischar(f)
    disp('f  ischar')
    m=1;n=1;
    disp(['当前打开的文件为：',f]);
    % behave.data = mlread(data_file);%形成一个结构体，每个trial的所有数据为一行。
    behave_RAW.data = mlread(data_file);%形成一个结构体，是以每种属性组合成了子结构体
    behave_RAW.filename = f;
    behave.filename = f;
    trial_error = cat(1,behave_RAW.data.TrialError);
    error = logical(trial_error);
    behave.data = behave_RAW.data;
    if strcmp (behave.filename(1),'0'),behave.gender = 0;else,behave.gender = 1;end
    behave.data(error) = [];
    behave.trial = cat(1,behave.data.Condition);%实验条件
    for ii = 1:length(behave.trial)
        behave.trial(ii,2) = behave.data(ii).UserVars.answer;
        behave.trial(ii,3) = behave.data(ii).BlockCount; %第三列是block计数
    end
    
    behave.trial = sortrows(behave.trial,1);%按照condition顺序进行排列
    for i = 1:max(behave.trial(:,1))
        condition_list = find(behave.trial(:,1) == i);
        behave.condition(i).condition = i; %哪种实验条件
        behave.condition(i).count = length(condition_list); %这种实验条件一共做了多少个trial
        behave.condition(i).left = length(find(behave.trial(condition_list,2) == 203)); %选择了第一个刺激时间比较长的个数
        behave.condition(i).right = length(find(behave.trial(condition_list,2) == 205)); %选择了第二个刺激时间比较长的个数
        
    end
    
    
    
%     current_data_name1 = [behave_RAW_data_folder,f];
%     save_name1 = [current_data_name1(1:end-5),'_behave_RAW.mat'];
%     save_variables1 = 'behave_RAW';
%     save(save_name1,save_variables1)
%     disp('behave_RAW.bhv2 to mat')
    current_data_name2 = [behave_data_folder,f];
    save_name2 = [current_data_name2(1:end-5),'_behave.mat'];
    save_variables2 = 'behave';
    save(save_name2,save_variables2)
    disp('behave.bhv2 to mat')
    
    
else
    disp('f ~ischar')
    for i = 1:size(data_file,2)
        %选择多个文件时
        waitbar(i/size(data_file,2));
        m=1;n=1;
        disp(['当前打开的文件为：',f(i)]);

        % behave.data = mlread(data_file);%形成一个结构体，每个trial的所有数据为一行。
        behave_RAW.data = mlread(char(data_file(i)));%形成一个结构体，是以每种属性组合成了子结构体
        behave_RAW.filename = char(f(i));
        behave.filename = char(f(i));
        if strcmp (behave.filename(1),'0'),behave.gender = 0;else,behave.gender = 1;end
        trial_error = cat(1,behave_RAW.data.TrialError);
        error = logical(trial_error);
        behave.data = behave_RAW.data;
        behave.data(error) = [];
        behave.trial = cat(1,behave.data.Condition);%实验条件
        for ii = 1:length(behave.trial)
            behave.trial(ii,2) = behave.data(ii).UserVars.answer;
            behave.trial(ii,3) = behave.data(ii).BlockCount;  %第三列是block计数
        end
        behave.trial = sortrows(behave.trial,1);
        for ii = 1:max(behave.trial(:,1))
            condition_list = find(behave.trial(:,1) == ii);
            behave.condition(ii).condition = ii; %哪种实验条件
            behave.condition(ii).count = length(condition_list); %这种实验条件一共做了多少个trial
            behave.condition(ii).left = length(find(behave.trial(condition_list,2) == 203)); %选择了第一个刺激时间比较长的个数
            behave.condition(ii).right = length(find(behave.trial(condition_list,2) == 205)); %选择了第二个刺激时间比较长的个数
        end
        
        
        
%         current_data_name1 = [behave_RAW_data_folder,char(f(i))];
%         save_name1 = [current_data_name1(1:end-5),'_behave_RAW.mat'];
%         save_variables1 = 'behave_RAW';
%         save(save_name1,save_variables1)
%         disp('behave_RAW.bhv2 to mat')
        current_data_name2 = [behave_data_folder,char(f(i))];
        save_name2 = [current_data_name2(1:end-5),'_behave.mat'];
        save_variables2 = 'behave';
        save(save_name2,save_variables2)
        disp('behave.bhv2 to mat')
        clearvars -except data_file f behave_data_folder waitbar_h p current_path
%         clear behave_RAW
%         clear behave
    end
end
close(waitbar_h);







%% 将读取到的数据保存到与bhv.2相同的文件夹

disp(['文件保存路径为：',p])

cd(current_path)
clearvars -except behave behave_RAW
% %% 显示行为表现的图
% behaviorsummary(data_file)


