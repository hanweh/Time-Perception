%% �� monkeylogic ����� bhv2 ��ʽ������ת��Ϊ .mat �ļ�

%% clear all
%ɾ�������д��ں͹���������
clc;clear;current_path = cd;
%% read data
is_figure = 0; % ������ʵ�������ĳ���ͼ,1��ʾ��ͼ��0Ϊ����
figure_sigle = 1; % ��ÿһ���ݶȱ仯��ͼ
figure_save = 0; % ����ͼ��
%��ѡ�񴰣�ѡ��Ҫ������data�ļ�����ȡ���ļ�,������������ʾ��ȡ���ļ�����
[f, p] = uigetfile('.bhv2','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p, f);
cd(p);
if ischar(f),data_file = cellstr(data_file);f = cellstr(f);end % �����һ���ļ��������ַ���ļ�����Ϊcell
behave_data_folder = [p,'behave\'];
%%�ж��ļ����Ƿ����,�ڶ�������(��ѡ)����Ϊ 'var'��'builtin'��'class'��'dir' �� 'file'
if ~exist(behave_data_folder,'dir'),mkdir(behave_data_folder);end
waitbar_h=waitbar(0,'waittttttttttttt....');
for i = 1:size(data_file,2) % ��ÿ�����ݽ����ļ�ת��
    waitbar(i/size(data_file,2));
    disp(['��ǰ�򿪵��ļ�Ϊ��',f{i}]);
    behave.filename = f{i};% �����ļ���
    behave.data.RAW = mlread(data_file{i});%�γ�һ���ṹ�壬����ÿ��������ϳ����ӽṹ��
    trial_error = cat(1,behave.data.RAW.TrialError);%����ԭʼ������δ�ɹ���trial
    error = logical(trial_error);
    behave.data.Data = behave.data.RAW;%���ڱ���ɹ���trial
    behave.data.Data(error) = [];%��δ�ɹ�������ɾ��
    data_num = size(behave.data.Data,2); % ����ļ���ʵ���ܴ���
    for data_i = 1:data_num
        behave.JND(data_i).Block = behave.data.Data(data_i).UserVars.Exp.Block; % ���ĸ� block
        behave.JND(data_i).TinB = behave.data.Data(data_i).UserVars.Exp.TinB; % �ǵ�ǰ��� block �еĵڼ��� trial
        behave.JND(data_i).Con_style = behave.data.Data(data_i).UserVars.Con_style; % �������͵�ʵ������
        behave.JND(data_i).JND = behave.data.Data(data_i).UserVars.JND; % ʱ�����
        behave.JND(data_i).TorF = behave.data.Data(data_i).UserVars.TorF; % �Ƿ���ȷ
        behave.JND(data_i).R_Time = behave.data.Data(data_i).ReactionTime; % ��Ӧʱ
        behave.JND(data_i).Condition = behave.data.Data(data_i).UserVars.condition_idx; % ʵ������
    end
    % �������ͽ�������
    Con_style = [cat(1,behave.JND.Con_style),(1:data_num)'];
    S = sortrows(Con_style,1);
    C_Sequence = S(:,2);
    behave.JND = behave.JND(C_Sequence);
    % ��ͼ
    if is_figure
        Fig = figure;hold on;
        set(gcf,'Position',[200,50,1200,700]);
        color_list = {[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560]};
        C_Class = max(S(:,1)); % һ���м������͵�ʵ��
        for C_i = 1:C_Class % ��ÿһ��ʵ��̼����л�ͼ
%             Fig = figure;
            C_Trial = find(S(:,1) == C_i);% ��ǰ������ʹ̼����ڵ�����
            JND_Trial = cat(1,behave.JND(C_Trial(1):C_Trial(end)).JND); % ��ǰ�������ʹ̼��������仯
            plot(JND_Trial,'Color',color_list{C_i},'LineWidth',2)
        end
        set(gca,'FontSize',15)
        xlabel('Trial Number','Fontname', 'Times New Roman','FontSize',20);
        ylabel('the Different of Time','Fontname', 'Times New Roman','FontSize',20);
        title('�� 2.5s �Ƚϵ���С�ɾ���','FontSize',20)
        legend({'��������','��������','��������','��������'},'FontSize',15);
        if figure_save
            t1 = strfind(f{i},'JND');
            t2 = strfind(f{i},'.bhv2');
            Subject = f{i}(t1+4:t2-1);% ���Ե�����
            fig_name = [behave_data_folder,Subject,'_JND.eps'];
            saveas(Fig,fig_name);
        end
    end
    
    current_data_name2 = [behave_data_folder,f{i}];
    save_name2 = [current_data_name2(1:end-5),'_behave.mat'];
    save_variables2 = 'behave';
    save(save_name2,save_variables2)
    disp('behave.bhv2 to mat')
    if size(data_file,2) > 1
        clearvars -except data_file f behave_data_folder waitbar_h p current_path is_figure figure_save figure_sigle
    end
%         clear behave
end
close(waitbar_h);

%% ����ȡ�������ݱ��浽��bhv.2��ͬ���ļ���
disp(['�ļ�����·��Ϊ��',p])
cd(current_path)
% %% ��ʾ��Ϊ���ֵ�ͼ
% behaviorsummary(data_file)



%% �տ�ʼ���Ǳ�� block ����ԭʼ�����м��� block �ı��
% alldata = size(behave.data.Data,2);
% trial = 1;
% for data_i = 120:alldata
%     behave.data.Data(data_i).UserVars.Exp.Block = 4;
%     behave.data.Data(data_i).UserVars.Exp.TinB = trial;
%     trial = trial + 1;
% end

%% ��ȡ .mat ���ݣ���ͼ
if figure_sigle == 1
    color_list = {[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560]};
    Condition = [cat(1,behave.JND(:).Con_style),cat(1,behave.JND(:).Block),cat(1,behave.JND(:).TinB),cat(1,behave.JND(:).JND)]; 
    Style_max = max(Condition(:,1)); % һ���м������͵Ĵ̼�
    for Style_i = 1:Style_max
        Block_num = unique(Condition(Condition(:,1)==Style_i,2),'rows'); % ���ļ��� block ���е�ǰ����ʵ������
        for Block_i = 1:length(Block_num)
            % JND_num ���� Style_i ����ʵ�������У��� Block_i �����й������е� JND ����
            JND_num = Condition(all([Condition(:,1)==Style_i,Condition(:,2)==Block_num(Block_i)],2),4);
            Fig = figure;set(gcf,'Position',[200,50,1200,700]);
            plot(JND_num,'Color',color_list{Style_i},'LineWidth',2)
            ylim([0,0.6]);set(gca,'ytick',(0:0.05:0.6))% ����y����ʾ�ı��
            set(gca,'FontSize',15)
            xlabel('Trial Number','Fontname', 'Times New Roman','FontSize',20);
            ylabel('the Different of Time','Fontname', 'Times New Roman','FontSize',20);
            t_x1 = {'��������','��������','��������','��������'};
            t_x = [t_x1{Style_i},'��',num2str(Block_i),'��'];
            title(t_x,'FontSize',20)
        end
    end
end








