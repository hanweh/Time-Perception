
%% clear all
%ɾ�������д��ں͹���������
clc;
clear all;

%% ��õ�ǰ·��
current_path = cd;

%% read data
%��ѡ�񴰣�ѡ��Ҫ������data�ļ�����ȡ���ļ�,������������ʾ��ȡ���ļ�����
[f, p] = uigetfile('.bhv2','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p, f);
cd(p);
behave_data_folder = [p,'behave\'];
% behave_RAW_data_folder = [p,'\behave_RAW\'];
if ~exist(behave_data_folder,'dir') %%�ж��ļ����Ƿ����,�ڶ�������(��ѡ)����Ϊ 'var'��'builtin'��'class'��'dir' �� 'file'
    mkdir(behave_data_folder);
end
% if ~exist(behave_RAW_data_folder,'dir') %%�ж��ļ����Ƿ����,�ڶ�������(��ѡ)����Ϊ 'var'��'builtin'��'class'��'dir' �� 'file'
%     mkdir(behave_RAW_data_folder);
% end

waitbar_h=waitbar(0,'waittttttttttttt....');
if ischar(f)
    disp('f  ischar')
    m=1;n=1;
    disp(['��ǰ�򿪵��ļ�Ϊ��',f]);
    % behave.data = mlread(data_file);%�γ�һ���ṹ�壬ÿ��trial����������Ϊһ�С�
    behave_RAW.data = mlread(data_file);%�γ�һ���ṹ�壬����ÿ��������ϳ����ӽṹ��
    behave_RAW.filename = f;
    behave.filename = f;
    trial_error = cat(1,behave_RAW.data.TrialError);
    error = logical(trial_error);
    behave.data = behave_RAW.data;
    if strcmp (behave.filename(1),'0'),behave.gender = 0;else,behave.gender = 1;end
    behave.data(error) = [];
    behave.trial = cat(1,behave.data.Condition);%ʵ������
    for ii = 1:length(behave.trial)
        behave.trial(ii,2) = behave.data(ii).UserVars.answer;
        behave.trial(ii,3) = behave.data(ii).BlockCount; %��������block����
    end
    
    behave.trial = sortrows(behave.trial,1);%����condition˳���������
    for i = 1:max(behave.trial(:,1))
        condition_list = find(behave.trial(:,1) == i);
        behave.condition(i).condition = i; %����ʵ������
        behave.condition(i).count = length(condition_list); %����ʵ������һ�����˶��ٸ�trial
        behave.condition(i).left = length(find(behave.trial(condition_list,2) == 203)); %ѡ���˵�һ���̼�ʱ��Ƚϳ��ĸ���
        behave.condition(i).right = length(find(behave.trial(condition_list,2) == 205)); %ѡ���˵ڶ����̼�ʱ��Ƚϳ��ĸ���
        
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
        %ѡ�����ļ�ʱ
        waitbar(i/size(data_file,2));
        m=1;n=1;
        disp(['��ǰ�򿪵��ļ�Ϊ��',f(i)]);

        % behave.data = mlread(data_file);%�γ�һ���ṹ�壬ÿ��trial����������Ϊһ�С�
        behave_RAW.data = mlread(char(data_file(i)));%�γ�һ���ṹ�壬����ÿ��������ϳ����ӽṹ��
        behave_RAW.filename = char(f(i));
        behave.filename = char(f(i));
        if strcmp (behave.filename(1),'0'),behave.gender = 0;else,behave.gender = 1;end
        trial_error = cat(1,behave_RAW.data.TrialError);
        error = logical(trial_error);
        behave.data = behave_RAW.data;
        behave.data(error) = [];
        behave.trial = cat(1,behave.data.Condition);%ʵ������
        for ii = 1:length(behave.trial)
            behave.trial(ii,2) = behave.data(ii).UserVars.answer;
            behave.trial(ii,3) = behave.data(ii).BlockCount;  %��������block����
        end
        behave.trial = sortrows(behave.trial,1);
        for ii = 1:max(behave.trial(:,1))
            condition_list = find(behave.trial(:,1) == ii);
            behave.condition(ii).condition = ii; %����ʵ������
            behave.condition(ii).count = length(condition_list); %����ʵ������һ�����˶��ٸ�trial
            behave.condition(ii).left = length(find(behave.trial(condition_list,2) == 203)); %ѡ���˵�һ���̼�ʱ��Ƚϳ��ĸ���
            behave.condition(ii).right = length(find(behave.trial(condition_list,2) == 205)); %ѡ���˵ڶ����̼�ʱ��Ƚϳ��ĸ���
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







%% ����ȡ�������ݱ��浽��bhv.2��ͬ���ļ���

disp(['�ļ�����·��Ϊ��',p])

cd(current_path)
clearvars -except behave behave_RAW
% %% ��ʾ��Ϊ���ֵ�ͼ
% behaviorsummary(data_file)


