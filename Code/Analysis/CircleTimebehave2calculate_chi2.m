%% 
clear all;
clc;
%% 
prompt={'�Ƿ񻭸������Ե�ͼ:[0��������1����]'};
name='��������';
numlines=1;
defaultanswer={'0'};
answer=inputdlg(prompt,name,numlines,defaultanswer);
isfigure = str2double(answer{1});

[f, p1] = uigetfile('.mat','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p1, f);
cd(p1);
%%
waitbar_h=waitbar(0,'waittttttttttttt....');
if ischar(f)
    disp('f  ischar')
    disp(['��ǰ�򿪵��ļ�Ϊ��',f]);
    data = open(data_file);
    t_num = strfind(data_file,'_behave');
    accelerate_style = str2double(data_file(t_num-1)); %��ȡ '_behave' ǰ������֣������ж��������˶������ȱ����˶�
    condition_right = cat(1,data.behave.condition.right);condition_left = cat(1,data.behave.condition.left);
    if accelerate_style == 1
        less_more = [1,2,3,4,5,6,8,9,11,12,15,18];more_less = [7,10,13,14,16,17,19,20,21,22,23,24];
        test_short_long = [27,28,31,32];test_long_short = [25,26,29,30];
    %     clockwise = [1,2,3,7,8,9,13,14,15,19,20,21];counterclockwise = [4,5,6,10,11,12,16,17,18,22,23,24];
        right_num = sum(condition_right(less_more) + condition_left(more_less));
        all_num = sum(condition_right([less_more,more_less])+condition_left([less_more,more_less]));
        right_rate = right_num/all_num; %�Ե��ĸо�ʱ�䳤Ϊ��ȷ��������ȷ��
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %��ʵ��ʱ�����������жϵ���ȷ��
        % �����ȷ��
        disp_str1 = sprintf('The right_rate is %.2f\n',right_rate*100);
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        fprintf(disp_str1);fprintf(disp_str2)
        % ��ͼ
        if isfigure ~= 0
            uniform_speed = figure;
            set(gcf,'Position',[200,50,1200,700]);
            subplot(6,2,(1:2:9))
            b1 = bar([1,2],[right_rate,1-right_rate]);
            xticks([1,2]);xticklabels({'���ʱ�䳤','����ʱ�䳤'});ylim([0,1]);
            title('��ͬʱ��ǰ��㲻ͬ','FontSize',20);set(gca,'FontSize',15);
            subplot(6,2,(2:2:10))
            bar([1,2],[test_right_rate,1-test_right_rate]);
            xticks([1,2]);xticklabels({'��ȷѡ��','����ѡ��'});ylim([0,1]);
            title('ʱ����ͬ','FontSize',20);set(gca,'FontSize',15);
        end
        condition_1 = more_less;condition_2 = less_more;
    elseif accelerate_style == 2
        accelerate_decelerate = [1,3,8,9];decelerate_accelerate = [4,5,10,12];
        test_long_short = [13,14];test_short_long = [15,16];
        clockwise_counterclockwise = [2,6];counterclockwise_clockwise = [7,11];
        right_num = sum(condition_right(accelerate_decelerate) + condition_left(decelerate_accelerate));
        all_num = sum(condition_right([accelerate_decelerate,decelerate_accelerate])+condition_left([accelerate_decelerate,decelerate_accelerate]));
        right_rate = right_num/all_num;
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %��ʵ��ʱ�����������жϵ���ȷ��
        % ��ת��ѡ���Ӱ��
        rotation_num = sum(condition_right(clockwise_counterclockwise) + condition_left(counterclockwise_clockwise));
        rotation_all_num = sum(condition_right([clockwise_counterclockwise,counterclockwise_clockwise])+condition_left([clockwise_counterclockwise,counterclockwise_clockwise]));
        rotation_right_rate = rotation_num/rotation_all_num;
        % �����ȷ��
        disp_str1 = sprintf('The right_rate is %.2f\n',right_rate*100);
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        disp_str3 = sprintf('The rotation_right_rate is %.2f\n',rotation_right_rate*100);
        fprintf(disp_str1);fprintf(disp_str2);fprintf(disp_str3);
        % ��ͼ
        if isfigure ~= 0
            change_speed = figure;
            set(gcf,'Position',[200,50,1200,700]);
            subplot(6,2,(1:2:9))
            bar([1,2],[right_rate,1-right_rate]);
            xticks([1,2]);xticklabels({'����ʱ�䳤','����ʱ�䳤'});ylim([0,1]);
            title('��ͬʱ��ǰ���ٶȱ仯��ͬ','FontSize',20);set(gca,'FontSize',15);
            subplot(6,2,(2:2:10))
            bar([1,2],[test_right_rate,1-test_right_rate]);
            xticks([1,2]);xticklabels({'��ȷѡ��','����ѡ��'});ylim([0,1]);
            title('ʱ����ͬ','FontSize',20);set(gca,'FontSize',15);
        end
        condition_1 = decelerate_accelerate;condition_2 = accelerate_decelerate;
    end
    % ��������
    trial_condition = cat(1,data.behave.trial(:,1));
    condition_num = sort([condition_1,condition_2]);%ȷ������Щ������ʵ������
    row_num = ismember(trial_condition,condition_num);%ʵ����������Щ��
    trial_cell(:,1) = data.behave.trial(row_num,1);%ʵ����������
    trial_cell(:,2) = data.behave.trial(row_num,2);%ѡ�񰴼����룬203�������205���Ҽ�
    for i = 1:length(condition_num)
        % �γ�ʵ�������ľ������Խ���ж�Ϊʱ�䳤���ȼ����ж�Ϊʱ�䳤���ж���ȷΪ1������ȷΪ0
        find_condition = find(trial_cell(:,1)==condition_num(i));
        if find(condition_num(i)==condition_1)
            trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 1;
            trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 0;
        elseif find(condition_num(i) == condition_2)
            trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 0;
            trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 1;
        end
    end
    % ���п�������
    [h1,p1,stats1]=chi2gof(trial_cell(:,3),'expected',[size(trial_cell,1)/2,size(trial_cell,1)/2]);
    if h1==1,issufficient1 = '��������';elseif h1==0,issufficient1 = '���첻����'; end
    % ��ͼ
    if isfigure ~= 0
        subplot(6,2,[11,12])
        axis off
        text(0.1,0,['����ֵΪ��',num2str(stats1.chi2stat),'��',issufficient1,'��pֵΪ��',num2str(p1)],'FontSize',20)
        set(gca,'color','none')
    end
    disp_str1 = sprintf('����ֵΪ�� %.2f\n',stats1.chi2stat);
    disp_str2 = [issufficient1,'\n'];
    disp_str3 = sprintf('pֵΪ�� %.2f\n',p1);
    fprintf(disp_str1);fprintf(disp_str2);fprintf(disp_str3);disp(stats1);
else
    disp('f ~ischar')
    uniform_trial = cell(1,1);j = 1;
    change_trial = cell(1,1);q = 1;
    for i = 1:size(data_file,2)
        %ѡ�����ļ�ʱ
        waitbar(i/size(data_file,2));
        disp(['��ǰ�򿪵��ļ�Ϊ��',f(i)]);
        data_name = char(data_file(i));
        data = open(data_name);
        t_num = double(strfind(data_name,'_behave'));
        accelerate_style = str2double(data_name(t_num-1)); %��ȡ '_behave' ǰ������֣������ж��������˶������ȱ����˶�
        condition_right = cat(1,data.behave.condition.right);condition_left = cat(1,data.behave.condition.left);
        if accelerate_style == 1
            figure_tile = '�����˶���ʵ��������ѡ����ĸ��';
            less_more = [1,2,3,4,5,6,8,9,11,12,15,18];more_less = [7,10,13,14,16,17,19,20,21,22,23,24];
            test_short_long = [27,28,31,32];test_long_short = [25,26,29,30];
        %     clockwise = [1,2,3,7,8,9,13,14,15,19,20,21];counterclockwise = [4,5,6,10,11,12,16,17,18,22,23,24];
            right_num = sum(condition_right(less_more) + condition_left(more_less));
            all_num = sum(condition_right([less_more,more_less])+condition_left([less_more,more_less]));
            right_rate = right_num/all_num; %�Ե��ĸо�ʱ�䳤Ϊ��ȷ��������ȷ��
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %��ʵ��ʱ�����������жϵ���ȷ��
            % �����ȷ��
            disp_str1 = sprintf('The right_rate is %.2f\n',right_rate*100);
            disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
            fprintf(disp_str1);fprintf(disp_str2)
            % ��ͼ
            if isfigure ~= 0
                uniform_speed = figure;
                set(gcf,'Position',[200,50,1200,700]);
                subplot(6,2,(1:2:9))
                bar([1,2],[right_rate,1-right_rate]);
                xticks([1,2]);xticklabels({'���ʱ�䳤','����ʱ�䳤'});ylim([0,1]);
                title('��ͬʱ��ǰ��㲻ͬ','FontSize',20);set(gca,'FontSize',15);
                subplot(6,2,(2:2:10))
                bar([1,2],[test_right_rate,1-test_right_rate]);
                xticks([1,2]);xticklabels({'��ȷѡ��','����ѡ��'});ylim([0,1]);
                title('ʱ����ͬ','FontSize',20);set(gca,'FontSize',15);
            end
            condition_1 = more_less;condition_2 = less_more;
        elseif accelerate_style == 2
            figure_tile = '�ȱ����˶���ʵ��������ѡ����ĸ��';
            accelerate_decelerate = [1,3,8,9];decelerate_accelerate = [4,5,10,12];
            test_long_short = [13,14];test_short_long = [15,16];
            clockwise_counterclockwise = [2,6];counterclockwise_clockwise = [7,11];
            right_num = sum(condition_right(accelerate_decelerate) + condition_left(decelerate_accelerate));
            all_num = sum(condition_right([accelerate_decelerate,decelerate_accelerate])+condition_left([accelerate_decelerate,decelerate_accelerate]));
            right_rate = right_num/all_num;
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %��ʵ��ʱ�����������жϵ���ȷ��
            % ��ת��ѡ���Ӱ��
            rotation_num = sum(condition_right(clockwise_counterclockwise) + condition_left(counterclockwise_clockwise));
            rotation_all_num = sum(condition_right([clockwise_counterclockwise,counterclockwise_clockwise])+condition_left([clockwise_counterclockwise,counterclockwise_clockwise]));
            rotation_right_rate = rotation_num/rotation_all_num;
            % �����ȷ��
            disp_str1 = sprintf('The right_rate is %.2f\n',right_rate*100);
            disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
            disp_str3 = sprintf('The rotation_right_rate is %.2f\n',rotation_right_rate*100);
            fprintf(disp_str1);fprintf(disp_str2);fprintf(disp_str3);
            % ��ͼ
            if isfigure ~= 0
                change_speed = figure;
                set(gcf,'Position',[200,50,1200,700]);
                subplot(6,2,(1:2:9))
                bar([1,2],[right_rate,1-right_rate]);
                xticks([1,2]);xticklabels({'����ʱ�䳤','����ʱ�䳤'});ylim([0,1]);
                title('��ͬʱ��ǰ���ٶȱ仯��ͬ','FontSize',20);set(gca,'FontSize',15);
                subplot(6,2,(2:2:10))
                bar([1,2],[test_right_rate,1-test_right_rate]);
                xticks([1,2]);xticklabels({'��ȷѡ��','����ѡ��'});ylim([0,1]);
                title('ʱ����ͬ','FontSize',20);set(gca,'FontSize',15);
            end
            condition_1 = decelerate_accelerate;condition_2 = accelerate_decelerate;
        end
        % ��������
        trial_condition = cat(1,data.behave.trial(:,1));
        trial_choose = cat(1,data.behave.trial(:,2));
        condition_num = sort([condition_1,condition_2]);%ȷ������Щ������ʵ������
        row_num = ismember(trial_condition,condition_num);%ʵ����������Щ��
        trial_cell = zeros(sum(row_num),3);
        trial_cell(:,1) = trial_condition(row_num);%ʵ����������
        trial_cell(:,2) = trial_choose(row_num);%ѡ�񰴼����룬203�������205���Ҽ�
        for ii = 1:length(condition_num)
            % �γ�ʵ�������ľ������Խ���ж�Ϊʱ�䳤���ȼ����ж�Ϊʱ�䳤���ж���ȷΪ1������ȷΪ0
            find_condition = find(trial_cell(:,1)==condition_num(ii));
            if find(condition_num(ii)==condition_1)
                trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 1;
                trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 0;
            elseif find(condition_num(ii) == condition_2)
                trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 0;
                trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 1;
            end
        end
        % ���п�������
        [h2,p2,stats2]=chi2gof(trial_cell(:,3),'expected',[size(trial_cell,1)/2,size(trial_cell,1)/2]);
        if h2==1,issufficient2 = '��������';elseif h2==0,issufficient2 = '���첻����'; end
        % ��ͼ
        if isfigure ~= 0
            subplot(6,2,[11,12])
            axis off
            text(0.1,0,['����ֵΪ��',num2str(stats2.chi2stat),'��',issufficient2,'��pֵΪ��',num2str(p2)],'FontSize',20)
            set(gca,'color','none')
        end
        disp_str1 = sprintf('����ֵΪ�� %.2f\n',stats2.chi2stat);
        disp_str2 = [issufficient2,'\n'];
        disp_str3 = sprintf('pֵΪ�� %.2f',p2);
        fprintf(disp_str1);fprintf(disp_str2);fprintf(disp_str3);disp(stats2);
        % ��������
        if accelerate_style == 1
            uniform_trial{j} = trial_cell;j = j + 1;
        elseif accelerate_style == 2
            change_trial{q} = trial_cell;q = q + 1;
        end
    end
    %% ���������Ե����ݣ��������˶����ȱ����˶���������п�������
    if exist('uniform_trial','var')
        uniform_trial_cell = uniform_trial{1};
        for jj = 1:size(uniform_trial,2)-1
            uniform_trial_cell = cat(1,uniform_trial_cell,uniform_trial{jj+1});
        end
        uniform_right_rate = sum(uniform_trial_cell(:,3)/size(uniform_trial_cell,1));
        [h3,p3,stats3]=chi2gof(uniform_trial_cell(:,3),'expected',[size(uniform_trial_cell,1)/2,size(uniform_trial_cell,1)/2]);
        all_condition = figure;
        set(gcf,'Position',[200,50,1200,700]);
        subplot(7,2,(1:2:9))
        bar([1,2],[uniform_right_rate,1-uniform_right_rate]);
        xticks([1,2]);xticklabels({'���ʱ�䳤','����ʱ�䳤'});ylim([0,1]);
        title('��ͬʱ��ǰ���������ͬ����ȷ��','FontSize',20);set(gca,'FontSize',15);
    end
    if exist('change_trial','var')
        change_trial_cell = change_trial{1};
        for jj = 1:size(change_trial,2)-1
            change_trial_cell = cat(1,change_trial_cell,change_trial{jj+1});
        end
        change_right_rate = sum(change_trial_cell(:,3)/size(change_trial_cell,1));
        [h4,p4,stats4]=chi2gof(change_trial_cell(:,3),'expected',[size(change_trial_cell,1)/2,size(change_trial_cell,1)/2]);
%         change_chi_figure = figure;
        set(gcf,'Position',[200,50,1200,700]);
        subplot(7,2,(2:2:10))
        bar([1,2],[change_right_rate,1-change_right_rate]);
        xticks([1,2]);xticklabels({'����ʱ�䳤','����ʱ�䳤'});ylim([0,1]);
        title('��ͬʱ��ǰ���ٶȱ仯��ͬ����ȷ��','FontSize',20);set(gca,'FontSize',15);
    end
    subplot(7,2,[11,12])
    axis off
    if h3==1,issufficient3 = '��������';elseif h3==0,issufficient3 = '���첻����'; end
    text(0.1,0,['ʵ��һ������ֵΪ��',num2str(stats3.chi2stat),'��',issufficient3,'��pֵΪ��',num2str(p3)],'FontSize',20)
    set(gca,'color','none')
    subplot(7,2,[13,14])
    axis off
    if h4==1,issufficient4 = '��������';elseif h4==0,issufficient4 = '���첻����'; end
    text(0.1,0,['ʵ���������ֵΪ��',num2str(stats4.chi2stat),'��',issufficient4,'��pֵΪ��',num2str(p4)],'FontSize',20)
    set(gca,'color','none')
    
end
close(waitbar_h);














