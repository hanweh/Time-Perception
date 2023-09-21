%% ��ת��Ϊ .mat �Ĳ�����޵����ݽ�һ������
%% clear all
%ɾ�������д��ں͹���������
clc;clear;current_path = cd;
%% read data
is_figure = 1; % ������ʵ�������ĳ���ͼ,1��ʾ��ͼ��0Ϊ����
figure_save = 0; % ����ͼ��
%��ѡ�񴰣�ѡ��Ҫ������data�ļ�����ȡ���ļ�,������������ʾ��ȡ���ļ�����
[f, p] = uigetfile('.mat','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p, f);
cd(p);
if ischar(f),data_file = cellstr(data_file);f = cellstr(f);end % �����һ���ļ��������ַ���ļ�����Ϊcell
waitbar_h=waitbar(0,'waittttttttttttt....');
JND = zeros(size(data_file,2),4);% ÿһ����һ�����ԣ�ÿһ����һ��ʵ������
JND_Block = cell(1,4);
for i = 1:size(data_file,2) % ��ÿ�����ݽ����ļ�ת��
    waitbar(i/size(data_file,2));
    disp(['��ǰ�򿪵��ļ�Ϊ��',f{i}]);
    data = load(f{i});
    % Condition = [�������͵�ʵ���������ڼ��� block���ڼ��� trial��ʱ�����];
    Condition = [cat(1,data.behave.JND(:).Con_style),cat(1,data.behave.JND(:).Block),cat(1,data.behave.JND(:).TinB),cat(1,data.behave.JND(:).JND)];  
    Style_max = max(Condition(:,1)); % һ���м������͵Ĵ̼�
    for Style_i = 1:Style_max
        Block_num = unique(Condition(Condition(:,1)==Style_i,2),'rows'); % ���ļ��� block ���е�ǰ����ʵ������
        for Block_i = 1:length(Block_num)
            % JND_num ���� Style_i ����ʵ�������У��� Block_i �����й������е� JND ����
            JND_num = Condition(all([Condition(:,1)==Style_i,Condition(:,2)==Block_num(Block_i)],2),4);
            JND_Block{Style_i}(i,Block_i) = mean(JND_num(end-1:end)); % ���һ�� JND ������Ϊ���Ǳ��Եĸо�����
        end
        JND(i,Style_i) = mean(JND_Block{Style_i}(i,:));% ����ǰ������Ե���������� JND ����
    end
end
close(waitbar_h);
%% ������/���������޵�ͼ
if size(data_file,2) > 1 % ���ݶ���1��
    JND_2(:,1) = (JND(:,1)+JND(:,3))./2; % ����Ĳ������
    JND_2(:,2) = (JND(:,2)+JND(:,4))./2; % ����Ĳ������
    JND_Mean = mean(JND_2,1); % ���ÿһ�еľ�ֵ
    JND_SE = std(JND_2,1)/sqrt(size(JND_2,1)); % ���ÿһ�еı�׼��
    bar_color = [.45,.45,.45];dot_color = [0,0,0];
    y_max1 = ceil(max(max(JND_2))*10)/10; % ȷ����ͼʱy�����ֵ
    y_max2 = ceil(max(max(JND))*10)/10;% ȷ����ͼʱy�����ֵ
    y_max = max(y_max1,y_max2);

    [th,tp,ci,stats] = ttest(JND_2(:,1),JND_2(:,2));
    disp(['���������������� t ���� p = ',num2str(tp)])
    % �� bar ͼ
    x_ = [0.5,1.3];
    figure,hold on;
    set(gcf,'Position',[200,50,1200,700]);
    bar(x_,JND_Mean,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
    xticks(x_);xticklabels({'����2.5s�Ĳ������','����2.5s�Ĳ������'});
    x_lim = [0,1.8];y_lim = [0,y_max];
    xlim(x_lim);ylim(y_lim);xlabel('�Ƿ�����','fontsize',20);
    y_label_i = ylabel('JND','Rotation',0,'fontsize',20);y_label_i.Position = [-0.2,y_max/2];
    set(gca,'ytick',(0:0.05:y_max))% ����y����ʾ�ı��
    errorbar(x_,JND_Mean,JND_SE,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
    title_ = '2.5s ����/���� �Ӿ��̼��Ĳ������';
    set(gca,'FontSize',15);
    title(title_,'FontSize',22);
    % ��ɢ��
    hold on
    scatter_x = repmat(x_,size(data_file,2),1);% �ж������ݾ͸���Ϊ������
    scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
    scatter_x = scatter_x + (rand(1,length(scatter_x))-0.5) .* 0.1;
    scatter_y = JND_2;
    scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
    scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
    % ��������
    y_1 = max(max(JND_2(:,1),JND_2(:,2)));
    y_ = [y_1,y_1]+(y_max-0)/20;
    % ���Ǻż��Ǻ��µ���
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
    % ������������pֵ
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

%% ����/���������޷�Ϊ����/���򣬹��������ͣ�������ͼ
% if size(data_file,2) > 1 % ���ݶ���1��
%     JND_Mean2 = mean(JND,1);
%     JND_SE2 = std(JND,1);
%     x_2 = [0.5,1.3,2.1,2.9];
%     figure,hold on;
%     set(gcf,'Position',[200,50,1200,700]);
%     bar(x_2,JND_Mean2,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
%     xticks(x_2);xticklabels({'����JND-����','����JND-����','����JND-����','����JND-����'});
%     x_lim = [0,3.4];y_lim = [0,y_max];
%     xlim(x_lim);ylim(y_lim);xlabel('�Ƿ�����','fontsize',20);
%     y_label_i = ylabel('JND','Rotation',0,'fontsize',20);y_label_i.Position = [-0.3,y_max/2];
%     set(gca,'ytick',(0:0.05:y_max))% ����y����ʾ�ı��
%     errorbar(x_2,JND_Mean2,JND_SE2,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
%     title_ = '2.5s ����/���� �Ӿ��̼��Ĳ������';
%     set(gca,'FontSize',15);
%     title(title_,'FontSize',22);
%     % ��ɢ��
%     hold on
%     scatter_x = repmat(x_2,size(data_file,2),1);% �ж������ݾ͸���Ϊ������
%     scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
%     scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
%     scatter_y = JND;
%     scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
%     scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
%     [p_7,tb_7] = anova1(JND,[],'off');
%     disp(['����/���������ޣ�F���� p=',num2str(p_7)]);
%     
% end
disp(['һ���� ',num2str(size(data_file,2)),' �����ԲμӲ������ʵ��'])



