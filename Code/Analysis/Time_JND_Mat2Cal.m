%% 将转换为 .mat 的差别阈限的数据进一步分析
%% clear all
%删除命令行窗口和工作区数据
clc;clear;current_path = cd;
%% read data
is_figure = 1; % 画被试实验条件的呈现图,1表示画图，0为不画
figure_save = 0; % 保存图像
%打开选择窗，选择要分析的data文件，读取该文件,并在命令行显示读取的文件名称
[f, p] = uigetfile('.mat','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p, f);
cd(p);
if ischar(f),data_file = cellstr(data_file);f = cellstr(f);end % 如果是一个文件，将其地址和文件名改为cell
waitbar_h=waitbar(0,'waittttttttttttt....');
JND = zeros(size(data_file,2),4);% 每一行是一个被试，每一列是一种实验条件
JND_Block = cell(1,4);
for i = 1:size(data_file,2) % 对每个数据进行文件转换
    waitbar(i/size(data_file,2));
    disp(['当前打开的文件为：',f{i}]);
    data = load(f{i});
    % Condition = [哪种类型的实验条件，第几个 block，第几个 trial，时间差异];
    Condition = [cat(1,data.behave.JND(:).Con_style),cat(1,data.behave.JND(:).Block),cat(1,data.behave.JND(:).TinB),cat(1,data.behave.JND(:).JND)];  
    Style_max = max(Condition(:,1)); % 一共有几种类型的刺激
    for Style_i = 1:Style_max
        Block_num = unique(Condition(Condition(:,1)==Style_i,2),'rows'); % 在哪几个 block 中有当前这种实验条件
        for Block_i = 1:length(Block_num)
            % JND_num 就是 Style_i 这种实验条件中，在 Block_i 中运行过的所有的 JND 条件
            JND_num = Condition(all([Condition(:,1)==Style_i,Condition(:,2)==Block_num(Block_i)],2),4);
            JND_Block{Style_i}(i,Block_i) = mean(JND_num(end-1:end)); % 最后一个 JND 条件认为就是被试的感觉阈限
        end
        JND(i,Style_i) = mean(JND_Block{Style_i}(i,:));% 将当前这个被试的这个条件的 JND 存入
    end
end
close(waitbar_h);
%% 画有序/无序差别阈限的图
if size(data_file,2) > 1 % 数据多于1个
    JND_2(:,1) = (JND(:,1)+JND(:,3))./2; % 有序的差别阈限
    JND_2(:,2) = (JND(:,2)+JND(:,4))./2; % 无序的差别阈限
    JND_Mean = mean(JND_2,1); % 求出每一列的均值
    JND_SE = std(JND_2,1)/sqrt(size(JND_2,1)); % 求出每一列的标准误
    bar_color = [.45,.45,.45];dot_color = [0,0,0];
    y_max1 = ceil(max(max(JND_2))*10)/10; % 确定画图时y轴最大值
    y_max2 = ceil(max(max(JND))*10)/10;% 确定画图时y轴最大值
    y_max = max(y_max1,y_max2);

    [th,tp,ci,stats] = ttest(JND_2(:,1),JND_2(:,2));
    disp(['有序与无序差别阈限 t 检验 p = ',num2str(tp)])
    % 画 bar 图
    x_ = [0.5,1.3];
    figure,hold on;
    set(gcf,'Position',[200,50,1200,700]);
    bar(x_,JND_Mean,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
    xticks(x_);xticklabels({'有序2.5s的差别阈限','无序2.5s的差别阈限'});
    x_lim = [0,1.8];y_lim = [0,y_max];
    xlim(x_lim);ylim(y_lim);xlabel('是否有序','fontsize',20);
    y_label_i = ylabel('JND','Rotation',0,'fontsize',20);y_label_i.Position = [-0.2,y_max/2];
    set(gca,'ytick',(0:0.05:y_max))% 设置y轴显示的标尺
    errorbar(x_,JND_Mean,JND_SE,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
    title_ = '2.5s 有序/无序 视觉刺激的差别阈限';
    set(gca,'FontSize',15);
    title(title_,'FontSize',22);
    % 画散点
    hold on
    scatter_x = repmat(x_,size(data_file,2),1);% 有多少数据就复制为多少行
    scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
    scatter_x = scatter_x + (rand(1,length(scatter_x))-0.5) .* 0.1;
    scatter_y = JND_2;
    scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
    scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
    % 画显著性
    y_1 = max(max(JND_2(:,1),JND_2(:,2)));
    y_ = [y_1,y_1]+(y_max-0)/20;
    % 画星号及星号下的线
    if th == 1
        if tp < 0.001
            line(x_,y_,'Color',[0.7,0.7,0.7],'LineWidth',2);
            bar_str = '* * *';
        elseif tp < 0.01
            line(x_,y_,'Color',[0.7,0.7,0.7],'LineWidth',2);
            bar_str = '* *';
        elseif tp < 0.05
            line(x_,y_,'Color',[0.7,0.7,0.7],'LineWidth',2);
            bar_str = '*';
        end
        s_x = sum(x_)/2;s_y = y_1 + 0.06;
        text(s_x,s_y,bar_str,'FontSize',25,'HorizontalAlignment','center');
    end
    % 标明被试量和p值
    sub_str = {['n = ',num2str(size(data_file,2))],['p = ',num2str(tp)]};
    x_step = (x_lim(2)-x_lim(1))/100;
    fill_x_left = x_lim(1)+x_step;fill_x_right = x_lim(1)+x_step*18;
    fill_y_high = y_lim(2)-(y_max-0)/20;
    fill_y_low = y_lim(2)-(y_max-0)/20-(y_max-0)/20.*2;
    text_yy = fill_y_high-(y_max-0)/20;
    text_x = fill_x_left+0.02;
    fill([fill_x_left,fill_x_right,fill_x_right,fill_x_left],[fill_y_high,fill_y_high,fill_y_low,fill_y_low],[1,1,1] )
    text(text_x,text_yy,sub_str,'FontSize',15);
end

%% 有序/无序差别阈限分为升序/降序，共四种类型，继续画图
% if size(data_file,2) > 1 % 数据多于1个
%     JND_Mean2 = mean(JND,1);
%     JND_SE2 = std(JND,1);
%     x_2 = [0.5,1.3,2.1,2.9];
%     figure,hold on;
%     set(gcf,'Position',[200,50,1200,700]);
%     bar(x_2,JND_Mean2,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
%     xticks(x_2);xticklabels({'有序JND-降序','无序JND-降序','有序JND-升序','无序JND-升序'});
%     x_lim = [0,3.4];y_lim = [0,y_max];
%     xlim(x_lim);ylim(y_lim);xlabel('是否有序','fontsize',20);
%     y_label_i = ylabel('JND','Rotation',0,'fontsize',20);y_label_i.Position = [-0.3,y_max/2];
%     set(gca,'ytick',(0:0.05:y_max))% 设置y轴显示的标尺
%     errorbar(x_2,JND_Mean2,JND_SE2,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
%     title_ = '2.5s 有序/无序 视觉刺激的差别阈限';
%     set(gca,'FontSize',15);
%     title(title_,'FontSize',22);
%     % 画散点
%     hold on
%     scatter_x = repmat(x_2,size(data_file,2),1);% 有多少数据就复制为多少行
%     scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
%     scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
%     scatter_y = JND;
%     scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
%     scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
%     [p_7,tb_7] = anova1(JND,[],'off');
%     disp(['无序/有序差别阈限，F检验 p=',num2str(p_7)]);
%     
% end
disp(['一共有 ',num2str(size(data_file,2)),' 名被试参加差别阈限实验'])



