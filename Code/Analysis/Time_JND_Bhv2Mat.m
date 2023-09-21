%% 将 monkeylogic 保存的 bhv2 格式的数据转换为 .mat 文件

%% clear all
%删除命令行窗口和工作区数据
clc;clear;current_path = cd;
%% read data
is_figure = 0; % 画被试实验条件的呈现图,1表示画图，0为不画
figure_sigle = 1; % 画每一次梯度变化的图
figure_save = 0; % 保存图像
%打开选择窗，选择要分析的data文件，读取该文件,并在命令行显示读取的文件名称
[f, p] = uigetfile('.bhv2','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p, f);
cd(p);
if ischar(f),data_file = cellstr(data_file);f = cellstr(f);end % 如果是一个文件，将其地址和文件名改为cell
behave_data_folder = [p,'behave\'];
%%判断文件夹是否存在,第二个输入(可选)必须为 'var'、'builtin'、'class'、'dir' 或 'file'
if ~exist(behave_data_folder,'dir'),mkdir(behave_data_folder);end
waitbar_h=waitbar(0,'waittttttttttttt....');
for i = 1:size(data_file,2) % 对每个数据进行文件转换
    waitbar(i/size(data_file,2));
    disp(['当前打开的文件为：',f{i}]);
    behave.filename = f{i};% 保存文件名
    behave.data.RAW = mlread(data_file{i});%形成一个结构体，是以每种属性组合成了子结构体
    trial_error = cat(1,behave.data.RAW.TrialError);%读出原始数据中未成功的trial
    error = logical(trial_error);
    behave.data.Data = behave.data.RAW;%用于保存成功的trial
    behave.data.Data(error) = [];%将未成功的数据删除
    data_num = size(behave.data.Data,2); % 这个文件中实验总次数
    for data_i = 1:data_num
        behave.JND(data_i).Block = behave.data.Data(data_i).UserVars.Exp.Block; % 是哪个 block
        behave.JND(data_i).TinB = behave.data.Data(data_i).UserVars.Exp.TinB; % 是当前这个 block 中的第几个 trial
        behave.JND(data_i).Con_style = behave.data.Data(data_i).UserVars.Con_style; % 哪种类型的实验条件
        behave.JND(data_i).JND = behave.data.Data(data_i).UserVars.JND; % 时间差异
        behave.JND(data_i).TorF = behave.data.Data(data_i).UserVars.TorF; % 是否正确
        behave.JND(data_i).R_Time = behave.data.Data(data_i).ReactionTime; % 反应时
        behave.JND(data_i).Condition = behave.data.Data(data_i).UserVars.condition_idx; % 实验条件
    end
    % 按照类型进行排序
    Con_style = [cat(1,behave.JND.Con_style),(1:data_num)'];
    S = sortrows(Con_style,1);
    C_Sequence = S(:,2);
    behave.JND = behave.JND(C_Sequence);
    % 画图
    if is_figure
        Fig = figure;hold on;
        set(gcf,'Position',[200,50,1200,700]);
        color_list = {[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560]};
        C_Class = max(S(:,1)); % 一共有几种类型的实验
        for C_i = 1:C_Class % 对每一种实验刺激进行画图
%             Fig = figure;
            C_Trial = find(S(:,1) == C_i);% 当前这个类型刺激所在的行数
            JND_Trial = cat(1,behave.JND(C_Trial(1):C_Trial(end)).JND); % 当前这种类型刺激的条件变化
            plot(JND_Trial,'Color',color_list{C_i},'LineWidth',2)
        end
        set(gca,'FontSize',15)
        xlabel('Trial Number','Fontname', 'Times New Roman','FontSize',20);
        ylabel('the Different of Time','Fontname', 'Times New Roman','FontSize',20);
        title('与 2.5s 比较的最小可觉差','FontSize',20)
        legend({'降序有序','降序无序','升序有序','升序无序'},'FontSize',15);
        if figure_save
            t1 = strfind(f{i},'JND');
            t2 = strfind(f{i},'.bhv2');
            Subject = f{i}(t1+4:t2-1);% 被试的名字
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

%% 将读取到的数据保存到与bhv.2相同的文件夹
disp(['文件保存路径为：',p])
cd(current_path)
% %% 显示行为表现的图
% behaviorsummary(data_file)



%% 刚开始忘记标记 block ，将原始数据中加入 block 的编号
% alldata = size(behave.data.Data,2);
% trial = 1;
% for data_i = 120:alldata
%     behave.data.Data(data_i).UserVars.Exp.Block = 4;
%     behave.data.Data(data_i).UserVars.Exp.TinB = trial;
%     trial = trial + 1;
% end

%% 读取 .mat 数据，画图
if figure_sigle == 1
    color_list = {[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560]};
    Condition = [cat(1,behave.JND(:).Con_style),cat(1,behave.JND(:).Block),cat(1,behave.JND(:).TinB),cat(1,behave.JND(:).JND)]; 
    Style_max = max(Condition(:,1)); % 一共有几种类型的刺激
    for Style_i = 1:Style_max
        Block_num = unique(Condition(Condition(:,1)==Style_i,2),'rows'); % 在哪几个 block 中有当前这种实验条件
        for Block_i = 1:length(Block_num)
            % JND_num 就是 Style_i 这种实验条件中，在 Block_i 中运行过的所有的 JND 条件
            JND_num = Condition(all([Condition(:,1)==Style_i,Condition(:,2)==Block_num(Block_i)],2),4);
            Fig = figure;set(gcf,'Position',[200,50,1200,700]);
            plot(JND_num,'Color',color_list{Style_i},'LineWidth',2)
            ylim([0,0.6]);set(gca,'ytick',(0:0.05:0.6))% 设置y轴显示的标尺
            set(gca,'FontSize',15)
            xlabel('Trial Number','Fontname', 'Times New Roman','FontSize',20);
            ylabel('the Different of Time','Fontname', 'Times New Roman','FontSize',20);
            t_x1 = {'降序有序','降序无序','升序有序','升序无序'};
            t_x = [t_x1{Style_i},'第',num2str(Block_i),'次'];
            title(t_x,'FontSize',20)
        end
    end
end








