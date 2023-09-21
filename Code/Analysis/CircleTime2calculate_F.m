% 根据转换完的数据计算不同条件之间的关系
%% 待解决问题：
% ①每个被试分析是否有顺序效应、旋转效应

%% 
% block: 1->匀速运动    2->匀速运动中间闪烁与否    3->匀变速运动    4->先加速后减速或者先减速后加速
% condition： 
    % block == 1 时：匀速运动
    % 1:45个位置；2：90个位置；3：180个位置；4：360个位置
    % [帧数 点数 正旋1 加速1；帧数 点数 逆旋-1 减速2]
        % real condition
        % 1 ->[360, 45, 1,0; 360, 90, 1,0]; 2 ->[360, 45, 1,0; 360,180, 1,0]; 3 ->[360, 45, 1,0; 360,360, 1,0];
        % 4 ->[360, 45,-1,0; 360, 90,-1,0]; 5 ->[360, 45,-1,0; 360,180,-1,0]; 6 ->[360, 45,-1,0; 360,360,-1,0];
        % 7 ->[360, 90, 1,0; 360, 45, 1,0]; 8 ->[360, 90, 1,0; 360,180, 1,0]; 9 ->[360, 90, 1,0; 360,360, 1,0];
        % 10->[360, 90,-1,0; 360, 45,-1,0]; 11->[360, 90,-1,0; 360,180,-1,0]; 12->[360, 90,-1,0; 360,360,-1,0];
        % 13->[360,180, 1,0; 360, 45, 1,0]; 14->[360,180, 1,0; 360, 90, 1,0]; 15->[360,180, 1,0; 360,360, 1,0];
        % 16->[360,180,-1,0; 360, 45,-1,0]; 17->[360,180,-1,0; 360, 90,-1,0]; 18->[360,180,-1,0; 360,360,-1,0];
        % 19->[360,360, 1,0; 360, 45, 1,0]; 20->[360,360, 1,0; 360, 90, 1,0]; 21->[360,360, 1,0; 360,180, 1,0];
        % 22->[360,360,-1,0; 360, 45,-1,0]; 23->[360,360,-1,0; 360, 90,-1,0]; 24->[360,360,-1,0; 360,180,-1,0];
        % test condition
        % 25->[360,180, 1,0; 300,300, 1,0]; 26->[360,360, 1,0; 300,150, 1,0]; 27->[300,150, 1,0; 360,360, 1,0]; 28->[300,300, 1,0; 360,180, 1,0];
        % 29->[360,180,-1,0; 300,300,-1,0]; 30->[360,360,-1,0; 300,150,-1,0]; 31->[300,150,-1,0; 360,360,-1,0]; 32->[300,300,-1,0; 360,180,-1,0];
        
    % block == 2 时：匀速运动中间闪烁与否
    % 1:20个位置呈现1次；2：20个位置呈现3次；3：20个位置呈现3次不同颜色；4：60个位置
    %[帧数，点数，正旋1，匀速0，中间不显示1，中间变颜色1]
        % real condition
        % 1 ->[360,60 , 1,0,1,0; 360,60 , 1,0,0,0]; 2 ->[360,60 , 1,0,1,0; 360,60 , 1,0,0,1]; 3 ->[360,60 , 1,0,1,0; 360,180, 1,0,0,0]; 
        % 4 ->[360,60 , 1,0,0,0; 360,60 , 1,0,0,1]; 5 ->[360,60 , 1,0,0,0; 360,180, 1,0,0,0]; 6 ->[360,60 , 1,0,0,1; 360,180, 1,0,0,0]; 
        % 7 ->[360,60 ,-1,0,1,0; 360,60 ,-1,0,0,0]; 8 ->[360,60 ,-1,0,1,0; 360,60 ,-1,0,0,1]; 9 ->[360,60 ,-1,0,1,0; 360,180,-1,0,0,0]; 
        %10 ->[360,60 ,-1,0,0,0; 360,60 ,-1,0,0,1];11 ->[360,60 ,-1,0,0,0; 360,180,-1,0,0,0];12 ->[360,60 ,-1,0,0,1; 360,180,-1,0,0,0]; 
        %13 ->[360,60 , 1,0,0,0; 360,60 , 1,0,1,0];14 ->[360,60 , 1,0,0,1; 360,60 , 1,0,1,0];15 ->[360,180, 1,0,0,0; 360,60 , 1,0,1,0]; 
        %16 ->[360,60 , 1,0,0,1; 360,60 , 1,0,0,0];17 ->[360,180, 1,0,0,0; 360,60 , 1,0,0,0];18 ->[360,180, 1,0,0,0; 360,60 , 1,0,0,1]; 
        %19 ->[360,60 ,-1,0,0,0; 360,60 ,-1,0,1,0];20 ->[360,60 ,-1,0,0,1; 360,60 ,-1,0,1,0];21 ->[360,180,-1,0,0,0; 360,60 ,-1,0,1,0]; 
        %22 ->[360,60 ,-1,0,0,1; 360,60 ,-1,0,0,0];23 ->[360,180,-1,0,0,0; 360,60 ,-1,0,0,0];24 ->[360,180,-1,0,0,0; 360,60 ,-1,0,0,1]; 
        % test condition
        % 25->[360,60 , 1,0,0,0;300,50 , 1,0,0,1];26->[360,60 , 1,0,0,1;300,50 , 1,0,0,0];
        % 27->[300,50 , 1,0,0,0;360,60 , 1,0,0,1];28->[300,50 , 1,0,0,1;360,60 , 1,0,0,0];
        % 29->[360,60 ,-1,0,0,0;300,50 ,-1,0,0,1];30->[360,60 ,-1,0,0,1;300,50 ,-1,0,0,0];
        % 31->[300,50 ,-1,0,0,0;360,60 ,-1,0,0,1];32->[300,50 ,-1,0,0,1;360,60 ,-1,0,0,0];
        
    % block == 3 时：匀变速运动
    % 1：匀加速；2：匀减速；3：匀速
        % real condition
        % 1 ->[360, 90, 1, 1; 360, 90, 1, 2]; 2 ->[360, 90, 1, 1; 360, 90, 1, 0]; 3 ->[360, 90, 1, 2; 360, 90, 1, 0];
        % 4 ->[360, 90,-1, 1; 360, 90,-1, 2]; 5 ->[360, 90,-1, 1; 360, 90,-1, 0]; 6 ->[360, 90,-1, 2; 360, 90,-1, 0];
        % 7 ->[360, 90, 1, 2; 360, 90, 1, 1]; 8 ->[360, 90, 1, 0; 360, 90, 1, 1]; 9 ->[360, 90, 1, 0; 360, 90, 1, 2];
        % 10->[360, 90,-1, 2; 360, 90,-1, 1]; 11->[360, 90,-1, 0; 360, 90,-1, 1]; 12->[360, 90,-1, 0; 360, 90,-1, 2];
        % test condition
        % 13->[360, 90, 1, 1; 300, 75, 1, 2]; 14->[360, 90, 1, 2; 300, 75, 1, 1];
        % 15->[300, 75, 1, 1; 360, 90, 1, 2]; 16->[300, 75, 1, 2; 360, 90, 1, 1];
        
    % block == 4 时：先加速后减速或者先减速后加速
    % 1：先加速后减速；2：先减速后加速；3：匀速
        % real condition
        % 1 ->[360, 90, 1, 3; 360, 90, 1, 4]; 2 ->[360, 90, 1, 3; 360, 90, 1, 0]; 3 ->[360, 90, 1, 4; 360, 90, 1, 0];
        % 4 ->[360, 90,-1, 3; 360, 90,-1, 4]; 5 ->[360, 90,-1, 3; 360, 90,-1, 0]; 6 ->[360, 90,-1, 4; 360, 90,-1, 0];
        % 7 ->[360, 90, 1, 4; 360, 90, 1, 3]; 8 ->[360, 90, 1, 0; 360, 90, 1, 3]; 9 ->[360, 90, 1, 0; 360, 90, 1, 4];
        % 10->[360, 90,-1, 4; 360, 90,-1, 3]; 11->[360, 90,-1, 0; 360, 90,-1, 3]; 12->[360, 90,-1, 0; 360, 90,-1, 4];
        % test condition
        % 13->[360, 90, 1, 3; 300, 75, 1, 4]; 14->[360, 90, 1, 4; 300, 75, 1, 3];
        % 15->[300, 75, 1, 3; 360, 90, 1, 4]; 16->[300, 75, 1, 4; 360, 90, 1, 3];
        
    % block == 6 时：匀速运动
    % [帧数 点数 正旋1 ；帧数 点数 逆旋-1 ]
        % 1 ->[360,120, 1,0; 360,180, 1,0]; 2 ->[360,120, 1,0; 360,360, 1,0]; 3 ->[360,180, 1,0; 360,360, 1,0];
        % 4 ->[360,120,-1,0; 360,180,-1,0]; 5 ->[360,120,-1,0; 360,360,-1,0]; 6 ->[360,180,-1,0; 360,360,-1,0];
        % 7 ->[360,180, 1,0; 360,120, 1,0]; 8 ->[360,360, 1,0; 360,120, 1,0]; 9 ->[360,360, 1,0; 360,180, 1,0];
        %10 ->[360,180,-1,0; 360,120,-1,0];11 ->[360,360,-1,0; 360,120,-1,0];12 ->[360,360,-1,0; 360,180,-1,0];
        %13 ->[360,180, 1,0; 300,300, 1,0];14 ->[360,360,-1,0; 300,150,-1,0];
        %15 ->[300,150, 1,0; 360,180, 1,0];16 ->[300,300,-1,0; 360,180,-1,0];
        
    % block == 7 时：有序/无序
        % 1 -> 30Hz无序-40Hz无序; 2 -> 30Hz无序-60Hz无序; 3 -> 40Hz无序-60Hz无序;
        % 4 -> 40Hz无序-30Hz无序; 5 -> 60Hz无序-30Hz无序; 6 -> 60Hz无序-40Hz无序;
        % 7 -> 30Hz有序-30Hz无序; 8 -> 40Hz有序-40Hz无序; 9 -> 60Hz有序-60Hz无序;
        % 10-> 30Hz无序-30Hz有序; 11-> 40Hz无序-40Hz有序; 12-> 60Hz无序-60Hz有序;
        % 测试
        % 13-> 30Hz无序-60Hz无序(3-2s); 14-> 40Hz有序-40Hz无序(3-2s); 15-> 60Hz无序-30Hz无序(2-3s); 16-> 40Hz无序-40Hz有序(2-3s);
        
    % block == 8 时：变速运动，都包括45个点，即15Hz的视觉刺激。不过加速/减速不是均匀变化的，两点间最小距离也等于30Hz时的距离
        % 1 -> 加速-减速; 2 -> 加速-匀速; 3 -> 减速-匀速;----顺时针
        % 4 -> 加速-减速; 5 -> 加速-匀速; 6 -> 减速-匀速;----逆时针
        % 7 -> 减速-加速; 8 -> 匀速-加速; 9 -> 匀速-减速;----顺时针
        % 10-> 减速-加速; 11-> 匀速-加速; 12-> 匀速-减速;----逆时针
        % 测试
        % 13-> 加速长-匀速短; 14-> 减速长-匀速短; 15-> 匀速短-减速长; 16-> 匀速短-加速长;----顺时针
        
        
%% 
clear all;
clc;
%% 
% prompt={'是否画各个被试的图:[0：不画，1：画]','是否保存图片:[0：不保存，1：保存]','最大FOC:[实验1/2=12，实验3/4=8]'};
prompt={'是否画各个被试的图:[0：不画，1：画]','是否画每个被试简单效应的图:[0：不画，1：画]','是否保存图片:[0：不保存，1：保存]',...
    '是否是区分阈限：[0：不区分；1：阈限高于30Hz；2：阈限低于30Hz；3：已经保存了阈限高于和低于30Hz的数据，对这两部分进行比较]',...
    '是否保存R要读取的数据：[1：保存；0：不保存]'};
name='参数输入';
numlines=1;
% defaultanswer={'0','0','12'};
defaultanswer={'0','0','0','0','0'};
answer=inputdlg(prompt,name,numlines,defaultanswer);
isfigure = str2double(answer{1});
figure_SEG = str2double(answer{2});
save_picture = str2double(answer{3});
LowOrHigh = str2double(answer{4});
mat2R = str2double(answer{5});
% FOC = str2double(answer{3});
if isfigure == 1 && figure_SEG == 1,figure_seg = 1;else,figure_seg = 0;end
[f, p1] = uigetfile('.mat','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p1, f);
cd(p1);


%%
waitbar_h=waitbar(0,'waittttttttttttt....');
if ischar(f)
    disp('f  ischar')
    disp(['当前打开的文件为：',f]);
    data = open(data_file);
    data.behave.trial = sortrows(data.behave.trial,3);%按照block进行排列
    t_num = strfind(data_file,'_behave');
    accelerate_style = str2double(data_file(t_num-1)); %读取 '_behave' 前面的数字，用于判断是匀速运动还是匀变速运动
    subject_name = data_file(t_num-5:t_num-3);
    condition_right = cat(1,data.behave.condition.right);condition_left = cat(1,data.behave.condition.left);
    if accelerate_style == 1
        FOC = 12;
        condition_45_1 = [1,2,3,4,5,6];condition_45_2 = [7,10,13,16,19,22];
        condition_90_1 = [7,8,9,10,11,12];condition_90_2 = [1,4,14,17,20,23];
        condition_180_1 = [13,14,15,16,17,18];condition_180_2 = [2,5,8,11,21,24];
        condition_360_1 = [19,20,21,22,23,24];condition_360_2 = [3,6,9,12,15,18];
        Ss_x = [45/3,90/3,180/3,360/3]';Ss_x = log2(Ss_x);
        count_num = cat(1,data.behave.condition.count);
        FOC_45 = (sum(condition_left(condition_45_1)./count_num(condition_45_1))+sum(condition_right(condition_45_2)./count_num(condition_45_2)))/FOC;
        FOC_90 = (sum(condition_left(condition_90_1)./count_num(condition_90_1))+sum(condition_right(condition_90_2)./count_num(condition_90_2)))/FOC;
        FOC_180 = (sum(condition_left(condition_180_1)./count_num(condition_180_1))+sum(condition_right(condition_180_2)./count_num(condition_180_2)))/FOC;
        FOC_360 = (sum(condition_left(condition_360_1)./count_num(condition_360_1))+sum(condition_right(condition_360_2)./count_num(condition_360_2)))/FOC;
        Ss_y = [FOC_45,FOC_90,FOC_180,FOC_360]';
        less_more = [1,2,3,4,5,6,8,9,11,12,15,18];more_less = [7,10,13,14,16,17,19,20,21,22,23,24];
        test_short_long = [27,28,31,32];test_long_short = [25,26,29,30];
        right_num = sum(condition_right(less_more) + condition_left(more_less));
        all_num = sum(condition_right([less_more,more_less])+condition_left([less_more,more_less]));
        right_rate = right_num/all_num; %以点多的感觉时间长为正确，计算正确率
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
        
        % 计算标准差
        block_trial = data.behave.trial;
        short_long = [less_more,test_short_long];long_short = [more_less,test_long_short];
        for ii = 1:length(block_trial(:,1))
            if find(short_long == block_trial(ii,1))%后面的时间长
                if block_trial(ii,2) == 205
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 203
                    block_trial(ii,4) = 0;
                end
            elseif find(long_short == block_trial(ii,1))%前面的时间长
                if block_trial(ii,2) == 203
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 205
                    block_trial(ii,4) = 0;
                end
            end
        end
        data.behave.trial = block_trial;
        for ii = 1:max(data.behave.trial(:,3))
            block_trial_ii = block_trial((block_trial(:,3)==ii),:);
            
            % 以点多的时间知觉长为真，统计每个block中的正确率
            error.rightrate_block(ii,1) = (sum(block_trial_ii(less_more,4))+sum(block_trial_ii(more_less,4)))/(length(less_more)+length(more_less));
            error.rightrate_block(ii,2) = 1 - error.rightrate_block(ii,1);
            % 真实的时间长度判断在每个block中的正确率
            error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
            error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
            
            % 判断不同点数的刺激被选择的频率
            error.FOC_block(ii,1) = (sum(block_trial_ii(condition_45_1,2)==203)+sum(block_trial_ii(condition_45_2,2)==205))/FOC;
            error.FOC_block(ii,2) = (sum(block_trial_ii(condition_90_1,2)==203)+sum(block_trial_ii(condition_90_2,2)==205))/FOC;
            error.FOC_block(ii,3) = (sum(block_trial_ii(condition_180_1,2)==203)+sum(block_trial_ii(condition_180_2,2)==205))/FOC;
            error.FOC_block(ii,4) = (sum(block_trial_ii(condition_360_1,2)==203)+sum(block_trial_ii(condition_360_2,2)==205))/FOC;
        end
        error_bar_bar = std(error.rightrate_block);%正确率的标准差
        error_bar_FOC = std(error.FOC_block);%选择次数的标准差
        
        % 输出正确率
        disp_str1 = sprintf('The right_rate is %.2f\n',right_rate*100);
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        fprintf(disp_str1);fprintf(disp_str2)
        % 画图
        if isfigure ~= 0
            % 画折线图
            fig_FOC = figure(1);
            set(gcf,'Position',[200,50,1200,700]);
            errorbar(Ss_x,Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
            xlabel('事件发生频率');ylabel('FOC');
            xticks(Ss_x);xticklabels({'15Hz','30Hz','60Hz','120Hz'});
            xlim([min(Ss_x)-0.2,max(Ss_x)+0.2]);ylim([-0.03,1.03]);
            title_4 = [subject_name '--实验1 FOC折线图'];
            title(title_4,'FontSize',20);set(gca,'FontSize',15);
            
            % 画柱状图
            fig_bar = figure(2);
            set(gcf,'Position',[200,50,1200,700]);
            subplot(6,2,(1:2:9))
            b1 = bar([1,2],[right_rate,1-right_rate]);
            hold on
            errorbar([1,2],[right_rate,1-right_rate],error_bar_bar(1:2),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'频率高时间长','频率低时间长'});ylim([0,1]);
            titel_1 = [subject_name '--实验1 事件发生频率不同'];
            title(titel_1,'FontSize',20);set(gca,'FontSize',15);
            subplot(6,2,(2:2:10))
            bar([1,2],[test_right_rate,1-test_right_rate]);
            hold on
            errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
            title_2 = [subject_name '--实验1 时长不同'];
            title(title_2,'FontSize',20);set(gca,'FontSize',15);
            hold off
        end
        condition_1 = more_less;condition_2 = less_more;
        
        if figure_seg ~= 0
            % 画每个实验条件选择情况的内容
            text_data = {'前后：事件发生频率高的在前还是在后/时间长的在前还是在后';...
                ' 1 :45 - 90,  顺,后,  2 :45 -180, 顺,后,  3 :45 -360, 顺,后,  4 :45 - 90,  逆,后,  5 :45 -180,逆,后,  6 :45 -360, 逆,后';...
                ' 7 :45 - 90,  顺,前,  8 :90 -180, 顺,后,  9 :90 -360, 顺,后, 10:45 - 90,  逆,前, 11:90 -180,逆,后, 12:90 -360, 逆,后';...
                '13:45 -180, 顺,前, 14:90 -180, 顺,前, 15:180-360,顺,后, 16:45 -180, 逆,前, 17:90 -180,逆,前, 18:180-360,逆,后';...
                '19:45 -360, 顺,前, 20:90 -360, 顺,前, 21:180-360,顺,前, 22:45 -360, 逆,前, 23:90 -360,逆,前, 24:180-360,逆,前';...
                '25:180-300,顺,前, 26:360-150,顺,前, 27:360-150,顺,后, 28:180-300,顺,后';...
                '29:180-300,逆,前, 30:360-150,逆,前, 31:360-150,逆,后, 32:180-300,逆,后'};
            title_text = [subject_name '--实验1 选择情况表'];
            DrawTrialsData(data,text_data,title_text,save_picture);

            % 画每个实验条件的旋转方向和先后顺序的效应
            DCRT_draw_condition = {[1,4,7,10];[2,5,13,16];[3,6,19,22];[8,11,14,17];[9,12,20,23];[15,18,21,24]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
            DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
            DCRT_x_label = {'45-90选择正确率';'45-180选择正确率';'45-360选择正确率';'90-180选择正确率';'90-360选择正确率';'180-360选择正确率'};
            DCRT_x_ticklabels = {{'45-90顺','45-90逆','90-45顺','90-45逆'};{'45-180顺','45-180逆','180-45顺','180-45逆'};{'45-360顺','45-360逆','360-45顺','360-45逆'};...
                {'90-180顺','90-180逆','180-90顺','180-90逆'};{'90-360顺','90-360逆','360-90顺','360-90逆'};{'180-360顺','180-360逆','360-180顺','360-180逆'}};
            DCRT_title_name = [subject_name '--实验1 旋转方向和先后顺序的效应'];
            DrawConditionRT(data,DCRT_draw_condition,DCRT_first_second,DCRT_x_label,DCRT_x_ticklabels,DCRT_title_name,save_picture);

            % 画每个实验条件的主效应
            DCF_draw_condition ={{[1,2,3],[1,8,9],[2,8,15],[3,9,15]};{[4,5,6],[4,11,12],[5,11,18],[6,12,18]};{[7,13,19],[7,14,20],[13,14,21],[19,20,21]};{[10,16,22],[10,17,23],[16,23,24],[22,23,24]};...
                {1,4,7,10,2,5,13,16,3,6,19,22};{7,10,1,4,8,11,14,17,9,12,20,23};{13,16,2,5,14,17,8,11,15,18,21,24};{19,22,3,6,20,23,9,12,21,24,15,18}};
                %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 45-90-180-360
                %{[45相关的实验条件];[90相关的实验条件];[180相关的实验条件];[360相关的实验条件]}
            DCF_first_second = {{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};...
                {1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2}};
            DCF_x_label = {'顺时针-后一个事件发生频率高';'逆时针-后一个事件发生频率高';'顺时针-前一个事件发生频率高';'逆时针-前一个事件发生频率高';...
                '15Hz不同条件被选择的概率';'30Hz不同条件被选择的概率';'60Hz不同条件被选择的概率';'120Hz不同条件被选择的概率'};
            DCF_x_ticklabels = {{'45','90','180','360'};{'45','90','180','360'};{'45','90','180','360'};{'45','90','180','360'};...
                {'45-90顺','45-90逆','90-45顺','90-45逆','45-180顺','45-180逆','180-45顺','180-45逆','45-360顺','45-360逆','360-45顺','360-45逆'};...
                {'90-45顺','90-45逆','45-90顺','45-90逆','90-180顺','90-180逆','180-90顺','180-90逆','90-360顺','90-360逆','360-90顺','360-90逆'};...
                {'180-45顺','180-45逆','45-180顺','45-180逆','180-90顺','180-90逆','90-180顺','90-180逆','180-360顺','180-360逆','360-180顺','360-180逆'};...
                {'360-45顺','360-45逆','45-360顺','45-360逆','360-90顺','360-90逆','90-360顺','90-360逆','360-180顺','360-180逆','180-360顺','180-360逆'}};
            DCF_title_name = [subject_name '--实验1 事件发生频率的主效应'];
            DrawConditionFOC(data,DCF_draw_condition,DCF_first_second,DCF_x_label,DCF_x_ticklabels,DCF_title_name,save_picture);
        end
    elseif accelerate_style == 2
        FOC = 12;
        % condition_2_1_1：其中，2表示第二个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
        condition_2_1_1 = [1,2,3,7,8,9];condition_2_1_2 = [13,14,15,19,20,21];% 1：120个位置呈现1次
        condition_2_2_1 = [4,5,10,11,13,19];condition_2_2_2 = [1,7,16,17,22,23];% 2：120个位置呈现3次
        condition_2_3_1 = [6,12,14,16,20,22];condition_2_3_2 = [2,4,8,10,18,24];% 3：120个位置呈现3次不同颜色
        condition_2_4_1 = [15,17,18,21,23,24];condition_2_4_2 = [3,5,6,9,11,12];% 4：360个位置
        Ss_x = [1,2,3,4]'; % 1:40个位置呈现1次；2：40个位置呈现3次；3：40个位置呈现3次不同颜色；4：120个位置
        count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
        FOC_1 = (sum(condition_left(condition_2_1_1)./count_num(condition_2_1_1))+sum(condition_right(condition_2_1_2)./count_num(condition_2_1_2)))/FOC;
        FOC_2 = (sum(condition_left(condition_2_2_1)./count_num(condition_2_2_1))+sum(condition_right(condition_2_2_2)./count_num(condition_2_2_2)))/FOC;
        FOC_3 = (sum(condition_left(condition_2_3_1)./count_num(condition_2_3_1))+sum(condition_right(condition_2_3_2)./count_num(condition_2_3_2)))/FOC;
        FOC_4 = (sum(condition_left(condition_2_4_1)./count_num(condition_2_4_1))+sum(condition_right(condition_2_4_2)./count_num(condition_2_4_2)))/FOC;
        Ss_y = [FOC_1,FOC_2,FOC_3,FOC_4]';
        test_short_long = [27,28,31,32];test_long_short = [25,26,29,30];
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
        
        % 计算标准差
        block_trial = data.behave.trial;
        short_long = test_short_long;long_short = test_long_short;
        for ii = 1:length(block_trial(:,1))
            if find(short_long == block_trial(ii,1))%后面的时间长
                if block_trial(ii,2) == 205
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 203
                    block_trial(ii,4) = 0;
                end
            elseif find(long_short == block_trial(ii,1))%前面的时间长
                if block_trial(ii,2) == 203
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 205
                    block_trial(ii,4) = 0;
                end
            else
                block_trial(ii,4) = nan;
            end
        end
        data.behave.trial = block_trial;
        for ii = 1:max(data.behave.trial(:,3))
            block_trial_ii = block_trial((block_trial(:,3)==ii),:);
            
            % 真实的时间长度判断在每个block中的正确率
            error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
            error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
            
            % 判断不同条件的刺激被选择的频率
            error.FOC_block(ii,1) = (sum(block_trial_ii(condition_2_1_1,2)==203)+sum(block_trial_ii(condition_2_1_2,2)==205))/FOC;
            error.FOC_block(ii,2) = (sum(block_trial_ii(condition_2_2_1,2)==203)+sum(block_trial_ii(condition_2_2_2,2)==205))/FOC;
            error.FOC_block(ii,3) = (sum(block_trial_ii(condition_2_3_1,2)==203)+sum(block_trial_ii(condition_2_3_2,2)==205))/FOC;
            error.FOC_block(ii,4) = (sum(block_trial_ii(condition_2_4_1,2)==203)+sum(block_trial_ii(condition_2_4_2,2)==205))/FOC;
        end
        error_bar_bar = std(error.rightrate_block);%正确率的标准差
        error_bar_FOC = std(error.FOC_block);%选择次数的标准差
        
        % 输出正确率
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        fprintf(disp_str2)
        % 画图
        if isfigure ~= 0
            % 画折线图
            fig_FOC = figure(1);
            set(gcf,'Position',[200,50,1200,700]);
            errorbar(Ss_x,Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
            xlabel('事件条件');ylabel('FOC');
            xticks([1,2,3,4]);xticklabels({'呈现1次','呈现3次','呈现3次颜色变化','位置3倍'});
            xlim([min(Ss_x)-0.2,max(Ss_x)+0.2]);ylim([-0.03,1.03]);
            title_4 = [subject_name '--实验2 FOC折线图'];
            title(title_4,'FontSize',20);set(gca,'FontSize',15);
            
            % 画柱状图
            fig_bar = figure(2);
            subplot(6,1,(1:5))
            set(gcf,'Position',[200,50,1200,700]);
            bar([1,2],[test_right_rate,1-test_right_rate]);
            hold on
            titel_1 = [subject_name '--实验2 事件不同'];
            errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
            title_2 = [subject_name '--实验2 时长不同'];
            title(title_2,'FontSize',20);set(gca,'FontSize',15);
            hold off
        end
        
        if figure_seg ~= 0
            % 画每个实验条件选择情况的内容
            text_data = {'1:60位置呈现1次， 2:60位置呈现3次， 3:60位置颜色变化， 4:120位置';...
                '前后：数字大的实验条件在前还是在后/时间长的在前还是在后';...
                ' 1 :1-2,顺,后,       2 :1-3,顺,后,      3 :1-4,顺,后,       4 :2-3,顺,后,       5 :2-4,顺,后,       6 :3-4,顺,后';...
                ' 7 :1-2,逆,后,       8 :1-3,逆,后,      9 :1-4,逆,后,      10:2-3,逆,后,      11:2-4,逆,后,      12:3-4,逆,后';...
                '13:1-2,顺,前,      14:1-3,顺,前,     15:1-4,顺,前,      16:2-3,顺,前,      17:2-4,顺,前,      18:3-4,顺,前';...
                '19:1-2,逆,前,      20:1-3,逆,前,     21:1-4,逆,前,      22:2-3,逆,前,      23:2-4,逆,前,      24:3-4,逆,前';...
                '25:2-4,顺,后/前, 26:2-4,顺,前/前, 27:2-4,顺,后/后, 28:2-4,顺,前/后';...
                '29:2-4,顺,后/前, 30:2-4,顺,前/前, 31:2-4,顺,后/后, 32:2-4,顺,前/后'};
            title_text = [subject_name '--实验2 选择情况表'];
            DrawTrialsData(data,text_data,title_text,save_picture);
            
            % 画每个实验条件的旋转方向和先后顺序的效应
            DCRT_draw_condition = {[1,7,13,19];[2,8,14,20];[3,9,15,21];[4,10,16,22];[5,11,17,23];[6,12,18,24]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
            DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
            DCRT_x_label = {'60位置呈现1次-60位置呈现3次选择正确率';'60位置呈现1次-60位置颜色变化选择正确率';'60位置呈现1次-120位置选择正确率';...
                '60位置呈现3次-60位置颜色变化选择正确率';'60位置呈现3次-120位置选择正确率';'60位置颜色变化-120位置选择正确率'};
            DCRT_x_ticklabels = {{'1-2顺','1-2逆','2-1顺','2-1逆'};{'1-3顺','1-3逆','3-1顺','3-1逆'};{'1-4顺','1-4逆','4-1顺','4-1逆'};...
                {'2-3顺','2-3逆','3-2顺','3-2逆'};{'2-4顺','2-4逆','4-2顺','4-2逆'};{'3-4顺','3-4逆','4-3顺','4-3逆'}};
            DCRT_title_name = [subject_name '--实验2 旋转方向和先后顺序的效应'];
            DrawConditionRT(data,DCRT_draw_condition,DCRT_first_second,DCRT_x_label,DCRT_x_ticklabels,DCRT_title_name,save_picture);
            
            % 画每个实验条件的主效应
            DCF_draw_condition ={{[1,2,3],[1,4,5],[2,4,6],[3,5,6]};{[7,8,9],[7,10,11],[8,10,12],[9,11,12]};{[13,14,15],[13,16,17],[14,16,18],[15,17,18]};{[19,20,21],[19,22,23],[20,22,24],[21,23,24]};...
                {1,7,13,19,2,8,14,20,3,9,15,21};{13,19,1,7,4,10,16,22,5,11,17,23};{14,20,2,8,16,22,4,10,6,12,18,24};{15,21,3,9,17,23,5,11,18,24,6,12}};
                %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 1-2-3-4 这四种实验条件
                %{[45相关的实验条件];[90相关的实验条件];[180相关的实验条件];[360相关的实验条件]}
            DCF_first_second = {{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};...
                {1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2}};
            DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                '条件1不同情况的被选择概率';'条件2不同情况的被选择概率';'条件3不同情况的被选择概率';'条件4不同情况的被选择概率'};
            DCF_x_ticklabels = {{'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                {'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                {'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                {'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                {'1-2顺','1-2逆','2-1顺','2-1逆','1-3顺','1-3逆','3-1顺','3-1逆','1-4顺','1-4逆','4-1顺','4-1逆'};...
                {'2-1顺','2-1逆','1-2顺','1-2逆','2-3顺','2-3逆','3-2顺','3-2逆','2-4顺','2-4逆','4-2顺','4-2逆'};...
                {'3-1顺','3-1逆','1-3顺','1-3逆','3-2顺','3-2逆','2-3顺','2-3逆','3-4顺','3-4逆','4-3顺','4-3逆'};...
                {'4-1顺','4-1逆','1-4顺','1-4逆','4-2顺','4-2逆','2-4顺','2-4逆','4-3顺','4-3逆','3-4顺','3-4逆'}};
            DCF_title_name = [subject_name '--实验2 实验条件的主效应'];
            DrawConditionFOC(data,DCF_draw_condition,DCF_first_second,DCF_x_label,DCF_x_ticklabels,DCF_title_name,save_picture);
        end
    elseif accelerate_style == 3
        FOC = 8;
        % condition_3_1_1：其中，3表示第二个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
        condition_3_1_1 = [1,2,4,5];condition_3_1_2 = [7,8,10,11];% 1：匀加速
        condition_3_2_1 = [3,6,7,10];condition_3_2_2 = [1,4,9,12];% 2：匀减速
        condition_3_3_1 = [8,9,11,12];condition_3_3_2 = [2,3,5,6];% 3：匀速
        Ss_x = [1,2,3]'; % 1:匀加速；2：匀减速；3：匀速
        count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
        FOC_1 = (sum(condition_left(condition_3_1_1)./count_num(condition_3_1_1))+sum(condition_right(condition_3_1_2)./count_num(condition_3_1_2)))/FOC;
        FOC_2 = (sum(condition_left(condition_3_2_1)./count_num(condition_3_2_1))+sum(condition_right(condition_3_2_2)./count_num(condition_3_2_2)))/FOC;
        FOC_3 = (sum(condition_left(condition_3_3_1)./count_num(condition_3_3_1))+sum(condition_right(condition_3_3_2)./count_num(condition_3_3_2)))/FOC;
        Ss_y = [FOC_1,FOC_2,FOC_3]';
        test_long_short = [13,14];test_short_long = [15,16];
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
        
        % 计算标准差
        block_trial = data.behave.trial;
        short_long = test_short_long;long_short = test_long_short;
        for ii = 1:length(block_trial(:,1))
            if find(short_long == block_trial(ii,1))%后面的时间长
                if block_trial(ii,2) == 205
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 203
                    block_trial(ii,4) = 0;
                end
            elseif find(long_short == block_trial(ii,1))%前面的时间长
                if block_trial(ii,2) == 203
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 205
                    block_trial(ii,4) = 0;
                end
            else
                block_trial(ii,4) = nan;
            end
        end
        data.behave.trial = block_trial;
        for ii = 1:max(data.behave.trial(:,3))
            block_trial_ii = block_trial((block_trial(:,3)==ii),:);
            
            % 真实的时间长度判断在每个block中的正确率
            error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
            error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
            % 判断不同点数的刺激被选择的频率
            error.FOC_block(ii,1) = (sum(block_trial_ii(condition_3_1_1,2)==203)+sum(block_trial_ii(condition_3_1_2,2)==205))/FOC;
            error.FOC_block(ii,2) = (sum(block_trial_ii(condition_3_2_1,2)==203)+sum(block_trial_ii(condition_3_2_2,2)==205))/FOC;
            error.FOC_block(ii,3) = (sum(block_trial_ii(condition_3_3_1,2)==203)+sum(block_trial_ii(condition_3_3_2,2)==205))/FOC;
        end
        error_bar_bar = std(error.rightrate_block);%正确率的标准差
        error_bar_FOC = std(error.FOC_block);%选择次数的标准差
        
        % 输出正确率
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        fprintf(disp_str2);
        % 画图
        if isfigure ~= 0
            % 画折线图
            fig_FOC = figure(1);
            set(gcf,'Position',[200,50,1200,700]);
            errorbar(Ss_x,Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
            xlabel('速度变化情况');ylabel('FOC');
            xticks([1,2,3]);xticklabels({'匀加速','匀减速','匀速'});
            xlim([min(Ss_x)-0.2,max(Ss_x)+0.2]);ylim([-0.03,1.03]);
            title_4 = [subject_name '--实验3 FOC折线图'];
            title(title_4,'FontSize',20);set(gca,'FontSize',15);
            
            % 画柱状图
            fig_bar = figure(2);
            subplot(6,1,(1:5))
            set(gcf,'Position',[200,50,1200,700]);
            bar([1,2],[test_right_rate,1-test_right_rate]);
            hold on
            titel_1 = [subject_name '--实验3 速度状态不同'];
            errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
            title_2 = [subject_name '--实验3 时长不同'];
            title(title_2,'FontSize',20);set(gca,'FontSize',15);
            hold off
        end
        if figure_seg ~= 0
            % 画每个实验条件选择情况的内容
            text_data = {'按照 加速-减速-匀速 的顺序判断前后';...
                '前后：越往后的实验条件在前还是在后/时间长的在前还是在后';...
                ' 1 :加-减,顺,后,       2 :加-匀,顺,后,      3 :减-匀,顺,后';...
                ' 4 :加-减,逆,后,       5 :加-匀,逆,后,      6 :减-匀,逆,后';...
                ' 7 :加-减,顺,前,       8 :加-匀,顺,前,      9 :减-匀,顺,前';...
                '10:加-减,逆,前,      11:加-匀,逆,前,    12 :减-匀,逆,前';...
                '13:加-减,顺,后/前, 14:加-减,顺,前/前';...
                '15:加-减,顺,后/后, 16:加-减,顺,前/后'};
            title_text = [subject_name '--实验3 选择情况表'];
            DrawTrialsData(data,text_data,title_text,save_picture);
            
            % 画每个实验条件的旋转方向和先后顺序的效应
            DCRT_draw_condition = {[1,4,7,10];[2,5,8,11];[3,6,9,12]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
            DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
            DCRT_x_label = {'加速-减速选择正确率';'加速-匀速选择正确率';'减速-匀速选择正确率';};
            DCRT_x_ticklabels = {{'加-减-顺','加-减-逆','减-加-顺','减-加-逆'};...
                {'加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};{'减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};};
            DCRT_title_name = [subject_name '--实验3 旋转方向和先后顺序的效应'];
            DrawConditionRT(data,DCRT_draw_condition,DCRT_first_second,DCRT_x_label,DCRT_x_ticklabels,DCRT_title_name,save_picture);
            
            % 画每个实验条件的主效应
            DCF_draw_condition ={{[1,2],[1,3],[2,3]};{[4,5],[4,6],[5,6]};{[7,8],[7,9],[8,9]};{[10,11],[10,12],[11,12]};...
                {1,4,7,10,2,5,8,11};{7,10,1,4,3,6,9,12};{8,11,2,5,9,12,3,6}};
                %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 加速-减速-匀速 这三种实验条件
                %{[加速相关的实验条件];[减速相关的实验条件];[匀速相关的实验条件]}
            DCF_first_second = {{[1,1],[2,1],[2,2]};{[1,1],[2,1],[2,2]};{[2,2],[1,2],[1,1]};{[2,2],[1,2],[1,1]};...
                {1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2}};
            DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                '加速不同情况的被选择概率';'减速不同情况的被选择概率';'匀速不同情况的被选择概率'};
            DCF_x_ticklabels = {{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};...
                {'加-减-顺','加-减-逆','减-加-顺','减-加-逆','加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};...
                {'减-加-顺','减-加-逆','加-减-顺','加-减-逆','减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};...
                {'匀-加-顺','匀-加-逆','加-匀-顺','加-匀-逆','匀-减-顺','匀-减-逆','减-匀-顺','减-匀-逆'}};
            DCF_title_name = [subject_name '--实验3 实验条件的主效应'];
            DrawConditionFOC(data,DCF_draw_condition,DCF_first_second,DCF_x_label,DCF_x_ticklabels,DCF_title_name,save_picture);
        end
    elseif accelerate_style == 4
        FOC = 8;
        % condition_4_1_1：其中，3表示第二个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
        condition_4_1_1 = [1,2,4,5];condition_4_1_2 = [7,8,10,11];% 1：先加速后减速
        condition_4_2_1 = [3,6,7,10];condition_4_2_2 = [1,4,9,12];% 2：先减速后加速
        condition_4_3_1 = [8,9,11,12];condition_4_3_2 = [2,3,5,6];% 3：匀速
        Ss_x = [1,2,3]'; % 1:先加速后减速；2：先减速后加速；3：匀速
        count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
        FOC_1 = (sum(condition_left(condition_4_1_1)./count_num(condition_4_1_1))+sum(condition_right(condition_4_1_2)./count_num(condition_4_1_2)))/FOC;
        FOC_2 = (sum(condition_left(condition_4_2_1)./count_num(condition_4_2_1))+sum(condition_right(condition_4_2_2)./count_num(condition_4_2_2)))/FOC;
        FOC_3 = (sum(condition_left(condition_4_3_1)./count_num(condition_4_3_1))+sum(condition_right(condition_4_3_2)./count_num(condition_4_3_2)))/FOC;
        Ss_y = [FOC_1,FOC_2,FOC_3]';
        test_long_short = [13,14];test_short_long = [15,16];
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
        
        % 计算标准差
        block_trial = data.behave.trial;
        short_long = test_short_long;long_short = test_long_short;
        for ii = 1:length(block_trial(:,1))
            if find(short_long == block_trial(ii,1))%后面的时间长
                if block_trial(ii,2) == 205
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 203
                    block_trial(ii,4) = 0;
                end
            elseif find(long_short == block_trial(ii,1))%前面的时间长
                if block_trial(ii,2) == 203
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 205
                    block_trial(ii,4) = 0;
                end
            else
                block_trial(ii,4) = nan;
            end
        end
        data.behave.trial = block_trial;
        for ii = 1:max(data.behave.trial(:,3))
            block_trial_ii = block_trial((block_trial(:,3)==ii),:);
            
            % 真实的时间长度判断在每个block中的正确率
            error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
            error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
            % 判断不同点数的刺激被选择的频率
            error.FOC_block(ii,1) = (sum(block_trial_ii(condition_4_1_1,2)==203)+sum(block_trial_ii(condition_4_1_2,2)==205))/FOC;
            error.FOC_block(ii,2) = (sum(block_trial_ii(condition_4_2_1,2)==203)+sum(block_trial_ii(condition_4_2_2,2)==205))/FOC;
            error.FOC_block(ii,3) = (sum(block_trial_ii(condition_4_3_1,2)==203)+sum(block_trial_ii(condition_4_3_2,2)==205))/FOC;
        end
        error_bar_bar = std(error.rightrate_block);%正确率的标准差
        error_bar_FOC = std(error.FOC_block);%选择次数的标准差
        
        % 输出正确率
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        fprintf(disp_str2);
        % 画图
        if isfigure ~= 0
            % 画折线图
            fig_FOC = figure(1);
            set(gcf,'Position',[200,50,1200,700]);
            errorbar(Ss_x,Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
            xlabel('速度变化情况');ylabel('FOC');
            xticks([1,2,3]);xticklabels({'先加速后减速','先减速后加速','匀速'});
            xlim([min(Ss_x)-0.2,max(Ss_x)+0.2]);ylim([-0.03,1.03]);
            title_4 = [subject_name '--实验4 FOC折线图'];
            title(title_4,'FontSize',20);set(gca,'FontSize',15);
            
            % 画柱状图
            fig_bar = figure(2);
            subplot(6,1,(1:5))
            set(gcf,'Position',[200,50,1200,700]);
            bar([1,2],[test_right_rate,1-test_right_rate]);
            hold on
            titel_1 = [subject_name '--实验4 速度变化不同'];
            errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
            title_2 = [subject_name '--实验4 时长不同'];
            title(title_2,'FontSize',20);set(gca,'FontSize',15);
            hold off
        end
        if figure_seg ~= 0
            % 画每个实验条件选择情况的内容
            text_data = {'按照 先加后减-先减后加-匀速 的顺序判断前后';...
                '前后：越往后的实验条件在前还是在后/时间长的在前还是在后';...
                ' 1 :加减-减加,顺,后,       2 :加减-匀速,顺,后,      3 :减加-匀速,顺,后';...
                ' 4 :加减-减加,逆,后,       5 :加减-匀速,逆,后,      6 :减加-匀速,逆,后';...
                ' 7 :加减-减加,顺,前,       8 :加减-匀速,顺,前,      9 :减加-匀速,顺,前';...
                '10:加减-减加,逆,前,      11:加减-匀速,逆,前,    12 :减加-匀速,逆,前';...
                '13:加减-减加,顺,后/前, 14:加减-减加,顺,前/前';...
                '15:加减-减加,顺,后/后, 16:加减-减加,顺,前/后'};
            title_text = [subject_name '--实验4 选择情况表'];
            DrawTrialsData(data,text_data,title_text,save_picture);
            
            % 画每个实验条件的旋转方向和先后顺序的效应
            DCRT_draw_condition = {[1,4,7,10];[2,5,8,11];[3,6,9,12]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
            DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
            DCRT_x_label = {'先加后减-先减后加选择正确率';'先加后减-匀速选择正确率';'先减后加-匀速选择正确率';};
            DCRT_x_ticklabels = {{'加减-减加-顺','加减-减加-逆','减加-加减-顺','减加-加减-逆'};...
                {'加减-匀-顺','加减-匀-逆','匀-加减-顺','匀-加减-逆'};{'减加-匀-顺','减加-匀-逆','匀-减加-顺','匀-减加-逆'};};
            DCRT_title_name = [subject_name '--实验4 旋转方向和先后顺序的效应'];
            DrawConditionRT(data,DCRT_draw_condition,DCRT_first_second,DCRT_x_label,DCRT_x_ticklabels,DCRT_title_name,save_picture);
            
            % 画每个实验条件的主效应
            DCF_draw_condition ={{[1,2],[1,3],[2,3]};{[4,5],[4,6],[5,6]};{[7,8],[7,9],[8,9]};{[10,11],[10,12],[11,12]};...
                {1,4,7,10,2,5,8,11};{7,10,1,4,3,6,9,12};{8,11,2,5,9,12,3,6}};
                %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 先加后减-先减后加-匀速 这三种实验条件
                %{[先加后减相关的实验条件];[先减后加相关的实验条件];[匀速相关的实验条件]}
            DCF_first_second = {{[1,1],[2,1],[2,2]};{[1,1],[2,1],[2,2]};{[2,2],[1,2],[1,1]};{[2,2],[1,2],[1,1]};...
                {1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2}};
            DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                '先加后减不同情况的被选择概率';'先减后加不同情况的被选择概率';'匀速不同情况的被选择概率'};
            DCF_x_ticklabels = {{'先加后减','先减后加','匀速'};{'先加后减','先减后加','匀速'};...
                {'先加后减','先减后加','匀速'};{'先加后减','先减后加','匀速'};...
                {'加减-减加-顺','加减-减加-逆','减加-加减-顺','减加-加减-逆','加减-匀-顺','加减-匀-逆','匀-加减-顺','匀-加减-逆'};...
                {'减加-加减-顺','减加-加减-逆','加减-减加-顺','加减-减加-逆','减加-匀-顺','减加-匀-逆','匀-减加-顺','匀-减加-逆'};...
                {'匀-加减-顺','匀-加减-逆','加减-匀-顺','加减-匀-逆','匀-减加-顺','匀-减加-逆','减加-匀-顺','减加-匀-逆'}};
            DCF_title_name = [subject_name '--实验4 实验条件的主效应'];
            DrawConditionFOC(data,DCF_draw_condition,DCF_first_second,DCF_x_label,DCF_x_ticklabels,DCF_title_name,save_picture);
        end
    elseif accelerate_style == 5
        
        test_short_long = [3,4,7,8];test_long_short = [1,2,5,6];
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
        
        % 计算标准差
        block_trial = data.behave.trial;
        short_long = test_short_long;long_short = test_long_short;
        for ii = 1:length(block_trial(:,1))
            if find(short_long == block_trial(ii,1))%后面的时间长
                if block_trial(ii,2) == 205
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 203
                    block_trial(ii,4) = 0;
                end
            elseif find(long_short == block_trial(ii,1))%前面的时间长
                if block_trial(ii,2) == 203
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 205
                    block_trial(ii,4) = 0;
                end
            end
        end
        data.behave.trial = block_trial;
        for ii = 1:max(data.behave.trial(:,3))
            block_trial_ii = block_trial((block_trial(:,3)==ii),:);
            
            % 真实的时间长度判断在每个block中的正确率
            error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
            error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
            
        end
        error_bar_bar = std(error.rightrate_block);%正确率的标准差
        
        % 输出正确率
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        fprintf(disp_str2)
        % 画图
        if isfigure ~= 0
           
            % 画柱状图
            fig_bar = figure(2);
            subplot(6,1,(1:5))
            set(gcf,'Position',[200,50,1200,700]);
            bar([1,2],[test_right_rate,1-test_right_rate]);
            hold on
            errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
            title_2 = [subject_name '--实验6 时长不同'];
            title(title_2,'FontSize',20);set(gca,'FontSize',15);
            hold off
        end
        
    elseif accelerate_style == 7 
        % 无序之间的比较
        FOC1 = 4;
        condition_30_0_1 = [1,2];condition_30_0_2 = [4,5];% 30Hz无序
        condition_40_0_1 = [3,4];condition_40_0_2 = [1,6];% 40Hz无序
        condition_60_0_1 = [5,6];condition_60_0_2 = [2,3];% 60Hz无序
        Ss_x = [1,2,3]';
        count_num = cat(1,data.behave.condition.count);
        FOC_30 = (sum(condition_left(condition_30_0_1)./count_num(condition_30_0_1))+sum(condition_right(condition_30_0_2)./count_num(condition_30_0_2)))/FOC1;
        FOC_40 = (sum(condition_left(condition_40_0_1)./count_num(condition_40_0_1))+sum(condition_right(condition_40_0_2)./count_num(condition_40_0_2)))/FOC1;
        FOC_60 = (sum(condition_left(condition_60_0_1)./count_num(condition_60_0_1))+sum(condition_right(condition_60_0_2)./count_num(condition_60_0_2)))/FOC1;
        Ss_y1 = [FOC_30,FOC_40,FOC_60]';
        % 有序和无序之间的比较，选择无序的概率
        FOC2 = 2;
        c_30_0_1 = 10;c_30_0_2 = 7;% 30Hz无序
        c_40_0_1 = 11;c_40_0_2 = 8;% 40Hz无序
        c_60_0_1 = 12;c_60_0_2 = 9;% 60Hz无序
        FOC_30_0 = (sum(condition_left(c_30_0_1)./count_num(c_30_0_1))+sum(condition_right(c_30_0_2)./count_num(c_30_0_2)))/FOC2;
        FOC_40_0 = (sum(condition_left(c_40_0_1)./count_num(c_40_0_1))+sum(condition_right(c_40_0_2)./count_num(c_40_0_2)))/FOC2;
        FOC_60_0 = (sum(condition_left(c_60_0_1)./count_num(c_60_0_1))+sum(condition_right(c_60_0_2)./count_num(c_60_0_2)))/FOC2;
        Ss_y2 = [FOC_30_0,FOC_40_0,FOC_60_0]';
        % 有真实时间差异的条件
        test_short_long = [15,16];test_long_short = [13,14];
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
        
        % 计算标准差
        block_trial = data.behave.trial;
        short_long = test_short_long;long_short = test_long_short;
        for ii = 1:length(block_trial(:,1))
            if find(short_long == block_trial(ii,1))%后面的时间长
                if block_trial(ii,2) == 205
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 203
                    block_trial(ii,4) = 0;
                end
            elseif find(long_short == block_trial(ii,1))%前面的时间长
                if block_trial(ii,2) == 203
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 205
                    block_trial(ii,4) = 0;
                end
            end
        end
        data.behave.trial = block_trial;
        for ii = 1:max(data.behave.trial(:,3)) % 每一次循环中，每个实验条件被选择的概率
            block_trial_ii = block_trial((block_trial(:,3)==ii),:);
            % 真实的时间长度判断在每个block中的正确率
            error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
            error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
            % 无序之间比较的标准差
            error.FOC_block(ii,1) = (sum(block_trial_ii(condition_30_0_1,2)==203)+sum(block_trial_ii(condition_30_0_2,2)==205))/FOC1;
            error.FOC_block(ii,2) = (sum(block_trial_ii(condition_40_0_1,2)==203)+sum(block_trial_ii(condition_40_0_2,2)==205))/FOC1;
            error.FOC_block(ii,3) = (sum(block_trial_ii(condition_60_0_1,2)==203)+sum(block_trial_ii(condition_60_0_2,2)==205))/FOC1;
            % 无序和有序之间比较的标准差
            error.FOC_block(ii,4) = (sum(block_trial_ii(c_30_0_1,2)==203)+sum(block_trial_ii(c_30_0_2,2)==205))/FOC2;
            error.FOC_block(ii,5) = (sum(block_trial_ii(c_40_0_1,2)==203)+sum(block_trial_ii(c_40_0_2,2)==205))/FOC2;
            error.FOC_block(ii,6) = (sum(block_trial_ii(c_60_0_1,2)==203)+sum(block_trial_ii(c_60_0_2,2)==205))/FOC2;
        end
        error_bar_bar = std(error.rightrate_block);%正确率的标准差
        error_bar_FOC = std(error.FOC_block);%选择次数的标准差
        
        % 画图
        if isfigure ~= 0
            % 画折线图
            fig_FOC = figure(1);
            set(gcf,'Position',[200,50,1200,700]);
            errorbar(Ss_x,Ss_y1,error_bar_FOC(1:3),'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
            xlabel('事件发生频率');ylabel('POC');
            xticks(Ss_x);xticklabels({'30Hz','40Hz','60Hz'});
            xlim([min(Ss_x)-0.2,max(Ss_x)+0.2]);ylim([-0.03,1.03]);
            title_4 = [subject_name '--无序条件 POC折线图'];
            title(title_4,'FontSize',20);set(gca,'FontSize',15);
            % 画折线图
            fig_FOC2 = figure(3);
            set(gcf,'Position',[200,50,1200,700]);
            errorbar(Ss_x,Ss_y2,error_bar_FOC(4:6),'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
            xlabel('事件发生频率');ylabel('选择无序条件的 POC');
            xticks(Ss_x);xticklabels({'30Hz','40Hz','60Hz'});
            xlim([min(Ss_x)-0.2,max(Ss_x)+0.2]);ylim([-0.03,1.03]);
            title_4 = [subject_name '--有序 VS 无序 选择无序的 POC 折线图'];
            title(title_4,'FontSize',20);set(gca,'FontSize',15);
            % 画柱状图
            fig_bar = figure(2);
            set(gcf,'Position',[200,50,1200,700]);
            subplot(6,1,1:5)
            bar([1,2],[test_right_rate,1-test_right_rate]);
            hold on
            errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
            title_2 = [subject_name '--真实时间差异'];
            title(title_2,'FontSize',20);set(gca,'FontSize',15);
            hold off
        end
    elseif accelerate_style == 8
        FOC = 8;
        % condition_8_1_1：其中，8表示第8个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
        condition_8_1_1 = [1,2,4,5];condition_8_1_2 = [7,8,10,11];% 1：加速
        condition_8_2_1 = [3,6,7,10];condition_8_2_2 = [1,4,9,12];% 2：减速
        condition_8_3_1 = [8,9,11,12];condition_8_3_2 = [2,3,5,6];% 3：匀速
        Ss_x = [1,2,3]'; % 1:加速；2：减速；3：匀速
        count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
        FOC_1 = (sum(condition_left(condition_8_1_1)./count_num(condition_8_1_1))+sum(condition_right(condition_8_1_2)./count_num(condition_8_1_2)))/FOC;
        FOC_2 = (sum(condition_left(condition_8_2_1)./count_num(condition_8_2_1))+sum(condition_right(condition_8_2_2)./count_num(condition_8_2_2)))/FOC;
        FOC_3 = (sum(condition_left(condition_8_3_1)./count_num(condition_8_3_1))+sum(condition_right(condition_8_3_2)./count_num(condition_8_3_2)))/FOC;
        Ss_y = [FOC_1,FOC_2,FOC_3]';
        test_long_short = [13,14];test_short_long = [15,16];
        test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
        test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
        test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
                
        % 计算标准差
        block_trial = data.behave.trial;
        short_long = test_short_long;long_short = test_long_short;
        for ii = 1:length(block_trial(:,1))
            if find(short_long == block_trial(ii,1))%后面的时间长
                if block_trial(ii,2) == 205
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 203
                    block_trial(ii,4) = 0;
                end
            elseif find(long_short == block_trial(ii,1))%前面的时间长
                if block_trial(ii,2) == 203
                    block_trial(ii,4) = 1;
                elseif block_trial(ii,2) == 205
                    block_trial(ii,4) = 0;
                end
            else
                block_trial(ii,4) = nan;
            end
        end
        data.behave.trial = block_trial;
        for ii = 1:max(data.behave.trial(:,3))
            block_trial_ii = block_trial((block_trial(:,3)==ii),:);
            
            % 真实的时间长度判断在每个block中的正确率
            error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
            error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
            % 判断不同点数的刺激被选择的频率,单试次
            error.FOC_block(ii,1) = (sum(block_trial_ii(condition_8_1_1,2)==203)+sum(block_trial_ii(condition_8_1_2,2)==205))/FOC;
            error.FOC_block(ii,2) = (sum(block_trial_ii(condition_8_2_1,2)==203)+sum(block_trial_ii(condition_8_2_2,2)==205))/FOC;
            error.FOC_block(ii,3) = (sum(block_trial_ii(condition_8_3_1,2)==203)+sum(block_trial_ii(condition_8_3_2,2)==205))/FOC;
        end
        error_bar_bar = std(error.rightrate_block);%正确率的标准差
        error_bar_FOC = std(error.FOC_block);%选择次数的标准差
        
        % 输出正确率
        disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
        fprintf(disp_str2);
        % 画图
        if isfigure ~= 0
            % 画折线图
            fig_FOC = figure(1);
            set(gcf,'Position',[200,50,1200,700]);
            errorbar(Ss_x,Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
            xlabel('速度变化情况');ylabel('FOC');
            xticks([1,2,3]);xticklabels({'加速','减速','匀速'});
            xlim([min(Ss_x)-0.2,max(Ss_x)+0.2]);ylim([-0.03,1.03]);
            title_4 = [subject_name '--实验8 FOC折线图'];
            title(title_4,'FontSize',20);set(gca,'FontSize',15);
            % 画散点
            hold on
            scatter_x = repmat(Ss_x',size(error.FOC_block,1),1);
            scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
            scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.1 - 0.05;
            scatter_y = error.FOC_block;
            scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
            scatter(scatter_x,scatter_y,35,[0 0 0],'o','filled');
            
            % 画柱状图
            fig_bar = figure(2);
            subplot(6,1,(1:5))
            set(gcf,'Position',[200,50,1200,700]);
            bar([1,2],[test_right_rate,1-test_right_rate]);
            hold on
            titel_1 = [subject_name '--实验8 速度状态不同'];
            errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
            xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
            title_2 = [subject_name '--实验8 时长不同'];
            title(title_2,'FontSize',20);set(gca,'FontSize',15);
            hold off
        end
        if figure_seg ~= 0
            % 画每个实验条件选择情况的内容
            text_data = {'按照 加速-减速-匀速 的顺序判断前后';...
                '前后：越往后的实验条件在前还是在后/时间长的在前还是在后';...
                ' 1 :加-减,顺,后,       2 :加-匀,顺,后,      3 :减-匀,顺,后';...
                ' 4 :加-减,逆,后,       5 :加-匀,逆,后,      6 :减-匀,逆,后';...
                ' 7 :加-减,顺,前,       8 :加-匀,顺,前,      9 :减-匀,顺,前';...
                '10:加-减,逆,前,      11:加-匀,逆,前,    12 :减-匀,逆,前';...
                '13:加-减,顺,后/前, 14:加-减,顺,前/前';...
                '15:加-减,顺,后/后, 16:加-减,顺,前/后'};
            title_text = [subject_name '--实验8 选择情况表'];
            DrawTrialsData(data,text_data,title_text,save_picture);
            
            % 画每个实验条件的旋转方向和先后顺序的效应
            DCRT_draw_condition = {[1,4,7,10];[2,5,8,11];[3,6,9,12]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
            DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
            DCRT_x_label = {'加速-减速选择正确率';'加速-匀速选择正确率';'减速-匀速选择正确率';};
            DCRT_x_ticklabels = {{'加-减-顺','加-减-逆','减-加-顺','减-加-逆'};...
                {'加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};{'减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};};
            DCRT_title_name = [subject_name '--实验8 旋转方向和先后顺序的效应'];
            DrawConditionRT(data,DCRT_draw_condition,DCRT_first_second,DCRT_x_label,DCRT_x_ticklabels,DCRT_title_name,save_picture);
            
            % 画每个实验条件的主效应
            DCF_draw_condition ={{[1,2],[1,3],[2,3]};{[4,5],[4,6],[5,6]};{[7,8],[7,9],[8,9]};{[10,11],[10,12],[11,12]};...
                {1,4,7,10,2,5,8,11};{7,10,1,4,3,6,9,12};{8,11,2,5,9,12,3,6}};
                %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 加速-减速-匀速 这三种实验条件
                %{[加速相关的实验条件];[减速相关的实验条件];[匀速相关的实验条件]}
            DCF_first_second = {{[1,1],[2,1],[2,2]};{[1,1],[2,1],[2,2]};{[2,2],[1,2],[1,1]};{[2,2],[1,2],[1,1]};...
                {1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2}};
            DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                '加速不同情况的被选择概率';'减速不同情况的被选择概率';'匀速不同情况的被选择概率'};
            DCF_x_ticklabels = {{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};...
                {'加-减-顺','加-减-逆','减-加-顺','减-加-逆','加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};...
                {'减-加-顺','减-加-逆','加-减-顺','加-减-逆','减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};...
                {'匀-加-顺','匀-加-逆','加-匀-顺','加-匀-逆','匀-减-顺','匀-减-逆','减-匀-顺','减-匀-逆'}};
            DCF_title_name = [subject_name '--实验8 实验条件的主效应'];
            DrawConditionFOC(data,DCF_draw_condition,DCF_first_second,DCF_x_label,DCF_x_ticklabels,DCF_title_name,save_picture);
        end
    end
    
    if accelerate_style == 1
        % t检验（以事件发生频率高时间长为正确/以减速运动时间长为正确，计算正确率，比较正确率和0.5之间的差异）
        rightrate_block_n = error.rightrate_block(:,1);%实验条件的正确率
        rightrate_block_stan = ones(size(rightrate_block_n,1),1).*0.5;
        [t_nh_i,t_np_i,t_nci_i,t_nstats_i] = ttest2(rightrate_block_n,rightrate_block_stan);%实验条件的t检验
            %t=1表示在0.05水平上拒绝原假设；%ci是置信区间；
        disp_ttest = sprintf('实验1 t检验结果p值为： %.4f',t_np_i);
        fprintf(disp_ttest);
        % 真实实际差异的t检验
        rightrate_block_test_n = error.rightrate_block(:,3);%实验条件的正确率
        rightrate_block_test_stan = ones(size(rightrate_block_test_n,1),1).*0.5;
        [t_nh_i2,t_np_i2,t_nci_i2,t_nstats_i2] = ttest2(rightrate_block_test_n,rightrate_block_test_stan);%实验条件的t检验
            %t=1表示在0.05水平上拒绝原假设；%ci是置信区间；
        disp_ttest2 = sprintf('实验1 真实时间差异t检验结果p值为： %.4f',t_np_i2);
        fprintf(disp_ttest2);
        % 卡方检验
        trial_condition = cat(1,data.behave.trial(:,1));
        condition_num = sort([condition_1,condition_2]);%确定有哪些条件是实验条件
        row_num = ismember(trial_condition,condition_num);%实验条件在哪些行
        trial_cell(:,1) = data.behave.trial(row_num,1);%实验条件名称
        trial_cell(:,2) = data.behave.trial(row_num,2);%选择按键代码，203是左键，205是右键
        for i = 1:length(condition_num)
            % 形成实验条件的矩阵，设点越多判断为时间长，匀减速判断为时间长，判断正确为1，不正确为0
            find_condition = find(trial_cell(:,1)==condition_num(i));
            if find(condition_num(i)==condition_1)
                trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 1;
                trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 0;
            elseif find(condition_num(i) == condition_2)
                trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 0;
                trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 1;
            end
        end
        % 进行卡方检验
        [h1,p1,stats1]=chi2gof(trial_cell(:,3),'expected',[size(trial_cell,1)/2,size(trial_cell,1)/2]);
        % 正确的个数和错误个数与平均数做卡方检验
        if h1==1,issufficient1 = '差异显著';elseif h1==0,issufficient1 = '差异不显著'; end
        if t_nh_i==1,issufficient2_t = '差异显著';elseif t_nh_i==0,issufficient2_t = '差异不显著'; end
        if t_nh_i2==1,issufficient2_t2 = '差异显著';elseif t_nh_i2==0,issufficient2_t2 = '差异不显著'; end
        % 画图
        if isfigure ~= 0
            fig_bar = figure(2);
            hold on
            subplot(6,2,[11,12])
            axis off
            text(0,0.5,['正确次数卡方分析值为：',num2str(stats1.chi2stat),'，',issufficient1,'，p值为：',num2str(p1)],'FontSize',20)
            text(0,0,['正确率t检验值为：',num2str(t_nstats_i.tstat),'，',issufficient2_t,'，p值为：',num2str(t_np_i)],'FontSize',20)
            text(0,-0.5,['真实时间差异的t检验值为：',num2str(t_nstats_i2.tstat),'，',issufficient2_t2,'，p值为：',num2str(t_np_i2)],'FontSize',20)
            set(gca,'color','none')
            hold off
        end
        disp_str1 = sprintf('卡方值为： %.4f\n',stats1.chi2stat);
        disp_str2 = [issufficient1,'\n'];
        disp_str3 = sprintf('p值为： %.4f\n',p1);
        fprintf(disp_str1);fprintf(disp_str2);fprintf(disp_str3);disp(stats1);
    else
        % 真实实际差异的t检验
        rightrate_block_test_n = error.rightrate_block(:,3);%实验条件的正确率
        rightrate_block_test_stan = ones(size(rightrate_block_test_n,1),1).*0.5;
        [t_nh_i2,t_np_i2,t_nci_i2,t_nstats_i2] = ttest2(rightrate_block_test_n,rightrate_block_test_stan);%实验条件的t检验
            %t=1表示在0.05水平上拒绝原假设；%ci是置信区间；
        disp_ttest2 = sprintf('真实时间差异t检验结果p值为： %.4f',t_np_i2);
        fprintf(disp_ttest2);
        
        % 正确的个数和错误个数与平均数做卡方检验
        if t_nh_i2==1,issufficient2_t2 = '差异显著';elseif t_nh_i2==0,issufficient2_t2 = '差异不显著'; end
        % 画图
        if isfigure ~= 0
            fig_bar = figure(2);
            hold on
            subplot(6,1,6)
            axis off
            text(0,-0.5,['真实时间差异的t检验值为：',num2str(t_nstats_i2.tstat),'，',issufficient2_t2,'，p值为：',num2str(t_np_i2)],'FontSize',20)
            set(gca,'color','none')
            hold off
        end
    end
    if save_picture == 1,print(fig_FOC,'-djpeg',title_4);print(fig_bar,'-djpeg',title_1);end
else
    disp('f ~ischar')
    uniform_trial_num = 1;
    FOC_line_y_n = cell(1,8);FOC_line_num = zeros(1,8);POC_7 = zeros(1,6);
    Exp_F_data = cell(1,6);Exp_Chi_data_1 = cell(1,6);Exp_Chi_data_2 = cell(1,6);
    Exp_F_POC = cell(1,6);
    FOC_line_y_n_W = cell(1,6);FOC_line_y_n_M = cell(1,6);
    FOC_line_num_W = zeros(1,6);FOC_line_num_M = zeros(1,6);
    num_right_rate = [];trial_cell = [];
    for i = 1:size(data_file,2)
        %选择多个文件时
        Ss_y= [];count_num = [];test_short_long = [];test_long_short = [];block_trial = [];
        short_long = [];long_short = [];error = struct();error_bar_bar = [];error_bar_FOC = [];
        Condition_POC = [];
        waitbar(i/size(data_file,2));
        disp(['当前打开的文件为：',f(i)]);
        data_name = char(data_file(i));
        data = open(data_name);
        data.behave.trial = sortrows(data.behave.trial,3);%按照block进行排列
        t_num = double(strfind(data_name,'_behave'));
        accelerate_style = str2double(data_name(t_num-1)); %读取 '_behave' 前面的数字，用于判断是匀速运动还是匀变速运动
        subject_name = data_name(t_num-5:t_num-3);
        condition_right = cat(1,data.behave.condition.right);condition_left = cat(1,data.behave.condition.left);
        if accelerate_style == 1
            FOC = 12;
            if uniform_trial_num == 1;uniform_trial = cell(1,1);j = 1;uniform_trial_num = uniform_trial_num + 1;end
            condition_45_1 = [1,2,3,4,5,6];condition_45_2 = [7,10,13,16,19,22];
            condition_90_1 = [7,8,9,10,11,12];condition_90_2 = [1,4,14,17,20,23];
            condition_180_1 = [13,14,15,16,17,18];condition_180_2 = [2,5,8,11,21,24];
            condition_360_1 = [19,20,21,22,23,24];condition_360_2 = [3,6,9,12,15,18];
            Ss_x{1} = [45/3,90/3,180/3,360/3]';Ss_x{1} = log2(Ss_x{1});
            count_num = cat(1,data.behave.condition.count);
            FOC_45 = (sum(condition_left(condition_45_1)./count_num(condition_45_1))+sum(condition_right(condition_45_2)./count_num(condition_45_2)))/FOC;
            FOC_90 = (sum(condition_left(condition_90_1)./count_num(condition_90_1))+sum(condition_right(condition_90_2)./count_num(condition_90_2)))/FOC;
            FOC_180 = (sum(condition_left(condition_180_1)./count_num(condition_180_1))+sum(condition_right(condition_180_2)./count_num(condition_180_2)))/FOC;
            FOC_360 = (sum(condition_left(condition_360_1)./count_num(condition_360_1))+sum(condition_right(condition_360_2)./count_num(condition_360_2)))/FOC;
            Ss_y = [FOC_45,FOC_90,FOC_180,FOC_360];
            less_more = [1,2,3,4,5,6,8,9,11,12,15,18];more_less = [7,10,13,14,16,17,19,20,21,22,23,24];
            test_short_long = [27,28,31,32];test_long_short = [25,26,29,30];
            right_num = sum(condition_right(less_more) + condition_left(more_less));
            all_num = sum(condition_right([less_more,more_less])+condition_left([less_more,more_less]));
            right_rate = right_num/all_num; %以点多的感觉时间长为正确，计算正确率
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率
            
            % 计算标准差
            block_trial = data.behave.trial;
            short_long = [less_more,test_short_long];long_short = [more_less,test_long_short];
            for ii = 1:length(block_trial(:,1))
                if find(short_long == block_trial(ii,1))%后面的时间长
                    if block_trial(ii,2) == 205
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 203
                        block_trial(ii,4) = 0;
                    end
                elseif find(long_short == block_trial(ii,1))%前面的时间长
                    if block_trial(ii,2) == 203
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 205
                        block_trial(ii,4) = 0;
                    end
                end
            end
            data.behave.trial = block_trial;
            for ii = 1:max(data.behave.trial(:,3))
                block_trial_ii = block_trial((block_trial(:,3)==ii),:);

                % 以点多的时间知觉长为真，统计每个block中的正确率
                error.rightrate_block(ii,1) = (sum(block_trial_ii(less_more,4))+sum(block_trial_ii(more_less,4)))/(length(less_more)+length(more_less));
                error.rightrate_block(ii,2) = 1 - error.rightrate_block(ii,1);
                % 真实的时间长度判断在每个block中的正确率
                error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
                error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);

                % 判断不同点数的刺激被选择的频率
                error.FOC_block(ii,1) = (sum(block_trial_ii(condition_45_1,2)==203)+sum(block_trial_ii(condition_45_2,2)==205))/FOC;
                error.FOC_block(ii,2) = (sum(block_trial_ii(condition_90_1,2)==203)+sum(block_trial_ii(condition_90_2,2)==205))/FOC;
                error.FOC_block(ii,3) = (sum(block_trial_ii(condition_180_1,2)==203)+sum(block_trial_ii(condition_180_2,2)==205))/FOC;
                error.FOC_block(ii,4) = (sum(block_trial_ii(condition_360_1,2)==203)+sum(block_trial_ii(condition_360_2,2)==205))/FOC;
            end
            error_bar_bar = std(error.rightrate_block);%正确率的标准差
            error_bar_FOC = std(error.FOC_block);%选择次数的标准差            
            
            % 画图
            if isfigure ~= 0
                % 单个被试的折线图
                fig_FOC = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{1},Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('事件发生频率');ylabel('FOC');
                xticks(Ss_x{1});xticklabels({'15Hz','30Hz','60Hz','120Hz'});
                xlim([min(Ss_x{1})-0.2,max(Ss_x{1})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--实验1 FOC折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);
                % 单个被试的柱状图
                fig_bar = figure;
                set(gcf,'Position',[200,50,1200,700]);
                subplot(6,2,(1:2:9))
                bar([1,2],[right_rate,1-right_rate]);
                hold on
                errorbar([1,2],[right_rate,1-right_rate],error_bar_bar(1:2),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'频率高时间长','频率低时间长'});ylim([0,1]);
                title_1 = [subject_name '--实验1 事件发生频率不同'];
                title(title_1,'FontSize',20);set(gca,'FontSize',15);
                subplot(6,2,(2:2:10))
                bar([1,2],[test_right_rate,1-test_right_rate]);
                hold on
                errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
                title_2 = [subject_name '--实验1 时长不同'];
                title(title_2,'FontSize',20);set(gca,'FontSize',15);
            end
            condition_1 = more_less;condition_2 = less_more;
            if isfigure ~= 0
                % 画每个实验条件选择情况的内容
                text_data = {'前后：事件发生频率高的在前还是在后/时间长的在前还是在后';...
                    ' 1 :45 - 90,  顺,后,  2 :45 -180, 顺,后,  3 :45 -360, 顺,后,  4 :45 - 90,  逆,后,  5 :45 -180,逆,后,  6 :45 -360, 逆,后';...
                    ' 7 :45 - 90,  顺,前,  8 :90 -180, 顺,后,  9 :90 -360, 顺,后, 10:45 - 90,  逆,前, 11:90 -180,逆,后, 12:90 -360, 逆,后';...
                    '13:45 -180, 顺,前, 14:90 -180, 顺,前, 15:180-360,顺,后, 16:45 -180, 逆,前, 17:90 -180,逆,前, 18:180-360,逆,后';...
                    '19:45 -360, 顺,前, 20:90 -360, 顺,前, 21:180-360,顺,前, 22:45 -360, 逆,前, 23:90 -360,逆,前, 24:180-360,逆,前';...
                    '25:180-300,顺,前, 26:360-150,顺,前, 27:360-150,顺,后, 28:180-300,顺,后';...
                    '29:180-300,逆,前, 30:360-150,逆,前, 31:360-150,逆,后, 32:180-300,逆,后'};
                title_text = [subject_name '--实验1 选择情况表'];

                % 画每个实验条件的旋转方向和先后顺序的效应
                DCRT_draw_condition = {[1,4,7,10];[2,5,13,16];[3,6,19,22];[8,11,14,17];[9,12,20,23];[15,18,21,24]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
                DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
                DCRT_x_label = {'45-90选择正确率';'45-180选择正确率';'45-360选择正确率';'90-180选择正确率';'90-360选择正确率';'180-360选择正确率'};
                DCRT_x_ticklabels = {{'45-90顺','45-90逆','90-45顺','90-45逆'};{'45-180顺','45-180逆','180-45顺','180-45逆'};{'45-360顺','45-360逆','360-45顺','360-45逆'};...
                    {'90-180顺','90-180逆','180-90顺','180-90逆'};{'90-360顺','90-360逆','360-90顺','360-90逆'};{'180-360顺','180-360逆','360-180顺','360-180逆'}};
                DCRT_title_name = [subject_name '--实验1 旋转方向和先后顺序的效应'];
                
                % 画每个实验条件的主效应
                DCF_draw_condition ={{[1,2,3],[1,8,9],[2,8,15],[3,9,15]};{[4,5,6],[4,11,12],[5,11,18],[6,12,18]};{[7,13,19],[7,14,20],[13,14,21],[19,20,21]};{[10,16,22],[10,17,23],[16,23,24],[22,23,24]};...
                    {1,4,7,10,2,5,13,16,3,6,19,22};{7,10,1,4,8,11,14,17,9,12,20,23};{13,16,2,5,14,17,8,11,15,18,21,24};{19,22,3,6,20,23,9,12,21,24,15,18}};
                    %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 45-90-180-360
                    %{[45相关的实验条件];[90相关的实验条件];[180相关的实验条件];[360相关的实验条件]}
                DCF_first_second = {{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};...
                    {1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2}};
                DCF_x_label = {'顺时针-后一个事件发生频率高';'逆时针-后一个事件发生频率高';'顺时针-前一个事件发生频率高';'逆时针-前一个事件发生频率高';...
                    '15Hz不同条件被选择的概率';'30Hz不同条件被选择的概率';'60Hz不同条件被选择的概率';'120Hz不同条件被选择的概率'};
                DCF_x_ticklabels = {{'45','90','180','360'};{'45','90','180','360'};{'45','90','180','360'};{'45','90','180','360'};...
                    {'45-90顺','45-90逆','90-45顺','90-45逆','45-180顺','45-180逆','180-45顺','180-45逆','45-360顺','45-360逆','360-45顺','360-45逆'};...
                    {'90-45顺','90-45逆','45-90顺','45-90逆','90-180顺','90-180逆','180-90顺','180-90逆','90-360顺','90-360逆','360-90顺','360-90逆'};...
                    {'180-45顺','180-45逆','45-180顺','45-180逆','180-90顺','180-90逆','90-180顺','90-180逆','180-360顺','180-360逆','360-180顺','360-180逆'};...
                    {'360-45顺','360-45逆','45-360顺','45-360逆','360-90顺','360-90逆','90-360顺','90-360逆','360-180顺','360-180逆','180-360顺','180-360逆'}};
                DCF_title_name = [subject_name '--实验1 事件发生频率的主效应'];
            end
            % 保存曲线的数据
            FOC_line_y_n{1} = [FOC_line_y_n{1};Ss_y];FOC_line_num(1) = FOC_line_num(1) + 1;%保存下每个被试每种条件的选择频率
            condition_seq = [sum(condition_left([1,2,3,8,9,15])),sum(condition_right([7,13,19,14,20,21])),...
                sum(condition_left([4,5,6,11,12,18])),sum(condition_right([10,16,22,17,23,24]))]./...
                [sum(count_num([1,2,3,8,9,15])),sum(count_num([7,13,19,14,20,21])),...
                sum(count_num([4,5,6,11,12,18])),sum(count_num([10,16,22,17,23,24]))];
            % 选择条件编号更小的那个的频数
            Exp_F_data{1} = [Exp_F_data{1};condition_seq];
            %[顺后，顺前，逆后，逆前]
            C_15_30_L = [1,4];C_15_30_R = [7,10];      % 15Hz 和 30Hz 比较选择 15Hz 的情况
            C_15_60_L = [2,5];C_15_60_R = [13,16];     % 15Hz 和 60Hz 比较选择 15Hz 的情况
            C_15_120_L = [3,6];C_15_120_R = [19,22];   % 15Hz 和 120Hz 比较选择 15Hz 的情况
            C_30_15_L = [7,10];C_30_15_R = [1,4];      % 30Hz 和 15Hz 比较选择 30Hz 的情况
            C_30_60_L = [8,11];C_30_60_R = [14,17];    % 30Hz 和 60Hz 比较选择 30Hz 的情况
            C_30_120_L = [9,12];C_30_120_R = [20,23];  % 30Hz 和 120Hz 比较选择 30Hz 的情况
            C_60_15_L = [13,16];C_60_15_R = [2,5];     % 60Hz 和 15Hz 比较选择 60Hz 的情况
            C_60_30_L = [14,17];C_60_30_R = [8,11];    % 60Hz 和 30Hz 比较选择 60Hz 的情况
            C_60_120_L = [15,18];C_60_120_R = [21,24]; % 60Hz 和 120Hz 比较选择 60Hz 的情况
            C_120_15_L = [19,22];C_120_15_R = [3,6];   % 120Hz 和 15Hz 比较选择 120Hz 的情况
            C_120_30_L = [20,23];C_120_30_R = [9,12];  % 120Hz 和 30Hz 比较选择 120Hz 的情况
            C_120_60_L = [21,24];C_120_60_R = [15,18]; % 120Hz 和 60Hz 比较选择 120Hz 的情况
            Condition_POC = [(sum(condition_left(C_15_30_L))+sum(condition_right(C_15_30_R)))/(sum(count_num(C_15_30_L))+sum(count_num(C_15_30_R))),...
                (sum(condition_left(C_15_60_L))+sum(condition_right(C_15_60_R)))/(sum(count_num(C_15_60_L))+sum(count_num(C_15_60_R))),...
                (sum(condition_left(C_15_120_L))+sum(condition_right(C_15_120_R)))/(sum(count_num(C_15_120_L))+sum(count_num(C_15_120_R))),...
                (sum(condition_left(C_30_15_L))+sum(condition_right(C_30_15_R)))/(sum(count_num(C_30_15_L))+sum(count_num(C_30_15_R))),...
                (sum(condition_left(C_30_60_L))+sum(condition_right(C_30_60_R)))/(sum(count_num(C_30_60_L))+sum(count_num(C_30_60_R))),...
                (sum(condition_left(C_30_120_L))+sum(condition_right(C_30_120_R)))/(sum(count_num(C_30_120_L))+sum(count_num(C_30_120_R))),...
                (sum(condition_left(C_60_15_L))+sum(condition_right(C_60_15_R)))/(sum(count_num(C_60_15_L))+sum(count_num(C_60_15_R))),...
                (sum(condition_left(C_60_30_L))+sum(condition_right(C_60_30_R)))/(sum(count_num(C_60_30_L))+sum(count_num(C_60_30_R))),...
                (sum(condition_left(C_60_120_L))+sum(condition_right(C_60_120_R)))/(sum(count_num(C_60_120_L))+sum(count_num(C_60_120_R))),...
                (sum(condition_left(C_120_15_L))+sum(condition_right(C_120_15_R)))/(sum(count_num(C_120_15_L))+sum(count_num(C_120_15_R))),...
                (sum(condition_left(C_120_30_L))+sum(condition_right(C_120_30_R)))/(sum(count_num(C_120_30_L))+sum(count_num(C_120_30_R))),...
                (sum(condition_left(C_120_60_L))+sum(condition_right(C_120_60_R)))/(sum(count_num(C_120_60_L))+sum(count_num(C_120_60_R))),...
                ];
            Exp_F_POC{1} = [Exp_F_POC{1};Condition_POC];% 两两条件之间比较的POC
            
            condition_Chi = [sum(condition_left([1,2,3,8,9,15])),sum(condition_right([7,13,19,14,20,21]));...
                sum(condition_left([4,5,6,11,12,18])),sum(condition_right([10,16,22,17,23,24]))]./...
                [sum(count_num([1,2,3,8,9,15])),sum(count_num([7,13,19,14,20,21]));...
                sum(count_num([4,5,6,11,12,18])),sum(count_num([10,16,22,17,23,24]))];
            Exp_Chi_data_1{1} = [Exp_Chi_data_1{1};condition_Chi'];%[顺后，逆后；顺前，逆前]
            Exp_Chi_data_2{1} = [Exp_Chi_data_2{1};condition_Chi];%[顺后，顺前；逆后，逆前]
            num_right_rate = [num_right_rate;right_rate];% 保存下每个被试的正确率(以数量多的刺激被选择为正确)
            % 跟性别有关的数据保存
            if data.behave.gender == 0
                FOC_line_y_n_W{1} = [FOC_line_y_n_W{1};Ss_y];FOC_line_num_W(1) = FOC_line_num_W(1) + 1;
            else
                FOC_line_y_n_M{1} = [FOC_line_y_n_M{1};Ss_y];FOC_line_num_M(1) = FOC_line_num_M(1) + 1;
            end
            
        elseif accelerate_style == 2
            FOC = 12;
            % condition_2_1_1：其中，2表示第二个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
            condition_2_1_1 = [1,2,3,7,8,9];condition_2_1_2 = [13,14,15,19,20,21];% 1：120个位置呈现1次
            condition_2_2_1 = [4,5,10,11,13,19];condition_2_2_2 = [1,7,16,17,22,23];% 2：120个位置呈现3次
            condition_2_3_1 = [6,12,14,16,20,22];condition_2_3_2 = [2,4,8,10,18,24];% 3：120个位置呈现3次不同颜色
            condition_2_4_1 = [15,17,18,21,23,24];condition_2_4_2 = [3,5,6,9,11,12];% 4：360个位置
            Ss_x{2} = [1,2,3,4]'; % 1:40个位置呈现1次；2：40个位置呈现3次；3：40个位置呈现3次不同颜色；4：120个位置
            count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
            FOC_1 = (sum(condition_left(condition_2_1_1)./count_num(condition_2_1_1))+sum(condition_right(condition_2_1_2)./count_num(condition_2_1_2)))/FOC;
            FOC_2 = (sum(condition_left(condition_2_2_1)./count_num(condition_2_2_1))+sum(condition_right(condition_2_2_2)./count_num(condition_2_2_2)))/FOC;
            FOC_3 = (sum(condition_left(condition_2_3_1)./count_num(condition_2_3_1))+sum(condition_right(condition_2_3_2)./count_num(condition_2_3_2)))/FOC;
            FOC_4 = (sum(condition_left(condition_2_4_1)./count_num(condition_2_4_1))+sum(condition_right(condition_2_4_2)./count_num(condition_2_4_2)))/FOC;
            Ss_y = [FOC_1,FOC_2,FOC_3,FOC_4];
            test_short_long = [27,28,31,32];test_long_short = [25,26,29,30];
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率

            % 计算标准差
            block_trial = data.behave.trial;
            short_long = test_short_long;long_short = test_long_short;
            for ii = 1:length(block_trial(:,1))
                if find(short_long == block_trial(ii,1))%后面的时间长
                    if block_trial(ii,2) == 205
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 203
                        block_trial(ii,4) = 0;
                    end
                elseif find(long_short == block_trial(ii,1))%前面的时间长
                    if block_trial(ii,2) == 203
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 205
                        block_trial(ii,4) = 0;
                    end
                else
                    block_trial(ii,4) = nan;
                end
            end
            data.behave.trial = block_trial;
            for ii = 1:max(data.behave.trial(:,3))
                block_trial_ii = block_trial((block_trial(:,3)==ii),:);
                % 真实的时间长度判断在每个block中的正确率
                error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
                error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);

                % 判断不同点数的刺激被选择的频率
                error.FOC_block(ii,1) = (sum(block_trial_ii(condition_2_1_1,2)==203)+sum(block_trial_ii(condition_2_1_2,2)==205))/FOC;
                error.FOC_block(ii,2) = (sum(block_trial_ii(condition_2_2_1,2)==203)+sum(block_trial_ii(condition_2_2_2,2)==205))/FOC;
                error.FOC_block(ii,3) = (sum(block_trial_ii(condition_2_3_1,2)==203)+sum(block_trial_ii(condition_2_3_2,2)==205))/FOC;
                error.FOC_block(ii,4) = (sum(block_trial_ii(condition_2_4_1,2)==203)+sum(block_trial_ii(condition_2_4_2,2)==205))/FOC;
            end
            error_bar_bar = std(error.rightrate_block);%正确率的标准差
            error_bar_FOC = std(error.FOC_block);%选择次数的标准差
            % 画图
            if isfigure ~= 0
                % 画折线图
                fig_FOC = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{2},Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('事件条件');ylabel('FOC');
                xticks(Ss_x{2});xticklabels({'呈现1次','呈现3次','呈现3次颜色变化','位置3倍'});
                xlim([min(Ss_x{2})-0.2,max(Ss_x{2})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--实验2 FOC折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);

                % 画柱状图
                fig_bar = figure;
                subplot(6,1,(1:5))
                set(gcf,'Position',[200,50,1200,700]);
                bar([1,2],[test_right_rate,1-test_right_rate]);
                hold on
                title_1 = [subject_name '--实验2 事件不同'];
                errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
                title_2 = [subject_name '--实验2 时长不同'];
                title(title_2,'FontSize',20);set(gca,'FontSize',15);
                hold off
            end
            if isfigure ~= 0
                % 画每个实验条件选择情况的内容
                text_data = {'1:60位置呈现1次， 2:60位置呈现3次， 3:60位置颜色变化， 4:120位置';...
                    '前后：数字大的实验条件在前还是在后/时间长的在前还是在后';...
                    ' 1 :1-2,顺,后,       2 :1-3,顺,后,      3 :1-4,顺,后,       4 :2-3,顺,后,       5 :2-4,顺,后,       6 :3-4,顺,后';...
                    ' 7 :1-2,逆,后,       8 :1-3,逆,后,      9 :1-4,逆,后,      10:2-3,逆,后,      11:2-4,逆,后,      12:3-4,逆,后';...
                    '13:1-2,顺,前,      14:1-3,顺,前,     15:1-4,顺,前,      16:2-3,顺,前,      17:2-4,顺,前,      18:3-4,顺,前';...
                    '19:1-2,逆,前,      20:1-3,逆,前,     21:1-4,逆,前,      22:2-3,逆,前,      23:2-4,逆,前,      24:3-4,逆,前';...
                    '25:2-4,顺,后/前, 26:2-4,顺,前/前, 27:2-4,顺,后/后, 28:2-4,顺,前/后';...
                    '29:2-4,顺,后/前, 30:2-4,顺,前/前, 31:2-4,顺,后/后, 32:2-4,顺,前/后'};
                title_text = [subject_name '--实验2 选择情况表'];
                
                % 画每个实验条件的旋转方向和先后顺序的效应
                DCRT_draw_condition = {[1,7,13,19];[2,8,14,20];[3,9,15,21];[4,10,16,22];[5,11,17,23];[6,12,18,24]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
                DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
                DCRT_x_label = {'60位置呈现1次-60位置呈现3次选择正确率';'60位置呈现1次-60位置颜色变化选择正确率';'60位置呈现1次-120位置选择正确率';...
                    '60位置呈现3次-60位置颜色变化选择正确率';'60位置呈现3次-120位置选择正确率';'60位置颜色变化-120位置选择正确率'};
                DCRT_x_ticklabels = {{'1-2顺','1-2逆','2-1顺','2-1逆'};{'1-3顺','1-3逆','3-1顺','3-1逆'};{'1-4顺','1-4逆','4-1顺','4-1逆'};...
                    {'2-3顺','2-3逆','3-2顺','3-2逆'};{'2-4顺','2-4逆','4-2顺','4-2逆'};{'3-4顺','3-4逆','4-3顺','4-3逆'}};
                DCRT_title_name = [subject_name '--实验2 旋转方向和先后顺序的效应'];

                % 画每个实验条件的主效应
                DCF_draw_condition ={{[1,2,3],[1,4,5],[2,4,6],[3,5,6]};{[7,8,9],[7,10,11],[8,10,12],[9,11,12]};{[13,14,15],[13,16,17],[14,16,18],[15,17,18]};{[19,20,21],[19,22,23],[20,22,24],[21,23,24]};...
                    {1,7,13,19,2,8,14,20,3,9,15,21};{13,19,1,7,4,10,16,22,5,11,17,23};{14,20,2,8,16,22,4,10,6,12,18,24};{15,21,3,9,17,23,5,11,18,24,6,12}};
                    %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 1-2-3-4 这四种实验条件
                    %{[45相关的实验条件];[90相关的实验条件];[180相关的实验条件];[360相关的实验条件]}
                DCF_first_second = {{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[1,1,1],[2,1,1],[2,2,1],[2,2,2]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};{[2,2,2],[1,2,2],[1,1,2],[1,1,1]};...
                    {1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2,1,1,2,2}};
                DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                    '条件1不同情况的被选择概率';'条件2不同情况的被选择概率';'条件3不同情况的被选择概率';'条件4不同情况的被选择概率'};
                DCF_x_ticklabels = {{'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                    {'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                    {'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                    {'60位置呈现1次','60位置呈现3次','60位置颜色变化','120位置'};...
                    {'1-2顺','1-2逆','2-1顺','2-1逆','1-3顺','1-3逆','3-1顺','3-1逆','1-4顺','1-4逆','4-1顺','4-1逆'};...
                    {'2-1顺','2-1逆','1-2顺','1-2逆','2-3顺','2-3逆','3-2顺','3-2逆','2-4顺','2-4逆','4-2顺','4-2逆'};...
                    {'3-1顺','3-1逆','1-3顺','1-3逆','3-2顺','3-2逆','2-3顺','2-3逆','3-4顺','3-4逆','4-3顺','4-3逆'};...
                    {'4-1顺','4-1逆','1-4顺','1-4逆','4-2顺','4-2逆','2-4顺','2-4逆','4-3顺','4-3逆','3-4顺','3-4逆'}};
                DCF_title_name = [subject_name '--实验2 实验条件的主效应'];
            end
             % 保存曲线的数据
            FOC_line_y_n{2} = [FOC_line_y_n{2};Ss_y];FOC_line_num(2) = FOC_line_num(2) + 1;%保存下每个被试每种条件的选择频率
            condition_seq = [sum(condition_left(1:6)),sum(condition_right(13:18)),sum(condition_left(7:12)),sum(condition_right(19:24))]./...
                [sum(count_num(1:6)),sum(count_num(13:18)),sum(count_num(7:12)),sum(count_num(19:24))];
            % 选择条件编号更小的那个的频数
            Exp_F_data{2} = [Exp_F_data{2};condition_seq];%[顺后，顺前，逆后，逆前]
            
            C_1_2_L = [1,7];C_1_2_R = [13,19];      % 单次 和 重复 比较选择 单次 的情况
            C_1_3_L = [2,8];C_1_3_R = [14,20];      % 单次 和 颜色 比较选择 单次 的情况
            C_1_4_L = [3,9];C_1_4_R = [15,21];      % 单次 和 位置 比较选择 单次 的情况
            C_2_1_L = [13,19];C_2_1_R = [1,7];      % 重复 和 单次 比较选择 重复 的情况
            C_2_3_L = [4,10];C_2_3_R = [16,22];     % 重复 和 颜色 比较选择 重复 的情况
            C_2_4_L = [5,11];C_2_4_R = [17,23];     % 重复 和 位置 比较选择 重复 的情况
            C_3_1_L = [14,20];C_3_1_R = [2,8];      % 颜色 和 单次 比较选择 颜色 的情况
            C_3_2_L = [16,22];C_3_2_R = [4,10];     % 颜色 和 重复 比较选择 颜色 的情况
            C_3_4_L = [6,12];C_3_4_R = [18,24];     % 颜色 和 位置 比较选择 颜色 的情况
            C_4_1_L = [15,21];C_4_1_R = [3,9];      % 位置 和 单次 比较选择 位置 的情况
            C_4_2_L = [17,23];C_4_2_R = [5,11];     % 位置 和 重复 比较选择 位置 的情况
            C_4_3_L = [18,24];C_4_3_R = [6,12];     % 位置 和 颜色 比较选择 位置 的情况
            Condition_POC = [(sum(condition_left(C_1_2_L))+sum(condition_right(C_1_2_R)))/(sum(count_num(C_1_2_L))+sum(count_num(C_1_2_R))),...
                (sum(condition_left(C_1_3_L))+sum(condition_right(C_1_3_R)))/(sum(count_num(C_1_3_L))+sum(count_num(C_1_3_R))),...
                (sum(condition_left(C_1_4_L))+sum(condition_right(C_1_4_R)))/(sum(count_num(C_1_4_L))+sum(count_num(C_1_4_R))),...
                (sum(condition_left(C_2_1_L))+sum(condition_right(C_2_1_R)))/(sum(count_num(C_2_1_L))+sum(count_num(C_2_1_R))),...
                (sum(condition_left(C_2_3_L))+sum(condition_right(C_2_3_R)))/(sum(count_num(C_2_3_L))+sum(count_num(C_2_3_R))),...
                (sum(condition_left(C_2_4_L))+sum(condition_right(C_2_4_R)))/(sum(count_num(C_2_4_L))+sum(count_num(C_2_4_R))),...
                (sum(condition_left(C_3_1_L))+sum(condition_right(C_3_1_R)))/(sum(count_num(C_3_1_L))+sum(count_num(C_3_1_R))),...
                (sum(condition_left(C_3_2_L))+sum(condition_right(C_3_2_R)))/(sum(count_num(C_3_2_L))+sum(count_num(C_3_2_R))),...
                (sum(condition_left(C_3_4_L))+sum(condition_right(C_3_4_R)))/(sum(count_num(C_3_4_L))+sum(count_num(C_3_4_R))),...
                (sum(condition_left(C_4_1_L))+sum(condition_right(C_4_1_R)))/(sum(count_num(C_4_1_L))+sum(count_num(C_4_1_R))),...
                (sum(condition_left(C_4_2_L))+sum(condition_right(C_4_2_R)))/(sum(count_num(C_4_2_L))+sum(count_num(C_4_2_R))),...
                (sum(condition_left(C_4_3_L))+sum(condition_right(C_4_3_R)))/(sum(count_num(C_4_3_L))+sum(count_num(C_4_3_R))),...
                ];
            Exp_F_POC{2} = [Exp_F_POC{2};Condition_POC];% 两两条件之间比较的POC
            
            
            condition_Chi = [sum(condition_left(1:6)),sum(condition_right(13:18));sum(condition_left(7:12)),sum(condition_right(19:24))]./...
                [sum(count_num(1:6)),sum(count_num(13:18));sum(count_num(7:12)),sum(count_num(19:24))];
            Exp_Chi_data_1{2} = [Exp_Chi_data_1{2};condition_Chi'];%[顺后，逆后;顺前，逆前]
            Exp_Chi_data_2{2} = [Exp_Chi_data_2{2};condition_Chi];%[顺后，顺前;逆后，逆前]
            if data.behave.gender == 0
                FOC_line_y_n_W{2} = [FOC_line_y_n_W{2};Ss_y];FOC_line_num_W(2) = FOC_line_num_W(2) + 1;
            else
                FOC_line_y_n_M{2} = [FOC_line_y_n_M{2};Ss_y];FOC_line_num_M(2) = FOC_line_num_M(2) + 1;
            end
            
        elseif accelerate_style == 3
            FOC = 8;
             % condition_3_1_1：其中，3表示第二个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
            condition_3_1_1 = [1,2,4,5];condition_3_1_2 = [7,8,10,11];% 1：匀加速
            condition_3_2_1 = [3,6,7,10];condition_3_2_2 = [1,4,9,12];% 2：匀减速
            condition_3_3_1 = [8,9,11,12];condition_3_3_2 = [2,3,5,6];% 3：匀速
            Ss_x{3} = [1,2,3]'; % 1:匀加速；2：匀减速；3：匀速
            count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
            FOC_1 = (sum(condition_left(condition_3_1_1)./count_num(condition_3_1_1))+sum(condition_right(condition_3_1_2)./count_num(condition_3_1_2)))/FOC;
            FOC_2 = (sum(condition_left(condition_3_2_1)./count_num(condition_3_2_1))+sum(condition_right(condition_3_2_2)./count_num(condition_3_2_2)))/FOC;
            FOC_3 = (sum(condition_left(condition_3_3_1)./count_num(condition_3_3_1))+sum(condition_right(condition_3_3_2)./count_num(condition_3_3_2)))/FOC;
            Ss_y = [FOC_1,FOC_2,FOC_3];
            test_long_short = [13,14];test_short_long = [15,16];
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率

            % 计算标准差
            block_trial = data.behave.trial;
            short_long = test_short_long;long_short = test_long_short;
            for ii = 1:length(block_trial(:,1))
                if find(short_long == block_trial(ii,1))%后面的时间长
                    if block_trial(ii,2) == 205
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 203
                        block_trial(ii,4) = 0;
                    end
                elseif find(long_short == block_trial(ii,1))%前面的时间长
                    if block_trial(ii,2) == 203
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 205
                        block_trial(ii,4) = 0;
                    end
                else
                    block_trial(ii,4) = nan;
                end
            end
            data.behave.trial = block_trial;
            for ii = 1:max(data.behave.trial(:,3))
                block_trial_ii = block_trial((block_trial(:,3)==ii),:);

                % 真实的时间长度判断在每个block中的正确率
                error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
                error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
                % 判断不同点数的刺激被选择的频率
                error.FOC_block(ii,1) = (sum(block_trial_ii(condition_3_1_1,2)==203)+sum(block_trial_ii(condition_3_1_2,2)==205))/FOC;
                error.FOC_block(ii,2) = (sum(block_trial_ii(condition_3_2_1,2)==203)+sum(block_trial_ii(condition_3_2_2,2)==205))/FOC;
                error.FOC_block(ii,3) = (sum(block_trial_ii(condition_3_3_1,2)==203)+sum(block_trial_ii(condition_3_3_2,2)==205))/FOC;
            end
            error_bar_bar = std(error.rightrate_block);%正确率的标准差
            error_bar_FOC = std(error.FOC_block);%选择次数的标准差
            % 画图
            if isfigure ~= 0
                % 画折线图
                fig_FOC = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{3},Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('速度变化情况');ylabel('FOC');
                xticks(Ss_x{3});xticklabels({'匀加速','匀减速','匀速'});
                xlim([min(Ss_x{3})-0.2,max(Ss_x{3})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--实验3 FOC折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);

                % 画柱状图
                fig_bar = figure;
                subplot(6,1,(1:5))
                set(gcf,'Position',[200,50,1200,700]);
                bar([1,2],[test_right_rate,1-test_right_rate]);
                hold on
                title_1 = [subject_name '--实验3 速度状态不同'];
                errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
                title_2 = [subject_name '--实验3 时长不同'];
                title(title_2,'FontSize',20);set(gca,'FontSize',15);
                hold off
            end
            if isfigure ~= 0
                % 画每个实验条件选择情况的内容
                text_data = {'按照 加速-减速-匀速 的顺序判断前后';...
                    '前后：越往后的实验条件在前还是在后/时间长的在前还是在后';...
                    ' 1 :加-减,顺,后,       2 :加-匀,顺,后,      3 :减-匀,顺,后';...
                    ' 4 :加-减,逆,后,       5 :加-匀,逆,后,      6 :减-匀,逆,后';...
                    ' 7 :加-减,顺,前,       8 :加-匀,顺,前,      9 :减-匀,顺,前';...
                    '10:加-减,逆,前,      11:加-匀,逆,前,    12 :减-匀,逆,前';...
                    '13:加-减,顺,后/前, 14:加-减,顺,前/前';...
                    '15:加-减,顺,后/后, 16:加-减,顺,前/后'};
                title_text = [subject_name '--实验3 选择情况表'];
                
                % 画每个实验条件的旋转方向和先后顺序的效应
                DCRT_draw_condition = {[1,4,7,10];[2,5,8,11];[3,6,9,12]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
                DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
                DCRT_x_label = {'加速-减速选择正确率';'加速-匀速选择正确率';'减速-匀速选择正确率';};
                DCRT_x_ticklabels = {{'加-减-顺','加-减-逆','减-加-顺','减-加-逆'};...
                    {'加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};{'减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};};
                DCRT_title_name = [subject_name '--实验3 旋转方向和先后顺序的效应'];

                % 画每个实验条件的主效应
                DCF_draw_condition ={{[1,2],[1,3],[2,3]};{[4,5],[4,6],[5,6]};{[7,8],[7,9],[8,9]};{[10,11],[10,12],[11,12]};...
                    {1,4,7,10,2,5,8,11};{7,10,1,4,3,6,9,12};{8,11,2,5,9,12,3,6}};
                    %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 加速-减速-匀速 这三种实验条件
                    %{[加速相关的实验条件];[减速相关的实验条件];[匀速相关的实验条件]}
                DCF_first_second = {{[1,1],[2,1],[2,2]};{[1,1],[2,1],[2,2]};{[2,2],[1,2],[1,1]};{[2,2],[1,2],[1,1]};...
                    {1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2}};
                DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                    '加速不同情况的被选择概率';'减速不同情况的被选择概率';'匀速不同情况的被选择概率'};
                DCF_x_ticklabels = {{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};...
                    {'加-减-顺','加-减-逆','减-加-顺','减-加-逆','加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};...
                    {'减-加-顺','减-加-逆','加-减-顺','加-减-逆','减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};...
                    {'匀-加-顺','匀-加-逆','加-匀-顺','加-匀-逆','匀-减-顺','匀-减-逆','减-匀-顺','减-匀-逆'}};
                DCF_title_name = [subject_name '--实验3 实验条件的主效应'];
            end
            % 保存曲线的数据
            FOC_line_y_n{3} = [FOC_line_y_n{3};Ss_y];FOC_line_num(3) = FOC_line_num(3) + 1;%保存下每个被试每种条件的选择频率
            condition_seq = [sum(condition_left(1:3)),sum(condition_right(7:9)),sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9)),sum(count_num(4:6)),sum(count_num(10:12))];
            % 选择条件编号更小的那个的频数
            Exp_F_data{3} = [Exp_F_data{3};condition_seq];%[顺后，顺前，逆后，逆前]
            
            C_1_2_L = [1,4];C_1_2_R = [7,10];      % 加速 和 减速 比较选择 加速 的情况
            C_1_3_L = [2,5];C_1_3_R = [8,11];      % 加速 和 匀速 比较选择 加速 的情况
            C_2_1_L = [7,10];C_2_1_R = [1,4];      % 减速 和 加速 比较选择 减速 的情况
            C_2_3_L = [3,6];C_2_3_R = [9,12];      % 减速 和 匀速 比较选择 减速 的情况
            C_3_1_L = [8,11];C_3_1_R = [2,5];      % 匀速 和 加速 比较选择 匀速 的情况
            C_3_2_L = [9,12];C_3_2_R = [3,6];      % 匀速 和 减速 比较选择 匀速 的情况
            Condition_POC = [(sum(condition_left(C_1_2_L))+sum(condition_right(C_1_2_R)))/(sum(count_num(C_1_2_L))+sum(count_num(C_1_2_R))),...
                (sum(condition_left(C_1_3_L))+sum(condition_right(C_1_3_R)))/(sum(count_num(C_1_3_L))+sum(count_num(C_1_3_R))),...
                (sum(condition_left(C_2_1_L))+sum(condition_right(C_2_1_R)))/(sum(count_num(C_2_1_L))+sum(count_num(C_2_1_R))),...
                (sum(condition_left(C_2_3_L))+sum(condition_right(C_2_3_R)))/(sum(count_num(C_2_3_L))+sum(count_num(C_2_3_R))),...
                (sum(condition_left(C_3_1_L))+sum(condition_right(C_3_1_R)))/(sum(count_num(C_3_1_L))+sum(count_num(C_3_1_R))),...
                (sum(condition_left(C_3_2_L))+sum(condition_right(C_3_2_R)))/(sum(count_num(C_3_2_L))+sum(count_num(C_3_2_R))),...
                ];
            Exp_F_POC{3} = [Exp_F_POC{3};Condition_POC];% 两两条件之间比较的POC
            
            condition_Chi = [sum(condition_left(1:3)),sum(condition_right(7:9));sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9));sum(count_num(4:6)),sum(count_num(10:12))];
            Exp_Chi_data_1{3} = [Exp_Chi_data_1{3};condition_Chi'];%[顺后，逆后;顺前，逆前]
            Exp_Chi_data_2{3} = [Exp_Chi_data_2{3};condition_Chi];%[顺后，顺前;逆后，逆前]
            if data.behave.gender == 0
                FOC_line_y_n_W{3} = [FOC_line_y_n_W{3};Ss_y];FOC_line_num_W(3) = FOC_line_num_W(3) + 1;
            else
                FOC_line_y_n_M{3} = [FOC_line_y_n_M{3};Ss_y];FOC_line_num_M(3) = FOC_line_num_M(3) + 1;
            end
            
        elseif accelerate_style == 4
            FOC = 8;
             % condition_4_1_1：其中，3表示第二个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
            condition_4_1_1 = [1,2,4,5];condition_4_1_2 = [7,8,10,11];% 1：先加速后减速
            condition_4_2_1 = [3,6,7,10];condition_4_2_2 = [1,4,9,12];% 2：先减速后加速
            condition_4_3_1 = [8,9,11,12];condition_4_3_2 = [2,3,5,6];% 3：匀速
            Ss_x{4} = [1,2,3]'; % 1:先加速后减速；2：先减速后加速；3：匀速
            count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
            FOC_1 = (sum(condition_left(condition_4_1_1)./count_num(condition_4_1_1))+sum(condition_right(condition_4_1_2)./count_num(condition_4_1_2)))/FOC;
            FOC_2 = (sum(condition_left(condition_4_2_1)./count_num(condition_4_2_1))+sum(condition_right(condition_4_2_2)./count_num(condition_4_2_2)))/FOC;
            FOC_3 = (sum(condition_left(condition_4_3_1)./count_num(condition_4_3_1))+sum(condition_right(condition_4_3_2)./count_num(condition_4_3_2)))/FOC;
            Ss_y = [FOC_1,FOC_2,FOC_3];
            test_long_short = [13,14];test_short_long = [15,16];
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率

            % 计算标准差
            block_trial = data.behave.trial;
            short_long = test_short_long;long_short = test_long_short;
            for ii = 1:length(block_trial(:,1))
                if find(short_long == block_trial(ii,1))%后面的时间长
                    if block_trial(ii,2) == 205
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 203
                        block_trial(ii,4) = 0;
                    end
                elseif find(long_short == block_trial(ii,1))%前面的时间长
                    if block_trial(ii,2) == 203
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 205
                        block_trial(ii,4) = 0;
                    end
                else
                    block_trial(ii,4) = nan;
                end
            end
            data.behave.trial = block_trial;
            for ii = 1:max(data.behave.trial(:,3))
                block_trial_ii = block_trial((block_trial(:,3)==ii),:);

                % 真实的时间长度判断在每个block中的正确率
                error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
                error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
                % 判断不同点数的刺激被选择的频率
                error.FOC_block(ii,1) = (sum(block_trial_ii(condition_4_1_1,2)==203)+sum(block_trial_ii(condition_4_1_2,2)==205))/FOC;
                error.FOC_block(ii,2) = (sum(block_trial_ii(condition_4_2_1,2)==203)+sum(block_trial_ii(condition_4_2_2,2)==205))/FOC;
                error.FOC_block(ii,3) = (sum(block_trial_ii(condition_4_3_1,2)==203)+sum(block_trial_ii(condition_4_3_2,2)==205))/FOC;
            end
            error_bar_bar = std(error.rightrate_block);%正确率的标准差
            error_bar_FOC = std(error.FOC_block);%选择次数的标准差
            % 画图
            if isfigure ~= 0
                % 画折线图
                fig_FOC = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{4},Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('速度变化情况');ylabel('FOC');
                xticks(Ss_x{4});xticklabels({'先加速后减速','先减速后加速','匀速'});
                xlim([min(Ss_x{4})-0.2,max(Ss_x{4})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--实验4 FOC折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);

                % 画柱状图
                fig_bar = figure;
                subplot(6,1,(1:5))
                set(gcf,'Position',[200,50,1200,700]);
                bar([1,2],[test_right_rate,1-test_right_rate]);
                hold on
                title_1 = [subject_name '--实验4 速度变化不同'];
                errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
                title_2 = [subject_name '--实验4 时长不同'];
                title(title_2,'FontSize',20);set(gca,'FontSize',15);
                hold off
            end
            if isfigure ~= 0
                % 画每个实验条件选择情况的内容
                text_data = {'按照 先加后减-先减后加-匀速 的顺序判断前后';...
                    '前后：越往后的实验条件在前还是在后/时间长的在前还是在后';...
                    ' 1 :加减-减加,顺,后,       2 :加减-匀速,顺,后,      3 :减加-匀速,顺,后';...
                    ' 4 :加减-减加,逆,后,       5 :加减-匀速,逆,后,      6 :减加-匀速,逆,后';...
                    ' 7 :加减-减加,顺,前,       8 :加减-匀速,顺,前,      9 :减加-匀速,顺,前';...
                    '10:加减-减加,逆,前,      11:加减-匀速,逆,前,    12 :减加-匀速,逆,前';...
                    '13:加减-减加,顺,后/前, 14:加减-减加,顺,前/前';...
                    '15:加减-减加,顺,后/后, 16:加减-减加,顺,前/后'};
                title_text = [subject_name '--实验4 选择情况表'];
                
                % 画每个实验条件的旋转方向和先后顺序的效应
                DCRT_draw_condition = {[1,4,7,10];[2,5,8,11];[3,6,9,12]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
                DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
                DCRT_x_label = {'先加后减-先减后加选择正确率';'先加后减-匀速选择正确率';'先减后加-匀速选择正确率';};
                DCRT_x_ticklabels = {{'加减-减加-顺','加减-减加-逆','减加-加减-顺','减加-加减-逆'};...
                    {'加减-匀-顺','加减-匀-逆','匀-加减-顺','匀-加减-逆'};{'减加-匀-顺','减加-匀-逆','匀-减加-顺','匀-减加-逆'};};
                DCRT_title_name = [subject_name '--实验4 旋转方向和先后顺序的效应'];
                
                % 画每个实验条件的主效应
                DCF_draw_condition ={{[1,2],[1,3],[2,3]};{[4,5],[4,6],[5,6]};{[7,8],[7,9],[8,9]};{[10,11],[10,12],[11,12]};...
                    {1,4,7,10,2,5,8,11};{7,10,1,4,3,6,9,12};{8,11,2,5,9,12,3,6}};
                    %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 先加后减-先减后加-匀速 这三种实验条件
                    %{[先加后减相关的实验条件];[先减后加相关的实验条件];[匀速相关的实验条件]}
                DCF_first_second = {{[1,1],[2,1],[2,2]};{[1,1],[2,1],[2,2]};{[2,2],[1,2],[1,1]};{[2,2],[1,2],[1,1]};...
                    {1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2}};
                DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                    '先加后减不同情况的被选择概率';'先减后加不同情况的被选择概率';'匀速不同情况的被选择概率'};
                DCF_x_ticklabels = {{'先加后减','先减后加','匀速'};{'先加后减','先减后加','匀速'};...
                    {'先加后减','先减后加','匀速'};{'先加后减','先减后加','匀速'};...
                    {'加减-减加-顺','加减-减加-逆','减加-加减-顺','减加-加减-逆','加减-匀-顺','加减-匀-逆','匀-加减-顺','匀-加减-逆'};...
                    {'减加-加减-顺','减加-加减-逆','加减-减加-顺','加减-减加-逆','减加-匀-顺','减加-匀-逆','匀-减加-顺','匀-减加-逆'};...
                    {'匀-加减-顺','匀-加减-逆','加减-匀-顺','加减-匀-逆','匀-减加-顺','匀-减加-逆','减加-匀-顺','减加-匀-逆'}};
                DCF_title_name = [subject_name '--实验4 实验条件的主效应'];
            end
            % 保存曲线的数据
            FOC_line_y_n{4} = [FOC_line_y_n{4};Ss_y];FOC_line_num(4) = FOC_line_num(4) + 1;%保存下每个被试每种条件的选择频率
            condition_seq = [sum(condition_left(1:3)),sum(condition_right(7:9)),sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9)),sum(count_num(4:6)),sum(count_num(10:12))];
            % 选择条件编号更小的那个的频数
            Exp_F_data{4} = [Exp_F_data{4};condition_seq];%[顺后，顺前，逆后，逆前]
            
            C_1_2_L = [1,4];C_1_2_R = [7,10];      % 先加后减 和 先减后加 比较选择 先加后减 的情况
            C_1_3_L = [2,5];C_1_3_R = [8,11];      % 先加后减 和 一直匀速 比较选择 先加后减 的情况
            C_2_1_L = [7,10];C_2_1_R = [1,4];      % 先减后加 和 先加后减 比较选择 先减后加 的情况
            C_2_3_L = [3,6];C_2_3_R = [9,12];      % 先减后加 和 一直匀速 比较选择 先减后加 的情况
            C_3_1_L = [8,11];C_3_1_R = [2,5];      % 一直匀速 和 先加后减 比较选择 一直匀速 的情况
            C_3_2_L = [9,12];C_3_2_R = [3,6];      % 一直匀速 和 先减后加 比较选择 一直匀速 的情况
            Condition_POC = [(sum(condition_left(C_1_2_L))+sum(condition_right(C_1_2_R)))/(sum(count_num(C_1_2_L))+sum(count_num(C_1_2_R))),...
                (sum(condition_left(C_1_3_L))+sum(condition_right(C_1_3_R)))/(sum(count_num(C_1_3_L))+sum(count_num(C_1_3_R))),...
                (sum(condition_left(C_2_1_L))+sum(condition_right(C_2_1_R)))/(sum(count_num(C_2_1_L))+sum(count_num(C_2_1_R))),...
                (sum(condition_left(C_2_3_L))+sum(condition_right(C_2_3_R)))/(sum(count_num(C_2_3_L))+sum(count_num(C_2_3_R))),...
                (sum(condition_left(C_3_1_L))+sum(condition_right(C_3_1_R)))/(sum(count_num(C_3_1_L))+sum(count_num(C_3_1_R))),...
                (sum(condition_left(C_3_2_L))+sum(condition_right(C_3_2_R)))/(sum(count_num(C_3_2_L))+sum(count_num(C_3_2_R))),...
                ];
            Exp_F_POC{4} = [Exp_F_POC{4};Condition_POC];% 两两条件之间比较的POC
            
            condition_Chi = [sum(condition_left(1:3)),sum(condition_right(7:9));sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9));sum(count_num(4:6)),sum(count_num(10:12))];
            Exp_Chi_data_1{4} = [Exp_Chi_data_1{4};condition_Chi'];%[顺后，逆后;顺前，逆前]
            Exp_Chi_data_2{4} = [Exp_Chi_data_2{4};condition_Chi];%[顺后，顺前;逆后，逆前]
            if data.behave.gender == 0
                FOC_line_y_n_W{4} = [FOC_line_y_n_W{4};Ss_y];FOC_line_num_W(4) = FOC_line_num_W(4) + 1;
            else
                FOC_line_y_n_M{4} = [FOC_line_y_n_M{4};Ss_y];FOC_line_num_M(4) = FOC_line_num_M(4) + 1;
            end
        elseif accelerate_style == 5
            FOC = 8;
            condition_120_1 = [1,2,4,5];condition_120_2 = [7,8,10,11];
            condition_180_1 = [3,6,7,10];condition_180_2 = [1,4,9,12];
            condition_360_1 = [8,9,11,12];condition_360_2 = [2,3,5,6];
%             Ss_x = [120/3,180/3,360/3]';Ss_x = log2(Ss_x);
            Ss_x{5} = [1,2,3]';
            count_num = cat(1,data.behave.condition.count);
            FOC_120 = (sum(condition_left(condition_120_1)./count_num(condition_120_1))+sum(condition_right(condition_120_2)./count_num(condition_120_2)))/FOC;
            FOC_180 = (sum(condition_left(condition_180_1)./count_num(condition_180_1))+sum(condition_right(condition_180_2)./count_num(condition_180_2)))/FOC;
            FOC_360 = (sum(condition_left(condition_360_1)./count_num(condition_360_1))+sum(condition_right(condition_360_2)./count_num(condition_360_2)))/FOC;
            Ss_y = [FOC_120,FOC_180,FOC_360];
            less_more = (1:6);more_less = (7:12);
            test_short_long = [15,16];test_long_short = [13,14];
            right_num = sum(condition_right(less_more) + condition_left(more_less));
            all_num = sum(condition_right([less_more,more_less])+condition_left([less_more,more_less]));
            right_rate = right_num/all_num; %以点多的感觉时间长为正确，计算正确率
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率

            % 计算标准差
            block_trial = data.behave.trial;
            short_long = [less_more,test_short_long];long_short = [more_less,test_long_short];
            for ii = 1:length(block_trial(:,1))
                if find(short_long == block_trial(ii,1))%后面的时间长
                    if block_trial(ii,2) == 205
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 203
                        block_trial(ii,4) = 0;
                    end
                elseif find(long_short == block_trial(ii,1))%前面的时间长
                    if block_trial(ii,2) == 203
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 205
                        block_trial(ii,4) = 0;
                    end
                end
            end
            data.behave.trial = block_trial;
            for ii = 1:max(data.behave.trial(:,3))
                block_trial_ii = block_trial((block_trial(:,3)==ii),:);

                % 以点多的时间知觉长为真，统计每个block中的正确率
                error.rightrate_block(ii,1) = (sum(block_trial_ii(less_more,4))+sum(block_trial_ii(more_less,4)))/(length(less_more)+length(more_less));
                error.rightrate_block(ii,2) = 1 - error.rightrate_block(ii,1);
                % 真实的时间长度判断在每个block中的正确率
                error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
                error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);

                % 判断不同点数的刺激被选择的频率
                error.FOC_block(ii,1) = (sum(block_trial_ii(condition_120_1,2)==203)+sum(block_trial_ii(condition_120_2,2)==205))/FOC;
                error.FOC_block(ii,2) = (sum(block_trial_ii(condition_180_1,2)==203)+sum(block_trial_ii(condition_180_2,2)==205))/FOC;
                error.FOC_block(ii,3) = (sum(block_trial_ii(condition_360_1,2)==203)+sum(block_trial_ii(condition_360_2,2)==205))/FOC;
            end
            error_bar_bar = std(error.rightrate_block);%正确率的标准差
            error_bar_FOC = std(error.FOC_block);%选择次数的标准差

            % 输出正确率
            disp_str1 = sprintf('The right_rate is %.2f\n',right_rate*100);
            disp_str2 = sprintf('The test_right_rate is %.2f\n',test_right_rate*100);
            fprintf(disp_str1);fprintf(disp_str2)
            % 画图
            if isfigure ~= 0
                % 画折线图
                fig_FOC = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{5},Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('事件发生频率');ylabel('FOC');
                xticks(Ss_x{5});xticklabels({'40Hz','60Hz','120Hz'});
                xlim([min(Ss_x{5})-0.2,max(Ss_x{5})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--实验6 FOC折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);

                % 画柱状图
                fig_bar = figure;
                set(gcf,'Position',[200,50,1200,700]);
                subplot(6,2,(1:2:9))
                b1 = bar([1,2],[right_rate,1-right_rate]);
                hold on
                errorbar([1,2],[right_rate,1-right_rate],error_bar_bar(1:2),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'频率高时间长','频率低时间长'});ylim([0,1]);
                titel_1 = [subject_name '--实验6 事件发生频率不同'];
                title(titel_1,'FontSize',20);set(gca,'FontSize',15);
                subplot(6,2,(2:2:10))
                bar([1,2],[test_right_rate,1-test_right_rate]);
                hold on
                errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
                title_2 = [subject_name '--实验6 时长不同'];
                title(title_2,'FontSize',20);set(gca,'FontSize',15);
                hold off
            end

            if figure_seg ~= 0
                % 画每个实验条件选择情况的内容
                text_data = {'前后：事件发生频率高的在前还是在后/时间长的在前还是在后';...
                    ' 1 : 90-120,  顺,后,  2 : 90-180, 顺,后,  3 :120-180, 顺,后';...
                    ' 4 : 90-120,  逆,后,  5 : 90-180, 逆,后,  6 :120-180, 逆,后';...
                    ' 7 : 90-120,  顺,前,  8 : 90-180, 顺,前,  9 :120-180, 顺,前';...
                    ' 10: 90-120,  逆,前,  11: 90-180, 逆,前,  12:120-180, 逆,后';...
                    ' 13:180-300, 顺,前,                     14:360-150, 逆,前';...
                    ' 15:180-360, 顺,后,                     16:360-150, 逆,后'};
                title_text = [subject_name '--实验6 选择情况表'];
                
                % 画每个实验条件的旋转方向和先后顺序的效应
                DCRT_draw_condition = {[1,4,7,10];[2,5,8,11];[3,6,9,12]};%{[120-180];[120-360];[180-360]}
                DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
                DCRT_x_label = {' 90-120选择正确率';' 90-180选择正确率';'120-180选择正确率'};
                DCRT_x_ticklabels = {{' 90-120顺',' 90-120逆','120-90 顺','120-90 逆'};{' 90-180顺',' 90-180逆','180-90 顺','180-90 逆'};...
                    {'120-180顺','120-180逆','180-120顺','180-120逆'}};
                DCRT_title_name = [subject_name '--实验6 旋转方向和先后顺序的效应'];

                % 画每个实验条件的主效应
                DCF_draw_condition ={{[1,2],[1,3],[2,3]};{[4,5],[4,6],[5,6]};{[7,8],[7,9],[8,9]};{[10,11],[10,12],[12,13]};...
                    {1,2,4,5,7,8,10,11};{1,3,4,6,7,9,10,12};{2,3,5,6,8,9,11,12}};
                    %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 120-180-360
                    %{[120相关的实验条件];[180相关的实验条件];[360相关的实验条件]}
                DCF_first_second = {{[1,1],[2,1],[2,2]};{[1,1],[2,1],[2,2]};{[2,2],[1,2],[1,1]};{[2,2],[1,2],[1,1]};...
                    {1,1,1,1,2,2,2,2};{2,1,2,1,1,2,1,2};{2,2,2,2,1,1,1,1}};
                DCF_x_label = {'顺时针-后一个事件发生频率高';'逆时针-后一个事件发生频率高';'顺时针-前一个事件发生频率高';'逆时针-前一个事件发生频率高';...
                    '30Hz不同条件被选择的概率';'40Hz不同条件被选择的概率';'60Hz不同条件被选择的概率'};
                DCF_x_ticklabels = {{' 90','120','180'};{' 90','120','180'};{' 90','120','180'};{' 90','120','180'};...
                    {' 90-120顺',' 90-180顺',' 90-120逆',' 90-180逆','120-90 顺','180-90 顺','120-90 逆','180-90 逆'};...
                    {' 90-120顺','120-180顺',' 90-120逆','120-180逆','120-90 顺','180-120顺','120-90 逆','180-120逆'};...
                    {' 90-180顺','120-180顺',' 90-180逆','120-180逆','180-90 顺','180-120顺','180-90 逆','180-120逆'}};
                DCF_title_name = [subject_name '--实验6 事件发生频率的主效应'];
            end
            % 保存曲线的数据
            FOC_line_y_n{5} = [FOC_line_y_n{5};Ss_y];FOC_line_num(5) = FOC_line_num(5) + 1;%保存下每个被试每种条件的选择频率
            % 用于算顺序和旋转效应的数据保存
            condition_seq = [sum(condition_left(1:3)),sum(condition_right(7:9)),sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9)),sum(count_num(4:6)),sum(count_num(10:12))];
            % 选择条件编号更小的那个的频数
            Exp_F_data{5} = [Exp_F_data{5};condition_seq];%[顺后，顺前，逆后，逆前]
            
            C_30_40_L = [1,4];C_30_40_R = [7,10];      % 30Hz 和 40Hz 比较选择 30Hz 的情况
            C_30_60_L = [2,5];C_30_60_R = [8,11];      % 30Hz 和 60Hz 比较选择 30Hz 的情况
            C_40_30_L = [7,10];C_40_30_R = [1,4];      % 40Hz 和 30Hz 比较选择 40Hz 的情况
            C_40_60_L = [3,6];C_40_60_R = [9,12];      % 40Hz 和 60Hz 比较选择 40Hz 的情况
            C_60_30_L = [8,11];C_60_30_R = [2,5];      % 60Hz 和 30Hz 比较选择 60Hz 的情况
            C_60_40_L = [9,12];C_60_40_R = [3,6];      % 60Hz 和 40Hz 比较选择 60Hz 的情况
            Condition_POC = [(sum(condition_left(C_30_40_L))+sum(condition_right(C_30_40_R)))/(sum(count_num(C_30_40_L))+sum(count_num(C_30_40_R))),...
                (sum(condition_left(C_30_60_L))+sum(condition_right(C_30_60_R)))/(sum(count_num(C_30_60_L))+sum(count_num(C_30_60_R))),...
                (sum(condition_left(C_40_30_L))+sum(condition_right(C_40_30_R)))/(sum(count_num(C_40_30_L))+sum(count_num(C_40_30_R))),...
                (sum(condition_left(C_40_60_L))+sum(condition_right(C_40_60_R)))/(sum(count_num(C_40_60_L))+sum(count_num(C_40_60_R))),...
                (sum(condition_left(C_60_30_L))+sum(condition_right(C_60_30_R)))/(sum(count_num(C_60_30_L))+sum(count_num(C_60_30_R))),...
                (sum(condition_left(C_60_40_L))+sum(condition_right(C_60_40_R)))/(sum(count_num(C_60_40_L))+sum(count_num(C_60_40_R))),...
                ];
            Exp_F_POC{5} = [Exp_F_POC{5};Condition_POC];% 两两条件之间比较的POC
            
            condition_Chi = [sum(condition_left(1:3)),sum(condition_right(7:9));sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9));sum(count_num(4:6)),sum(count_num(10:12))];
            Exp_Chi_data_1{5} = [Exp_Chi_data_1{5};condition_Chi'];%[顺后，逆后；顺前，逆前]
            Exp_Chi_data_2{5} = [Exp_Chi_data_2{5};condition_Chi];%[顺后，顺前；逆后，逆前]
            if data.behave.gender == 0
                FOC_line_y_n_W{5} = [FOC_line_y_n_W{5};Ss_y];FOC_line_num_W(5) = FOC_line_num_W(5) + 1;
            else
                FOC_line_y_n_M{5} = [FOC_line_y_n_M{5};Ss_y];FOC_line_num_M(5) = FOC_line_num_M(5) + 1;
            end
        elseif accelerate_style == 7
            % 无序之间的比较
            FOC1 = 4;
            condition_30_0_1 = [1,2];condition_30_0_2 = [4,5];% 30Hz无序
            condition_40_0_1 = [3,4];condition_40_0_2 = [1,6];% 40Hz无序
            condition_60_0_1 = [5,6];condition_60_0_2 = [2,3];% 60Hz无序
            Ss_x{6} = [1,2,3]';Ss_x{7} = Ss_x{6};
            count_num = cat(1,data.behave.condition.count);
            FOC_30 = (sum(condition_left(condition_30_0_1)./count_num(condition_30_0_1))+sum(condition_right(condition_30_0_2)./count_num(condition_30_0_2)))/FOC1;
            FOC_40 = (sum(condition_left(condition_40_0_1)./count_num(condition_40_0_1))+sum(condition_right(condition_40_0_2)./count_num(condition_40_0_2)))/FOC1;
            FOC_60 = (sum(condition_left(condition_60_0_1)./count_num(condition_60_0_1))+sum(condition_right(condition_60_0_2)./count_num(condition_60_0_2)))/FOC1;
            Ss_y1 = [FOC_30,FOC_40,FOC_60];
            % 有序和无序之间的比较，选择无序的概率
            FOC2 = 2;
            c_30_0_1 = 10;c_30_0_2 = 7;% 30Hz无序
            c_40_0_1 = 11;c_40_0_2 = 8;% 40Hz无序
            c_60_0_1 = 12;c_60_0_2 = 9;% 60Hz无序
            FOC_30_0 = (sum(condition_left(c_30_0_1)./count_num(c_30_0_1))+sum(condition_right(c_30_0_2)./count_num(c_30_0_2)))/FOC2;
            FOC_40_0 = (sum(condition_left(c_40_0_1)./count_num(c_40_0_1))+sum(condition_right(c_40_0_2)./count_num(c_40_0_2)))/FOC2;
            FOC_60_0 = (sum(condition_left(c_60_0_1)./count_num(c_60_0_1))+sum(condition_right(c_60_0_2)./count_num(c_60_0_2)))/FOC2;
            Ss_y2 = [FOC_30_0,FOC_40_0,FOC_60_0];
            % 有真实时间差异的条件
            test_short_long = [15,16];test_long_short = [13,14];
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率

            % 计算标准差
            block_trial = data.behave.trial;
            short_long = test_short_long;long_short = test_long_short;
            for ii = 1:length(block_trial(:,1))
                if find(short_long == block_trial(ii,1))%后面的时间长
                    if block_trial(ii,2) == 205
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 203
                        block_trial(ii,4) = 0;
                    end
                elseif find(long_short == block_trial(ii,1))%前面的时间长
                    if block_trial(ii,2) == 203
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 205
                        block_trial(ii,4) = 0;
                    end
                end
            end
            data.behave.trial = block_trial;
            for ii = 1:max(data.behave.trial(:,3)) % 每一次循环中，每个实验条件被选择的概率
                block_trial_ii = block_trial((block_trial(:,3)==ii),:);
                % 真实的时间长度判断在每个block中的正确率
                error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
                error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
                % 无序之间比较的标准差
                error.FOC_block(ii,1) = (sum(block_trial_ii(condition_30_0_1,2)==203)+sum(block_trial_ii(condition_30_0_2,2)==205))/FOC1;
                error.FOC_block(ii,2) = (sum(block_trial_ii(condition_40_0_1,2)==203)+sum(block_trial_ii(condition_40_0_2,2)==205))/FOC1;
                error.FOC_block(ii,3) = (sum(block_trial_ii(condition_60_0_1,2)==203)+sum(block_trial_ii(condition_60_0_2,2)==205))/FOC1;
                % 无序和有序之间比较的标准差
                error.FOC_block(ii,4) = (sum(block_trial_ii(c_30_0_1,2)==203)+sum(block_trial_ii(c_30_0_2,2)==205))/FOC2;
                error.FOC_block(ii,5) = (sum(block_trial_ii(c_40_0_1,2)==203)+sum(block_trial_ii(c_40_0_2,2)==205))/FOC2;
                error.FOC_block(ii,6) = (sum(block_trial_ii(c_60_0_1,2)==203)+sum(block_trial_ii(c_60_0_2,2)==205))/FOC2;
            end
            error_bar_bar = std(error.rightrate_block);%正确率的标准差
            error_bar_FOC = std(error.FOC_block);%选择次数的标准差

            % 画图
            if isfigure ~= 0
                % 画折线图
                fig_FOC = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{6},Ss_y1,error_bar_FOC(1:3),'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('事件发生频率');ylabel('POC');
                xticks(Ss_x{6});xticklabels({'30Hz','40Hz','60Hz'});
                xlim([min(Ss_x{6})-0.2,max(Ss_x{6})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--无序条件 POC折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);
                % 画折线图
                fig_FOC2 = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{6},Ss_y2,error_bar_FOC(4:6),'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('事件发生频率');ylabel('选择无序条件的 POC');
                xticks(Ss_x{6});xticklabels({'30Hz','40Hz','60Hz'});
                xlim([min(Ss_x{6})-0.2,max(Ss_x{6})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--有序 VS 无序 选择无序的 POC 折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);
                % 画柱状图
                fig_bar = figure;
                set(gcf,'Position',[200,50,1200,700]);
                subplot(6,1,1:5)
                bar([1,2],[test_right_rate,1-test_right_rate]);
                hold on
                errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
                title_2 = [subject_name '--真实时间差异'];
                title(title_2,'FontSize',20);set(gca,'FontSize',15);
                hold off
            end        
            % 保存曲线的数据
            FOC_line_y_n{6} = [FOC_line_y_n{6};Ss_y1];FOC_line_num(6) = FOC_line_num(6) + 1;%保存下每个被试每种条件的选择频率
            FOC_line_y_n{7} = [FOC_line_y_n{7};Ss_y2];FOC_line_num(7) = FOC_line_num(7) + 1;%保存下每个被试每种条件的选择频率
            
            
            POC_30Left = condition_left(c_30_0_1)./count_num(c_30_0_1); % 30Hz 无序条件先呈现被选择的概率
            POC_40Left = condition_left(c_40_0_1)./count_num(c_40_0_1); % 40Hz 无序条件先呈现被选择的概率
            POC_60Left = condition_left(c_60_0_1)./count_num(c_60_0_1); % 60Hz 无序条件先呈现被选择的概率
            POC_30Right = condition_right(c_30_0_2)./count_num(c_30_0_2); % 30Hz 无序条件后呈现被选择的概率
            POC_40Right = condition_right(c_40_0_2)./count_num(c_40_0_2); % 40Hz 无序条件后呈现被选择的概率
            POC_60Right = condition_right(c_60_0_2)./count_num(c_60_0_2); % 60Hz 无序条件后呈现被选择的概率
            POC_7 = [POC_7;POC_30Left,POC_40Left,POC_60Left,POC_30Right,POC_40Right,POC_60Right];
        elseif accelerate_style == 8
            FOC = 8;
             % condition_8_1_1：其中，8表示第8个实验，第一个1表示第一种实验条件，第二个1表示在前面呈现
            condition_8_1_1 = [1,2,4,5];condition_8_1_2 = [7,8,10,11];% 1：加速
            condition_8_2_1 = [3,6,7,10];condition_8_2_2 = [1,4,9,12];% 2：减速
            condition_8_3_1 = [8,9,11,12];condition_8_3_2 = [2,3,5,6];% 3：匀速
            Ss_x{8} = [1,2,3]'; % 1:加速；2：减速；3：匀速
            count_num = cat(1,data.behave.condition.count);%每个条件一共做了多少次trial
            FOC_1 = (sum(condition_left(condition_8_1_1)./count_num(condition_8_1_1))+sum(condition_right(condition_8_1_2)./count_num(condition_8_1_2)))/FOC;
            FOC_2 = (sum(condition_left(condition_8_2_1)./count_num(condition_8_2_1))+sum(condition_right(condition_8_2_2)./count_num(condition_8_2_2)))/FOC;
            FOC_3 = (sum(condition_left(condition_8_3_1)./count_num(condition_8_3_1))+sum(condition_right(condition_8_3_2)./count_num(condition_8_3_2)))/FOC;
            Ss_y = [FOC_1,FOC_2,FOC_3];
            test_long_short = [13,14];test_short_long = [15,16];
            test_right_num = sum(condition_right(test_short_long) + condition_left(test_long_short));
            test_all_num = sum(condition_right([test_short_long,test_long_short])+condition_left([test_short_long,test_long_short]));
            test_right_rate = test_right_num/test_all_num; %真实有时间差异的条件判断的正确率

            % 计算标准差
            block_trial = data.behave.trial;
            short_long = test_short_long;long_short = test_long_short;
            for ii = 1:length(block_trial(:,1))
                if find(short_long == block_trial(ii,1))%后面的时间长
                    if block_trial(ii,2) == 205
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 203
                        block_trial(ii,4) = 0;
                    end
                elseif find(long_short == block_trial(ii,1))%前面的时间长
                    if block_trial(ii,2) == 203
                        block_trial(ii,4) = 1;
                    elseif block_trial(ii,2) == 205
                        block_trial(ii,4) = 0;
                    end
                else
                    block_trial(ii,4) = nan;
                end
            end
            data.behave.trial = block_trial;
            if mod(length(data.behave.trial(:,3)),max(data.behave.trial(:,3)))
                block_num = max(data.behave.trial(:,3)) - 1;
            else
                block_num = max(data.behave.trial(:,3));
            end
            for ii = 1:block_num
                block_trial_ii = block_trial((block_trial(:,3)==ii),:);

                % 真实的时间长度判断在每个block中的正确率
                error.rightrate_block(ii,3) = (sum(block_trial_ii(test_short_long,4))+sum(block_trial_ii(test_long_short,4)))/(length(test_short_long)+length(test_long_short));
                error.rightrate_block(ii,4) = 1 - error.rightrate_block(ii,3);
                % 判断不同点数的刺激被选择的频率
                error.FOC_block(ii,1) = (sum(block_trial_ii(condition_8_1_1,2)==203)+sum(block_trial_ii(condition_8_1_2,2)==205))/FOC;
                error.FOC_block(ii,2) = (sum(block_trial_ii(condition_8_2_1,2)==203)+sum(block_trial_ii(condition_8_2_2,2)==205))/FOC;
                error.FOC_block(ii,3) = (sum(block_trial_ii(condition_8_3_1,2)==203)+sum(block_trial_ii(condition_8_3_2,2)==205))/FOC;
            end
            error_bar_bar = std(error.rightrate_block);%正确率的标准差
            error_bar_FOC = std(error.FOC_block);%选择次数的标准差
            % 画图
            if isfigure ~= 0
                % 画折线图
                fig_FOC = figure;
                set(gcf,'Position',[200,50,1200,700]);
                errorbar(Ss_x{8},Ss_y,error_bar_FOC,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
                xlabel('速度变化情况');ylabel('FOC');
                xticks(Ss_x{8});xticklabels({'加速','减速','匀速'});
                xlim([min(Ss_x{8})-0.2,max(Ss_x{8})+0.2]);ylim([-0.03,1.03]);
                title_4 = [subject_name '--实验8 FOC折线图'];
                title(title_4,'FontSize',20);set(gca,'FontSize',15);
                % 画散点
                hold on
                scatter_x = repmat(Ss_x{8}',size(error.FOC_block,1),1);
                scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
                scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.1 - 0.05;
                scatter_y = error.FOC_block;
                scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
                scatter(scatter_x,scatter_y,35,[0 0 0],'o','filled');
                hold off

                % 画柱状图
                fig_bar = figure;
                subplot(6,1,(1:5))
                set(gcf,'Position',[200,50,1200,700]);
                bar([1,2],[test_right_rate,1-test_right_rate]);
                hold on
                title_1 = [subject_name '--实验8 速度状态不同'];
                errorbar([1,2],[test_right_rate,1-test_right_rate],error_bar_bar(3:4),'k','LineWidth',2);
                xticks([1,2]);xticklabels({'正确选择','错误选择'});ylim([0,1]);
                title_2 = [subject_name '--实验8 时长不同'];
                title(title_2,'FontSize',20);set(gca,'FontSize',15);
                hold off
            end
            if isfigure ~= 0
                % 画每个实验条件选择情况的内容
                text_data = {'按照 加速-减速-匀速 的顺序判断前后';...
                    '前后：越往后的实验条件在前还是在后/时间长的在前还是在后';...
                    ' 1 :加-减,顺,后,       2 :加-匀,顺,后,      3 :减-匀,顺,后';...
                    ' 4 :加-减,逆,后,       5 :加-匀,逆,后,      6 :减-匀,逆,后';...
                    ' 7 :加-减,顺,前,       8 :加-匀,顺,前,      9 :减-匀,顺,前';...
                    '10:加-减,逆,前,      11:加-匀,逆,前,    12 :减-匀,逆,前';...
                    '13:加-减,顺,后/前, 14:加-减,顺,前/前';...
                    '15:加-减,顺,后/后, 16:加-减,顺,前/后'};
                title_text = [subject_name '--实验3 选择情况表'];
                
                % 画每个实验条件的旋转方向和先后顺序的效应
                DCRT_draw_condition = {[1,4,7,10];[2,5,8,11];[3,6,9,12]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
                DCRT_first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1]};%1表示选择左键为正确，2表示选择右键为正确
                DCRT_x_label = {'加速-减速选择正确率';'加速-匀速选择正确率';'减速-匀速选择正确率';};
                DCRT_x_ticklabels = {{'加-减-顺','加-减-逆','减-加-顺','减-加-逆'};...
                    {'加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};{'减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};};
                DCRT_title_name = [subject_name '--实验3 旋转方向和先后顺序的效应'];

                % 画每个实验条件的主效应
                DCF_draw_condition ={{[1,2],[1,3],[2,3]};{[4,5],[4,6],[5,6]};{[7,8],[7,9],[8,9]};{[10,11],[10,12],[11,12]};...
                    {1,4,7,10,2,5,8,11};{7,10,1,4,3,6,9,12};{8,11,2,5,9,12,3,6}};
                    %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 加速-减速-匀速 这三种实验条件
                    %{[加速相关的实验条件];[减速相关的实验条件];[匀速相关的实验条件]}
                DCF_first_second = {{[1,1],[2,1],[2,2]};{[1,1],[2,1],[2,2]};{[2,2],[1,2],[1,1]};{[2,2],[1,2],[1,1]};...
                    {1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2};{1,1,2,2,1,1,2,2}};
                DCF_x_label = {'顺时针-后';'逆时针-后';'顺时针-前';'逆时针-前';...
                    '加速不同情况的被选择概率';'减速不同情况的被选择概率';'匀速不同情况的被选择概率'};
                DCF_x_ticklabels = {{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};{'加速','减速','匀速'};...
                    {'加-减-顺','加-减-逆','减-加-顺','减-加-逆','加-匀-顺','加-匀-逆','匀-加-顺','匀-加-逆'};...
                    {'减-加-顺','减-加-逆','加-减-顺','加-减-逆','减-匀-顺','减-匀-逆','匀-减-顺','匀-减-逆'};...
                    {'匀-加-顺','匀-加-逆','加-匀-顺','加-匀-逆','匀-减-顺','匀-减-逆','减-匀-顺','减-匀-逆'}};
                DCF_title_name = [subject_name '--实验3 实验条件的主效应'];
            end
            % 保存曲线的数据
            FOC_line_y_n{8} = [FOC_line_y_n{8};Ss_y];FOC_line_num(8) = FOC_line_num(8) + 1;%保存下每个被试每种条件的选择频率
            condition_seq = [sum(condition_left(1:3)),sum(condition_right(7:9)),sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9)),sum(count_num(4:6)),sum(count_num(10:12))];
            % 选择条件编号更小的那个的频数
            Exp_F_data{6} = [Exp_F_data{6};condition_seq];%[顺后，顺前，逆后，逆前]
            
            C_1_2_L = [1,4];C_1_2_R = [7,10];      % 加速 和 减速 比较选择 加速 的情况
            C_1_3_L = [2,5];C_1_3_R = [8,11];      % 加速 和 匀速 比较选择 加速 的情况
            C_2_1_L = [7,10];C_2_1_R = [1,4];      % 减速 和 加速 比较选择 减速 的情况
            C_2_3_L = [3,6];C_2_3_R = [9,12];      % 减速 和 匀速 比较选择 减速 的情况
            C_3_1_L = [8,11];C_3_1_R = [2,5];      % 匀速 和 加速 比较选择 匀速 的情况
            C_3_2_L = [9,12];C_3_2_R = [3,6];      % 匀速 和 减速 比较选择 匀速 的情况
            Condition_POC = [(sum(condition_left(C_1_2_L))+sum(condition_right(C_1_2_R)))/(sum(count_num(C_1_2_L))+sum(count_num(C_1_2_R))),...
                (sum(condition_left(C_1_3_L))+sum(condition_right(C_1_3_R)))/(sum(count_num(C_1_3_L))+sum(count_num(C_1_3_R))),...
                (sum(condition_left(C_2_1_L))+sum(condition_right(C_2_1_R)))/(sum(count_num(C_2_1_L))+sum(count_num(C_2_1_R))),...
                (sum(condition_left(C_2_3_L))+sum(condition_right(C_2_3_R)))/(sum(count_num(C_2_3_L))+sum(count_num(C_2_3_R))),...
                (sum(condition_left(C_3_1_L))+sum(condition_right(C_3_1_R)))/(sum(count_num(C_3_1_L))+sum(count_num(C_3_1_R))),...
                (sum(condition_left(C_3_2_L))+sum(condition_right(C_3_2_R)))/(sum(count_num(C_3_2_L))+sum(count_num(C_3_2_R))),...
                ];
            Exp_F_POC{6} = [Exp_F_POC{6};Condition_POC];% 两两条件之间比较的POC
            
            condition_Chi = [sum(condition_left(1:3)),sum(condition_right(7:9));sum(condition_left(4:6)),sum(condition_right(10:12))]./...
                [sum(count_num(1:3)),sum(count_num(7:9));sum(count_num(4:6)),sum(count_num(10:12))];
            Exp_Chi_data_1{6} = [Exp_Chi_data_1{6};condition_Chi'];%[顺后，逆后;顺前，逆前]
            Exp_Chi_data_2{6} = [Exp_Chi_data_2{6};condition_Chi];%[顺后，顺前;逆后，逆前]
            if data.behave.gender == 0
                FOC_line_y_n_W{6} = [FOC_line_y_n_W{6};Ss_y];FOC_line_num_W(6) = FOC_line_num_W(6) + 1;
            else
                FOC_line_y_n_M{6} = [FOC_line_y_n_M{6};Ss_y];FOC_line_num_M(6) = FOC_line_num_M(6) + 1;
            end
            
        end
        
        if accelerate_style == 1
            % t检验（以事件发生频率高时间长为正确/以减速运动时间长为正确，计算正确率，比较正确率和0.5之间的差异）
            rightrate_block_n = error.rightrate_block(:,1);%实验条件的正确率
            rightrate_block_stan = ones(size(rightrate_block_n,1),1).*0.5;
            [t_nh_i,t_np_i,t_nci_i,t_nstats_i] = ttest2(rightrate_block_n,rightrate_block_stan);%实验条件的t检验
                %t=1表示在0.05水平上拒绝原假设；%ci是置信区间；
            % 真实实际差异的t检验
            rightrate_block_test_n = error.rightrate_block(:,3);%实验条件的正确率
            rightrate_block_test_stan = ones(size(rightrate_block_test_n,1),1).*0.5;
            [t_nh_i2,t_np_i2,t_nci_i2,t_nstats_i2] = ttest2(rightrate_block_test_n,rightrate_block_test_stan);%实验条件的t检验
                %t=1表示在0.05水平上拒绝原假设；%ci是置信区间；
            % 卡方检验
            trial_condition = cat(1,data.behave.trial(:,1));
            trial_choose = cat(1,data.behave.trial(:,2));
            condition_num = sort([condition_1,condition_2]);%确定有哪些条件是实验条件
            row_num = ismember(trial_condition,condition_num);%实验条件在哪些行
            trial_cell = zeros(sum(row_num),3);
            trial_cell(:,1) = trial_condition(row_num);%实验条件名称
            trial_cell(:,2) = trial_choose(row_num);%选择按键代码，203是左键，205是右键
            for iii = 1:length(condition_num)
                % 形成实验条件的矩阵，设点越多判断为时间长，匀减速判断为时间长，判断正确为1，不正确为0
                find_condition = find(trial_cell(:,1)==condition_num(iii));
                if find(condition_num(iii)==condition_1)
                    trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 1;
                    trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 0;
                elseif find(condition_num(iii) == condition_2)
                    trial_cell(find_condition(trial_cell(find_condition,2) == 203),3) = 0;
                    trial_cell(find_condition(trial_cell(find_condition,2) == 205),3) = 1;
                end
            end
            % 进行卡方检验
            [h1,p1,stats1]=chi2gof(trial_cell(:,3),'expected',[size(trial_cell,1)/2,size(trial_cell,1)/2]);
            % 正确的个数和错误个数与平均数做卡方检验
            if h1==1,issufficient1 = '差异显著';elseif h1==0,issufficient1 = '差异不显著'; end
            if t_nh_i==1,issufficient2_t = '差异显著';elseif t_nh_i==0,issufficient2_t = '差异不显著'; end
            if t_nh_i2==1,issufficient2_t2 = '差异显著';elseif t_nh_i2==0,issufficient2_t2 = '差异不显著'; end
            % 画图
            if isfigure ~= 0
                subplot(6,2,[11,12])
                axis off
                text(0,0.5,['正确次数卡方分析值为：',num2str(stats1.chi2stat),'，',issufficient1,'，p值为：',num2str(p1)],'FontSize',20)
                text(0,0,['正确率t检验值为：',num2str(t_nstats_i.tstat),'，',issufficient2_t,'，p值为：',num2str(t_np_i)],'FontSize',20)
                text(0,-0.5,['真实时间差异的t检验值为：',num2str(t_nstats_i2.tstat),'，',issufficient2_t2,'，p值为：',num2str(t_np_i2)],'FontSize',20)
                set(gca,'color','none')
            end
        else
            % 真实实际差异的t检验
            rightrate_block_test_n = error.rightrate_block(:,3);%实验条件的正确率
            rightrate_block_test_stan = ones(size(rightrate_block_test_n,1),1).*0.5;
            [t_nh_i2,t_np_i2,t_nci_i2,t_nstats_i2] = ttest2(rightrate_block_test_n,rightrate_block_test_stan);%实验条件的t检验
                %t=1表示在0.05水平上拒绝原假设；%ci是置信区间；

            % 正确的个数和错误个数与平均数做卡方检验
            if t_nh_i2==1,issufficient2_t2 = '差异显著';elseif t_nh_i2==0,issufficient2_t2 = '差异不显著'; end
            % 画图
            if isfigure ~= 0
                subplot(6,1,6)
                axis off
                text(0,-0.5,['真实时间差异的t检验值为：',num2str(t_nstats_i2.tstat),'，',issufficient2_t2,'，p值为：',num2str(t_np_i2)],'FontSize',20)
                set(gca,'color','none')
            end
        end
        if figure_seg ~= 0
            DrawTrialsData(data,text_data,title_text,save_picture);
            DrawConditionRT(data,DCRT_draw_condition,DCRT_first_second,DCRT_x_label,DCRT_x_ticklabels,DCRT_title_name,save_picture);
            DrawConditionFOC(data,DCF_draw_condition,DCF_first_second,DCF_x_label,DCF_x_ticklabels,DCF_title_name,save_picture);
        end
        if save_picture == 1 && isfigure == 1,print(fig_FOC,'-djpeg',title_4);print(fig_bar,'-djpeg',title_1);end
        % 保持数据
        if accelerate_style == 1
            uniform_trial{j} = trial_cell;j = j + 1;
        end
        
    end
        
    %% 画不同实验的FOC图
    var_h = cell(1,8);var_p = zeros(1,8);
    for FOC_i = 1:8
        if ~isempty(FOC_line_y_n{FOC_i})
            if size(FOC_line_y_n{FOC_i},1)>1
                line_color = [0.45,0.45,0.45];bar_color = [.45,.45,.45];dot_color = [0,0,0];
                error_bar_FOC_all = std(FOC_line_y_n{FOC_i})/sqrt(size(FOC_line_y_n{FOC_i},1));
                FOC_line_y = mean(FOC_line_y_n{FOC_i},1);
                %% 每组数据是不是正态分布，是不是方差齐性
                for j = 1:size(FOC_line_y_n{FOC_i},2)
                    [var_h{FOC_i}(j),var_p1{FOC_i}(j),var_kstat{FOC_i}(j),var_critval{FOC_i}(j)] = lillietest(FOC_line_y_n{FOC_i}(:,j),'MCTol',0.001);
                    % h = 0表示符合正态分布,h = 1表示不符合正态分布
                end
                if  sum(var_h{FOC_i}==0) == size(FOC_line_y_n{FOC_i},2)
                    [var_p(FOC_i),var_stats{FOC_i}] = vartestn(FOC_line_y_n{FOC_i},'Display','off');% 也可以使用其他类型，比如：'TestType','BrownForsythe'
                    % p > 0.05 表示方差齐性，p < 0.05表示方差不齐性
                else
%                     var_p(FOC_i) = 0;
                    var_p(FOC_i) = 1;% 不管是否方差齐性都使用方差分析
                end
                
                %% 画图
                fig_name = ['实验 ',num2str(FOC_i),' FOC图'];
                all_FOC_fig = figure('name',fig_name);
                hold on
                set(gcf,'Position',[200,50,1200,700]);
                switch FOC_i
                    case 1
                        plot(Ss_x{FOC_i},FOC_line_y,'Color',line_color,'LineWidth',4);
                        xticks(Ss_x{FOC_i}');xticklabels({'15Hz','30Hz','60Hz','120Hz'});
                        x_lim = [min(Ss_x{FOC_i})-0.2,max(Ss_x{FOC_i})+0.2];y_lim = [-0.03,1.03];
                        xlim(x_lim);ylim(y_lim);xlabel('事件发生频率','fontsize',20);
                        y_label_i = ylabel('FOC','Rotation',0,'fontsize',20);y_label_i.Position = [min(Ss_x{FOC_i})-0.5,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none',...
                    'LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','k','CapSize',15)
                        title_10 = ['实验1','： 事件发生频率FOC'];
                        condition_Exp = [' 15Hz';' 30Hz';' 60Hz';'120Hz'];
                        condition_Exp_1 = ['顺';'顺';'逆';'逆'];%旋转
                        condition_Exp_2 = ['后';'前';'后';'前'];%顺序
                    case 2
                        bar(Ss_x{2},FOC_line_y,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
                        xticks(Ss_x{FOC_i}');xticklabels({'单次呈现','一致性重复','颜色不一致','位置不一致'});
                        x_lim = [min(Ss_x{FOC_i})-1,max(Ss_x{FOC_i})+1];y_lim = [0,1.1];
                        xlim(x_lim);ylim(y_lim);xlabel('视觉刺激一致性','fontsize',20);
                        y_label_i = ylabel('FOC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.35,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
                        title_10 = ['实验2','： 视觉刺激一致性程度FOC'];
                        condition_Exp = ['1';'2';'3';'4'];
                        condition_Exp_1 = ['顺';'顺';'逆';'逆'];%旋转
                        condition_Exp_2 = ['后';'前';'后';'前'];%顺序
                    case 3
                        bar(Ss_x{3},FOC_line_y,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
                        xticks(Ss_x{FOC_i}');xticklabels({'匀加速','匀减速','匀速'});
                        x_lim = [min(Ss_x{FOC_i})-1,max(Ss_x{FOC_i})+1];y_lim = [0,1.1];
                        xlim(x_lim);ylim(y_lim);xlabel('速度变化情况','fontsize',20);
                        y_label_i = ylabel('FOC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.35,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
                        title_10 = ['实验3','： 一致性速度变化FOC'];
                        condition_Exp = ['1';'2';'3'];
                        condition_Exp_1 = ['顺';'顺';'逆';'逆'];%旋转
                        condition_Exp_2 = ['后';'前';'后';'前'];%顺序
                    case 4
                        bar(Ss_x{4},FOC_line_y,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
                        xticks(Ss_x{FOC_i}');xticklabels({'先加速后减速','先减速后加速','匀速'});
                        x_lim = [min(Ss_x{FOC_i})-1,max(Ss_x{FOC_i})+1];y_lim = [0,1.1];
                        xlim(x_lim);ylim(y_lim);xlabel('速度变化情况','fontsize',20);
                        y_label_i = ylabel('FOC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.35,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
                        title_10 = ['实验4','： 速度变化不一致FOC'];
                        condition_Exp = ['1';'2';'3'];
                        condition_Exp_1 = ['顺';'顺';'逆';'逆'];%旋转
                        condition_Exp_2 = ['后';'前';'后';'前'];%顺序
                    case 5
                        plot(Ss_x{FOC_i},FOC_line_y,'Color',line_color,'LineWidth',4);
                        xticks(Ss_x{FOC_i}');xticklabels({'30Hz','40Hz','60Hz'});
                        x_lim = [min(Ss_x{FOC_i})-0.2,max(Ss_x{FOC_i})+0.2];y_lim = [-0.03,1.03];
                        xlim(x_lim);ylim(y_lim);xlabel('事件发生频率','fontsize',20);
                        y_label_i = ylabel('FOC','Rotation',0,'fontsize',20);y_label_i.Position = [min(Ss_x{FOC_i})-0.5,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none',...
                    'LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','k','CapSize',15)
                        title_10 = ['实验6','： 事件发生频率FOC'];
                        condition_Exp = ['30Hz';'40Hz';'60Hz'];
                        condition_Exp_1 = ['顺';'顺';'逆';'逆'];%旋转
                        condition_Exp_2 = ['后';'前';'后';'前'];%顺序
                    case 6
                        plot(Ss_x{FOC_i},FOC_line_y,'Color',line_color,'LineWidth',4);
                        xticks(Ss_x{FOC_i}');xticklabels({'30Hz','40Hz','60Hz'});
                        x_lim = [min(Ss_x{FOC_i})-0.2,max(Ss_x{FOC_i})+0.2];y_lim = [0,1.1];
                        xlim(x_lim);ylim(y_lim);xlabel('无序条件 事件发生频率','fontsize',20);
                        y_label_i = ylabel('POC','Rotation',0,'fontsize',20);y_label_i.Position = [min(Ss_x{FOC_i})-0.5,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none',...
                    'LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','k','CapSize',15)
                        title_10 = ['实验7','： 无序条件下 事件发生频率 POC'];
                        condition_Exp = ['30Hz';'40Hz';'60Hz'];
                    case 7
                        plot(Ss_x{FOC_i},FOC_line_y,'Color',line_color,'LineWidth',4);
                        xticks(Ss_x{FOC_i}');xticklabels({'30Hz','40Hz','60Hz'});
                        x_lim = [min(Ss_x{FOC_i})-0.2,max(Ss_x{FOC_i})+0.2];y_lim = [0,1.1];
                        xlim(x_lim);ylim(y_lim);xlabel('无序条件 VS 有序条件','fontsize',20);
                        y_label_i = ylabel('POC','Rotation',0,'fontsize',20);y_label_i.Position = [min(Ss_x{FOC_i})-0.5,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none',...
                    'LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','k','CapSize',15)
                        title_10 = ['实验7','： 无序条件下 VS 有序条件 - 选择无序的 POC'];
                        condition_Exp = ['30Hz';'40Hz';'60Hz'];
                    case 8
                        bar(Ss_x{8},FOC_line_y,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
                        xticks(Ss_x{FOC_i}');xticklabels({'加速','减速','匀速'});
                        x_lim = [min(Ss_x{FOC_i})-1,max(Ss_x{FOC_i})+1];y_lim = [0,1.1];
                        xlim(x_lim);ylim(y_lim);xlabel('速度变化情况','fontsize',20);
                        y_label_i = ylabel('POC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.35,0.5];
                        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
                        errorbar(Ss_x{FOC_i},FOC_line_y,error_bar_FOC_all,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
                        title_10 = ['实验8','： 速度变化对时间知觉的影响POC'];
                        condition_Exp = ['1';'2';'3'];
                        condition_Exp_1 = ['顺';'顺';'逆';'逆'];%旋转
                        condition_Exp_2 = ['后';'前';'后';'前'];%顺序
                end
                set(gca,'FontSize',15);
                title(title_10,'FontSize',22);
                
                
                % 画散点
                hold on
                scatter_x = repmat(Ss_x{FOC_i}',size(FOC_line_y_n{FOC_i},1),1);
                scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
                scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
                scatter_y = FOC_line_y_n{FOC_i};
                scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
                scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
            else
                disp('被试量不足')
                return
            end
            
            % FOC的假设检验
            if var_p(FOC_i) >= 0.05
                % 方差分析
                condition_Exp = repmat(condition_Exp,FOC_line_num(FOC_i),1);%实验条件
                condition_Sub = reshape(repmat((1:FOC_line_num(FOC_i)),...
                    size(FOC_line_y_n{FOC_i},2),1),size(FOC_line_y_n{FOC_i},1)*size(FOC_line_y_n{FOC_i},2),1);
                FOC_line_y_n_F = reshape(FOC_line_y_n{FOC_i}',size(FOC_line_y_n{FOC_i},1)*size(FOC_line_y_n{FOC_i},2),1);
                [f_p{FOC_i},f_tbl{FOC_i},f_stats{FOC_i}] = anovan(FOC_line_y_n_F,{condition_Exp,condition_Sub},...
                    'model',1,'varnames',{'实验条件','被试'},'display','off');
            else
                % 非参检验
                [f_p{FOC_i},f_tbl{FOC_i},f_stats{FOC_i}] = friedman(FOC_line_y_n{FOC_i},1,'off');
            end
            [f_c{FOC_i},f_m{FOC_i},f_h{FOC_i},f_nms{FOC_i}]=multcompare(f_stats{FOC_i},'Display','off');%多重比较
%             xlswrite('FOC方差分析表.xlsx',f_tbl{FOC_i},FOC_i);
%             xlswrite('FOC多重比较表.xlsx',f_c{FOC_i},FOC_i);
            % 标明被试量和 p值
            sub_n = size(FOC_line_y_n{FOC_i},1);
            hold on
            sub_str = {['n = ',num2str(sub_n)],['p = ',num2str(f_p{FOC_i}(1))]};
            x_step = (x_lim(2)-x_lim(1))/100;
            fill([x_lim(1)+x_step,x_lim(1)+20*x_step,x_lim(1)+20*x_step,x_lim(1)+x_step],[y_lim(2)-0.01,y_lim(2)-0.01,y_lim(2)-0.11,y_lim(2)-0.11],[1,1,1] )
            text([x_lim(1)+x_step+0.02,x_lim(1)+x_step+0.02],[y_lim(2)-0.035,y_lim(2)-0.085],sub_str,'FontSize',15);
            % 画上显著性水平
            if FOC_i == 1,condition_draw = [1,2,3,4];else,condition_draw = Ss_x{FOC_i};end
            sig_i_all =  nchoosek(condition_draw,2);
            for ii = 1:size(sig_i_all,1),sig_i_all(ii,3) = ii;end
            a = [];
            if FOC_i == 1 || FOC_i == 2
                a(1,:) = sig_i_all(1,:);a(2,:) = sig_i_all(4,:);a(3,:) = sig_i_all(6,:);
                a(4,:) = sig_i_all(2,:);a(5,:) = sig_i_all(5,:);a(6,:) = sig_i_all(3,:);
            else
                a(1,:) = sig_i_all(1,:);a(2,:) = sig_i_all(3,:);a(3,:) = sig_i_all(2,:);
            end
            sig_i_all = a;
            x_sig_line = zeros(2,length(sig_i_all));y_sig_line = zeros(2,length(sig_i_all));
            y_sig_top = zeros(length(sig_i_all),1);star_position = zeros(length(sig_i_all),2);
            y_sig_num = 1;
            for sig_i = 1:length(sig_i_all)
                if f_c{FOC_i}(sig_i_all(sig_i,3),6) < 0.001
                    y_left = FOC_line_y(sig_i_all(sig_i,1))+error_bar_FOC_all(sig_i_all(sig_i,1));
                    y_right = FOC_line_y(sig_i_all(sig_i,2))+error_bar_FOC_all(sig_i_all(sig_i,2));
                    if y_sig_num>1
                        y_sig_top(y_sig_num) = max([y_left,y_right,y_sig_top(y_sig_num-1)])+0.05;
                    else
                        y_sig_top(y_sig_num) = max(y_left,y_right)+0.05;
                    end
                    x_sig_line(:,y_sig_num) = [Ss_x{FOC_i}(sig_i_all(sig_i,1));Ss_x{FOC_i}(sig_i_all(sig_i,2))];%[横线起点,横线终点]
                    y_sig_line(:,y_sig_num) = [y_sig_top(y_sig_num);y_sig_top(y_sig_num)];
                    star_str{y_sig_num} = '* * *';
                    star_position(y_sig_num,1) = sum(x_sig_line(:,y_sig_num))/2;
                    star_position(y_sig_num,2) = y_sig_top(y_sig_num)+0.02;
                    y_sig_num = y_sig_num + 1;
                elseif f_c{FOC_i}(sig_i_all(sig_i,3),6) < 0.001
                    y_left = FOC_line_y(sig_i_all(sig_i,1))+error_bar_FOC_all(sig_i_all(sig_i,1));
                    y_right = FOC_line_y(sig_i_all(sig_i,2))+error_bar_FOC_all(sig_i_all(sig_i,2));
                    if y_sig_num>1
                        y_sig_top(y_sig_num) = max([y_left,y_right,y_sig_top(y_sig_num-1)])+0.05;
                    else
                        y_sig_top(y_sig_num) = max(y_left,y_right)+0.05;
                    end
                    x_sig_line(:,y_sig_num) = [Ss_x{FOC_i}(sig_i_all(sig_i,1));Ss_x{FOC_i}(sig_i_all(sig_i,2))];%[横线起点,横线终点]
                    y_sig_line(:,y_sig_num) = [y_sig_top(y_sig_num);y_sig_top(y_sig_num)];
                    star_str{y_sig_num} = '* *';
                    star_position(y_sig_num,1) = sum(x_sig_line(:,y_sig_num))/2;
                    star_position(y_sig_num,2) = y_sig_top(y_sig_num)+0.02;
                    y_sig_num = y_sig_num + 1;
                elseif f_c{FOC_i}(sig_i_all(sig_i,3),6) < 0.05
                    y_left = FOC_line_y(sig_i_all(sig_i,1))+error_bar_FOC_all(sig_i_all(sig_i,1));
                    y_right = FOC_line_y(sig_i_all(sig_i,2))+error_bar_FOC_all(sig_i_all(sig_i,2));
                    if y_sig_num>1
                        y_sig_top(y_sig_num) = max([y_left,y_right,y_sig_top(y_sig_num-1)])+0.05;
                    else
                        y_sig_top(y_sig_num) = max(y_left,y_right)+0.05;
                    end
                    x_sig_line(:,y_sig_num) = [Ss_x{FOC_i}(sig_i_all(sig_i,1));Ss_x{FOC_i}(sig_i_all(sig_i,2))];%[横线起点,横线终点]
                    y_sig_line(:,y_sig_num) = [y_sig_top(y_sig_num);y_sig_top(y_sig_num)];
                    star_str{y_sig_num} = '*';
                    star_position(y_sig_num,1) = sum(x_sig_line(:,y_sig_num))/2;
                    star_position(y_sig_num,2) = y_sig_top(y_sig_num)+0.02;
                    y_sig_num = y_sig_num + 1;
                end
            end
            if y_sig_num ~= 1
                % 如果存在显著性，则画星号
                hold on
                x_sig_line(:,all(x_sig_line == 0,1)) = [];
                y_sig_line(:,all(y_sig_line == 0,1)) = [];
                star_position(all(star_position == 0,2),:) = [];
                line(x_sig_line,y_sig_line,'Color',[0.7,0.7,0.7],'LineWidth',2);
                for star_t_i = 1:size(star_position,1)
                    text(star_position(star_t_i,1)',star_position(star_t_i,2)',star_str{star_t_i},'FontSize',25,'HorizontalAlignment','center');
                end
            end
            if FOC_i <= 5
                %% 每个实验进行旋转和顺序的主效应检验
                % 正态性检验和方差齐性检验
                for j = 1:size(Exp_F_data{FOC_i},2)
                    var_Exp_h{FOC_i}(j) = lillietest(Exp_F_data{FOC_i}(:,j));
                    % h = 0表示符合正态分布,h = 1表示不符合正态分布
                end
                if  sum(var_Exp_h{FOC_i}==0) == size(Exp_F_data{FOC_i},2)
                    var_Exp_p(FOC_i) = vartestn(Exp_F_data{FOC_i},'Display','off');
                    % p > 0.05 表示方差齐性，p < 0.05表示方差不齐性
                else
                    var_Exp_p(FOC_i) = 0;
                end
                Ef_c1{FOC_i} = ones(1,6);Ef_c2{FOC_i} = ones(63,6);E_Chi_c1{FOC_i} = ones(1,6);E_Chi_c2{FOC_i} = ones(63,6);
                if var_Exp_p(FOC_i) >= 0.05
                    sprintf(['实验',num2str(FOC_i),'旋转和顺序数据采用参数检验'])
                    % 参数检验
                    condition_Exp_1 = repmat(condition_Exp_1,FOC_line_num(FOC_i),1);condition_Exp_2 = repmat(condition_Exp_2,FOC_line_num(FOC_i),1);
                    Exp_f_data = reshape(Exp_F_data{FOC_i}',size(Exp_F_data{FOC_i},1)*size(Exp_F_data{FOC_i},2),1);
                    [E_fp{FOC_i},E_ftb{FOC_i},E_fstats{FOC_i}] = anovan(Exp_f_data,{condition_Exp_1 condition_Exp_2},'model','full','varnames',{'旋转','顺序'},'display','off');
        %             EF_D1 = figure;
                    [Ef_c1{FOC_i},Ef_m1{FOC_i},Ef_h1{FOC_i},Ef_nms1{FOC_i}]=multcompare(E_fstats{FOC_i},'Dimension',1,'display','off');%多重比较
        %             EF_D2 = figure;
                    [Ef_c2{FOC_i},Ef_m2{FOC_i},Ef_h2{FOC_i},Ef_nms2{FOC_i}]=multcompare(E_fstats{FOC_i},'Dimension',2,'display','off');

    %                 xlswrite('旋转效应和顺序效应的方差分析表.xlsx',E_ftb{FOC_i},FOC_i);
    %                 xlswrite('旋转效应多重比较表.xlsx',Ef_c1{FOC_i},FOC_i);
    %                 xlswrite('顺序效应多重比较表.xlsx',Ef_c2{FOC_i},FOC_i);
                else
                    sprintf(['实验',num2str(FOC_i),'旋转和顺序数据采用非参数检验'])
                    % 非参检验

                    Exp_Chi_data_1_i = [];
                    data_i1 = size(Exp_Chi_data_1{FOC_i},1)/FOC_line_num(FOC_i);%另一个因素的水平数
                    for data_i = 1:data_i1
                        Exp_Chi_data_1_i = [Exp_Chi_data_1_i;Exp_Chi_data_1{FOC_i}(data_i:data_i1:size(Exp_Chi_data_1{FOC_i},1),:)];
                    end
                    Exp_Chi_data_2_i = [];
                    data_i2 = size(Exp_Chi_data_2{FOC_i},1)/FOC_line_num(FOC_i);%另一个因素的水平数
                    for data_i = 1:data_i2
                        Exp_Chi_data_2_i = [Exp_Chi_data_2_i;Exp_Chi_data_2{FOC_i}(data_i:data_i2:size(Exp_Chi_data_2{FOC_i},1),:)];
                    end
                    Exp_Chi_data_1_FOC{FOC_i} = Exp_Chi_data_1_i;Exp_Chi_data_2_FOC{FOC_i} = Exp_Chi_data_2_i;
                    [E_Chi_p_1{FOC_i},E_Chi_tb_1{FOC_i},E_Chi_stats_1{FOC_i}] = friedman(Exp_Chi_data_1_FOC{FOC_i},FOC_line_num(FOC_i),'off');% 旋转
                    [E_Chi_p_2{FOC_i},E_Chi_tb_2{FOC_i},E_Chi_stats_2{FOC_i}] = friedman(Exp_Chi_data_2_FOC{FOC_i},FOC_line_num(FOC_i),'off');% 顺序
                    [E_Chi_c1{FOC_i},E_Chi_m1{FOC_i},E_Chi_h1{FOC_i},E_Chi_nms1{FOC_i}]=multcompare(E_Chi_stats_1{FOC_i},'display','off');
                    [E_Chi_c2{FOC_i},E_Chi_m2{FOC_i},E_Chi_h2{FOC_i},E_Chi_nms2{FOC_i}]=multcompare(E_Chi_stats_2{FOC_i},'display','off');

    %                 xlswrite('旋转效应非参数检验表.xlsx',E_Chi_tb_1{FOC_i},FOC_i);
    %                 xlswrite('顺序效应非参数检验表.xlsx',E_Chi_tb_2{FOC_i},FOC_i);
    %                 xlswrite('旋转效应多重比较表.xlsx',E_Chi_c1{FOC_i},FOC_i);
    %                 xlswrite('顺序效应多重比较表.xlsx',E_Chi_c2{FOC_i},FOC_i);
                end


                % 旋转的简单效应
                if Ef_c1{FOC_i}(6)<0.05 && E_Chi_c1{FOC_i}(6) < 0.05,EF_S1 = '显著';else,EF_S1 = '不显著';end
                Ef_text_2 = ['旋转简单效应',EF_S1];
                % 顺序的简单效应
                if Ef_c2{FOC_i}(1,6)<0.05 && E_Chi_c2{FOC_i}(1,6)<0.05,EF_S1 = '顺序效应显著；';else,EF_S1 = '顺序效应不显著；';end
                Ef_text_3 = {['实验',num2str(FOC_i),'：'],Ef_text_2,EF_S1};
                text_fig = figure;
                hold on
                set(gca,'color','none')
                set(gcf,'Position',[200,50,1200,700]);
                axis off
                text(0,0.5,Ef_text_3,'FontSize',20)
            end
            %% 保存图片
            if save_picture == 1,print(all_FOC_fig,'-djpeg',title_10);end
%             figure
%             [f_c,f_m,f_h,f_nms]=multcompare(f_stats);%多重比较
        end
    end
    sprintf('H0：FOC可以采用参数检验\n实验1：p = %6.4f\n实验2：p = %6.4f\n实验3：p = %6.4f\n实验4：p = %6.4f\n实验5：p = %6.4f\n',...
        var_p(1),var_p(2),var_p(3),var_p(4),var_p(5))
    
    %% 实验3和实验4比较的图
    % 实验3和实验4相对应的条件之间做t检验
    if ~isempty(FOC_line_y_n{1,3}) && ~isempty(FOC_line_y_n{1,4})
        for tc_i = 1:3
            [tc_h(tc_i),tc_p(tc_i),tc_ci(:,tc_i),tc_stats(tc_i)] = ttest2(FOC_line_y_n{1,3}(:,tc_i),FOC_line_y_n{1,4}(:,tc_i));
        end
        error_bar_E3 = std(FOC_line_y_n{3});error_bar_E4 = std(FOC_line_y_n{4});
        FOC_line_y_3 = (sum(FOC_line_y_n{3},1)./FOC_line_num(3))';
        FOC_line_y_4= (sum(FOC_line_y_n{4},1)./FOC_line_num(4))';
        % 画图
        E3E4_fig = figure('name','实验3和实验4对比图');
        set(gcf,'Position',[200,50,1200,700]);
        hold on
        b_E3_x = [1,4,7];b_E4_x = [1.99,4.99,7.99];
        b_E3 = bar(b_E3_x,FOC_line_y_3,'FaceColor',[.45,.45,.45],'EdgeColor',[0,0,0],'BarWidth',0.33,'LineWidth',1.5);
        b_E4 = bar(b_E4_x,FOC_line_y_4,'FaceColor',[.75,.75,.75],'EdgeColor',[0,0,0],'BarWidth',0.33,'LineWidth',1.5);
        xticks([1.5,4.5,7.5]);xticklabels({'加速-相反','减速-相反','匀速'});
        x_lim = [-1,10];y_lim = [0,1.1];
        xlim(x_lim);ylim(y_lim);xlabel('速度变化','fontsize',20);
        y_label_i = ylabel('FOC','Rotation',0,'fontsize',20);y_label_i.Position = [-2,0.5];
        set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
    %     legend([b_E3,b_E4],'实验 3','实验 4','Location','southeast');
        % 画errorbar
        errorbar(b_E3_x,FOC_line_y_3,error_bar_E3,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
        errorbar(b_E4_x,FOC_line_y_4,error_bar_E4,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
        % 画散点
        scatter_x_E3 = repmat(b_E3_x,size(FOC_line_y_n{3},1),1);
        scatter_x_E3 = reshape(scatter_x_E3,1,size(scatter_x_E3,1)*size(scatter_x_E3,2));
        scatter_x_E3 = scatter_x_E3 + rand(1,length(scatter_x_E3)) .* 0.05 - 0.025;
        scatter_y_E3 = FOC_line_y_n{3};
        scatter_y_E3 = reshape(scatter_y_E3,1,size(scatter_y_E3,1)*size(scatter_y_E3,2));
        scatter(scatter_x_E3,scatter_y_E3,35,[0,0,0],'o','filled');
        scatter_x_E4 = repmat(b_E4_x,size(FOC_line_y_n{4},1),1);
        scatter_x_E4 = reshape(scatter_x_E4,1,size(scatter_x_E4,1)*size(scatter_x_E4,2));
        scatter_x_E4 = scatter_x_E4 + rand(1,length(scatter_x_E4)) .* 0.05 - 0.025;
        scatter_y_E4 = FOC_line_y_n{4};
        scatter_y_E4 = reshape(scatter_y_E4,1,size(scatter_y_E4,1)*size(scatter_y_E4,2));
        scatter(scatter_x_E4,scatter_y_E4,35,[0,0,0],'o','filled');
        % 画横线
        for bar_line_i = 1:3
            bar_E34_x = [b_E3_x(bar_line_i),b_E4_x(bar_line_i)];
            bar_E34_y_i = max(FOC_line_y_3(bar_line_i)+error_bar_E3(bar_line_i),FOC_line_y_4(bar_line_i)+error_bar_E4(bar_line_i));
            bar_E34_y = [bar_E34_y_i,bar_E34_y_i]+0.05;
            % 画星号及星号下的线
            if tc_h(bar_line_i) == 1
                if tc_p(bar_line_i) < 0.001
                    line(bar_E34_x,bar_E34_y,'Color',[0.7,0.7,0.7],'LineWidth',2);
                    bar_E34_str = '* * *';
                elseif tc_p(bar_line_i) < 0.01
                    line(bar_E34_x,bar_E34_y,'Color',[0.7,0.7,0.7],'LineWidth',2);
                    bar_E34_str = '* *';
                elseif tc_p(bar_line_i) < 0.05
                    line(bar_E34_x,bar_E34_y,'Color',[0.7,0.7,0.7],'LineWidth',2);
                    bar_E34_str = '*';
                end
                E34_s_x = sum(bar_E34_x)/2;E34_s_y = bar_E34_y_i + 0.06;
                text(E34_s_x,E34_s_y,bar_E34_str,'FontSize',25,'HorizontalAlignment','center');
            end
        end
        % 标明被试量和p值
        sub_n_3 = size(FOC_line_y_n{3},1);sub_n_4 = size(FOC_line_y_n{4},1);
        sub_str = {['实验3       n = ',num2str(sub_n_3)],['实验4       n = ',num2str(sub_n_4)],...
            ['加速-相反 p = ',num2str(tc_p(1))],['减速-相反 p = ',num2str(tc_p(2))],['匀速         p = ',num2str(tc_p(3))]};
        x_step = (x_lim(2)-x_lim(1))/100;
        fill_x_left = x_lim(1)+x_step;fill_x_right = x_lim(1)+x_step*25;
        fill_y_high = y_lim(2)-0.025;fill_y_low = y_lim(2)-0.25;
        text_x = fill_x_left+0.07;
        fill([fill_x_left,fill_x_right,fill_x_right,fill_x_left],[fill_y_high,fill_y_high,fill_y_low,fill_y_low],[1,1,1] )
        text([text_x,text_x,text_x,text_x,text_x],...
            [fill_y_high-0.03,fill_y_high-0.07,fill_y_high-0.11,fill_y_high-0.15,fill_y_high-0.19],sub_str,'FontSize',15);
        E3E4_le = legend([b_E3,b_E4],'实验 3','实验 4','Location','northeast');
        E3E4_le.FontSize = 15;
        legend('boxoff')%删除标识外的框线
        title_11 = '实验3和实验4结果比较';
        set(gca,'FontSize',15);
        title(title_11,'FontSize',22);
        if save_picture == 1,print(E3E4_fig,'-djpeg',title_11);end
    end
    %% 计算男女之间的差异
    for FOC_i = 1:5
        if ~isempty(FOC_line_y_n_W{FOC_i}) && ~isempty(FOC_line_y_n_M{FOC_i})
            WM_w = FOC_line_y_n_W{FOC_i};WM_m = FOC_line_y_n_M{FOC_i};
            %% 方差分析
            WM_w = reshape(WM_w',size(WM_w,1)*size(WM_w,2),1);
            WM_m = reshape(WM_m',size(WM_m,1)*size(WM_m,2),1);
            WM = [WM_w;WM_m];
            if FOC_i == 1 || FOC_i == 2
                g1 = ['1';'2';'3';'4'];g2_1 = ['女';'女';'女';'女'];g2_2 = ['男';'男';'男';'男'];
            else
                g1 = ['1';'2';'3'];g2_1 = ['女';'女';'女'];g2_2 = ['男';'男';'男'];
            end
            WM_g1 = repmat(g1,size(FOC_line_y_n_W{FOC_i},1)+size(FOC_line_y_n_M{FOC_i},1),1);
            WM_g2 = [repmat(g2_1,size(FOC_line_y_n_W{FOC_i},1),1);repmat(g2_2,size(FOC_line_y_n_M{FOC_i},1),1)];
    %         [WM_fp,WM_ftb,WM_fstats] = anovan(WM,{WM_g1 WM_g2},'model','full','varnames',{'实验条件','性别'});
            [WM_fp,WM_ftb,WM_fstats] = anovan(WM,{WM_g1 WM_g2},'model','full','varnames',{'实验条件','性别'},'display','off');

    %         figure('name','实验条件比较')
            [WM_f_c1,WM_f_m1,WM_f_h1,WM_f_nms1]=multcompare(WM_fstats,'Dimension',1,'display','off');%多重比较
    %         figure('name','性别')
            [WM_f_c2,WM_f_m2,WM_f_h2,WM_f_nms2]=multcompare(WM_fstats,'Dimension',2,'display','off');
%             figure('name','实验条件和性别')
            [WM_f_c3,WM_f_m3,WM_f_h3,WM_f_nms3]=multcompare(WM_fstats,'Dimension',[1,2],'display','off');
            % 通过实验条件和性别的分析，可以体现出每一种实验条件对应的性别的影响
%             if WM_fp(2) < 0.05,WM_str = ' 男女差异显著';else,WM_str = ' 男女差异不显著';end
%             disp(['方差分析：实验 ',num2str(FOC_i),WM_str,', p值为：',num2str(WM_fp(2))]);
            if WM_fp(2) < 0.05
                WM_str = ' 男女差异显著';
                disp(['方差分析：实验 ',num2str(FOC_i),WM_str,', p值为：',num2str(WM_fp(2))]);
            end
            %% t检验
            for WM_t_i = 1:size(FOC_line_y_n_W{FOC_i},2)
                [WM_h,WM_p,WM_ci,WM_stats] = ttest2(FOC_line_y_n_W{FOC_i}(:,WM_t_i),FOC_line_y_n_M{FOC_i}(:,WM_t_i));
%                 if WM_h == 1,WM_t_str = ' 男女差异显著';else,WM_t_str = ' 男女差异不显著';end
%                 disp(['t检验：实验 ',num2str(FOC_i),' 条件 ',num2str(WM_t_i),WM_t_str,', p值为：',num2str(WM_p)]);
                if WM_h == 1
                    WM_t_str = ' 男女差异显著';
                    disp(['t检验：实验 ',num2str(FOC_i),' 条件 ',num2str(WM_t_i),WM_t_str,', p值为：',num2str(WM_p)]);
                end
            end
%             disp('****************************************')
        end
    end
    if exist('WM_str') == 0 && exist('WM_t_str') == 0,disp('所有实验无男女差异');end
    
    
    
end
close(waitbar_h);


%% 算事件发生频率感觉阈限高于和低于30Hz的被试实验2结果是否有差异
if LowOrHigh == 1
    save('high_30','FOC_line_y_n','FOC_line_num')
elseif LowOrHigh == 2
    save('low_30','FOC_line_y_n','FOC_line_num')
elseif LowOrHigh == 3
    high_30 = load('high_30.mat');
    low_30 = load('low_30.mat');
    for FOC_i = 1:5
        if ~isempty(high_30.FOC_line_y_n{FOC_i}) && ~isempty(low_30.FOC_line_y_n{FOC_i})
            if FOC_i == 1
                tc_ii = 4;
                b_E3_x = [1,4,7,10];b_E4_x = [1.99,4.99,7.99,10.99];
                x_ticks = [1.5,4.5,7.5,10.5];x_ticklabels = {'15Hz','30Hz','60Hz','120Hz'};
                x_lim = [-1,13];y_lim = [0,1.1];x_label = '事件发生频率';
            elseif FOC_i == 2
                tc_ii = 4;
                b_E3_x = [1,4,7,10];b_E4_x = [1.99,4.99,7.99,10.99];
                x_ticks = [1.5,4.5,7.5,10.5];x_ticklabels = {'单次呈现','一致性重复','颜色不一致','位置不一致'};
                x_lim = [-1,13];y_lim = [0,1.1];x_label = '视觉刺激一致性';
            elseif FOC_i == 3
                tc_ii = 3;
                b_E3_x = [1,4,7];b_E4_x = [1.99,4.99,7.99];
                x_ticks = [1.5,4.5,7.5];x_ticklabels = {'匀加速','匀减速','匀速'};
                x_lim = [-1,10];y_lim = [0,1.1];x_label = '速度变化情况';
            elseif FOC_i == 4
                tc_ii = 3;
                b_E3_x = [1,4,7];b_E4_x = [1.99,4.99,7.99];
                x_ticks = [1.5,4.5,7.5];x_ticklabels = {'先加速后减速','先减速后加速','匀速'};
                x_lim = [-1,10];y_lim = [0,1.1];x_label = '速度变化情况';
            elseif FOC_i == 5
                tc_ii = 3;
                b_E3_x = [1,4,7];b_E4_x = [1.99,4.99,7.99];
                x_ticks = [1.5,4.5,7.5];x_ticklabels = {'40Hz','60Hz','120Hz'};
                x_lim = [-1,10];y_lim = [0,1.1];x_label = '事件发生频率';
            end
            for tc_i = 1:tc_ii
                [tc_h(tc_i),tc_p(tc_i),tc_ci(:,tc_i),tc_stats(tc_i)] = ttest2(high_30.FOC_line_y_n{FOC_i}(:,tc_i),low_30.FOC_line_y_n{FOC_i}(:,tc_i));
            end
            error_bar_high = std(high_30.FOC_line_y_n{FOC_i});error_bar_low = std(low_30.FOC_line_y_n{FOC_i});
            FOC_line_y_high = (sum(high_30.FOC_line_y_n{FOC_i},1)./high_30.FOC_line_num(FOC_i))';
            FOC_line_y_low= (sum(low_30.FOC_line_y_n{FOC_i},1)./low_30.FOC_line_num(FOC_i))';
            % 画图
            threshold_fig_name = ['阈限高低对于实验',num2str(FOC_i),'影响的对比图'];
            threshold_fig = figure('name',threshold_fig_name);
            set(gcf,'Position',[200,50,1200,700]);
            hold on
            b_E3 = bar(b_E3_x,FOC_line_y_high,'FaceColor',[.45,.45,.45],'EdgeColor',[0,0,0],'BarWidth',0.33,'LineWidth',1.5);
            b_E4 = bar(b_E4_x,FOC_line_y_low,'FaceColor',[.75,.75,.75],'EdgeColor',[0,0,0],'BarWidth',0.33,'LineWidth',1.5);
            xticks(x_ticks);xticklabels(x_ticklabels);
            xlim(x_lim);ylim(y_lim);xlabel(x_label,'fontsize',20);
            y_label_i = ylabel('FOC','Rotation',0,'fontsize',20);y_label_i.Position = [-2,0.5];
            set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
            %     legend([b_E3,b_E4],'实验 3','实验 4','Location','southeast');
            % 画errorbar
            errorbar(b_E3_x,FOC_line_y_high,error_bar_high,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
            errorbar(b_E4_x,FOC_line_y_low,error_bar_low,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
            % 画散点
            scatter_x_E3 = repmat(b_E3_x,size(high_30.FOC_line_y_n{FOC_i},1),1);
            scatter_x_E3 = reshape(scatter_x_E3,1,size(scatter_x_E3,1)*size(scatter_x_E3,2));
            scatter_x_E3 = scatter_x_E3 + rand(1,length(scatter_x_E3)) .* 0.05 - 0.025;
            scatter_y_E3 = high_30.FOC_line_y_n{FOC_i};
            scatter_y_E3 = reshape(scatter_y_E3,1,size(scatter_y_E3,1)*size(scatter_y_E3,2));
            scatter(scatter_x_E3,scatter_y_E3,35,[0,0,0],'o','filled');
            scatter_x_E4 = repmat(b_E4_x,size(low_30.FOC_line_y_n{FOC_i},1),1);
            scatter_x_E4 = reshape(scatter_x_E4,1,size(scatter_x_E4,1)*size(scatter_x_E4,2));
            scatter_x_E4 = scatter_x_E4 + rand(1,length(scatter_x_E4)) .* 0.05 - 0.025;
            scatter_y_E4 = low_30.FOC_line_y_n{FOC_i};
            scatter_y_E4 = reshape(scatter_y_E4,1,size(scatter_y_E4,1)*size(scatter_y_E4,2));
            scatter(scatter_x_E4,scatter_y_E4,35,[0,0,0],'o','filled');
            % 画横线
            for bar_line_i = 1:tc_ii
                bar_E34_x = [b_E3_x(bar_line_i),b_E4_x(bar_line_i)];
                bar_E34_y_i = max(FOC_line_y_high(bar_line_i)+error_bar_high(bar_line_i),FOC_line_y_low(bar_line_i)+error_bar_low(bar_line_i));
                bar_E34_y = [bar_E34_y_i,bar_E34_y_i]+0.05;
                % 画星号及星号下的线
                if tc_h(bar_line_i) == 1
                    if tc_p(bar_line_i) < 0.001
                        line(bar_E34_x,bar_E34_y,'Color',[0.7,0.7,0.7],'LineWidth',2);
                        bar_E34_str = '* * *';
                    elseif tc_p(bar_line_i) < 0.01
                        line(bar_E34_x,bar_E34_y,'Color',[0.7,0.7,0.7],'LineWidth',2);
                        bar_E34_str = '* *';
                    elseif tc_p(bar_line_i) < 0.05
                        line(bar_E34_x,bar_E34_y,'Color',[0.7,0.7,0.7],'LineWidth',2);
                        bar_E34_str = '*';
                    end
                    E34_s_x = sum(bar_E34_x)/2;E34_s_y = bar_E34_y_i + 0.06;
                    text(E34_s_x,E34_s_y,bar_E34_str,'FontSize',25,'HorizontalAlignment','center');
                end
            end
            % 标明被试量和p值
            sub_n_3 = size(high_30.FOC_line_y_n{FOC_i},1);sub_n_4 = size(low_30.FOC_line_y_n{FOC_i},1);
            if FOC_i == 1
                fill_y_low = y_lim(2)-0.29;
                text_xx = [text_x,text_x,text_x,text_x,text_x,text_x];
                text_yy = [fill_y_high-0.03,fill_y_high-0.07,fill_y_high-0.11,fill_y_high-0.15,fill_y_high-0.19,fill_y_high-0.23];
                sub_str = {['阈限高于30Hz：n = ',num2str(sub_n_3)],['阈限低于30Hz： n = ',num2str(sub_n_4)],...
                    ['15Hz  p = ',num2str(tc_p(1))],['30Hz  p = ',num2str(tc_p(2))],['60Hz  p = ',num2str(tc_p(3))],['120Hz p = ',num2str(tc_p(4))]};
            elseif FOC_i == 2
                fill_y_low = y_lim(2)-0.29;
                text_xx = [text_x,text_x,text_x,text_x,text_x,text_x];
                text_yy = [fill_y_high-0.03,fill_y_high-0.07,fill_y_high-0.11,fill_y_high-0.15,fill_y_high-0.19,fill_y_high-0.23];
                sub_str = {['阈限高于30Hz：n = ',num2str(sub_n_3)],['阈限低于30Hz： n = ',num2str(sub_n_4)],...
                    ['单次呈现    p = ',num2str(tc_p(1))],['一致性重复 p = ',num2str(tc_p(2))],['颜色不一致 p = ',num2str(tc_p(3))],['位置不一致 p = ',num2str(tc_p(4))]};
            elseif FOC_i == 3
                fill_y_low = y_lim(2)-0.25;
                text_xx = [text_x,text_x,text_x,text_x,text_x];
                text_yy = [fill_y_high-0.03,fill_y_high-0.07,fill_y_high-0.11,fill_y_high-0.15,fill_y_high-0.19];
                sub_str = {['阈限高于30Hz：n = ',num2str(sub_n_3)],['阈限低于30Hz： n = ',num2str(sub_n_4)],...
                    ['匀加速 p = ',num2str(tc_p(1))],['匀减速 p = ',num2str(tc_p(2))],['匀速  p = ',num2str(tc_p(3))]};
            elseif FOC_i == 4
                fill_y_low = y_lim(2)-0.25;
                text_xx = [text_x,text_x,text_x,text_x,text_x];
                text_yy = [fill_y_high-0.03,fill_y_high-0.07,fill_y_high-0.11,fill_y_high-0.15,fill_y_high-0.19];
                sub_str = {['阈限高于30Hz：n = ',num2str(sub_n_3)],['阈限低于30Hz： n = ',num2str(sub_n_4)],...
                    ['先加后减 p = ',num2str(tc_p(1))],['先减后加 p = ',num2str(tc_p(2))],['匀速运动  p = ',num2str(tc_p(3))]};
            elseif FOC_i == 5
                fill_y_low = y_lim(2)-0.25;
                text_xx = [text_x,text_x,text_x,text_x,text_x];
                text_yy = [fill_y_high-0.03,fill_y_high-0.07,fill_y_high-0.11,fill_y_high-0.15,fill_y_high-0.19];
                sub_str = {['阈限高于30Hz：n = ',num2str(sub_n_3)],['阈限低于30Hz： n = ',num2str(sub_n_4)],...
                    ['30Hz p = ',num2str(tc_p(1))],['40Hz p = ',num2str(tc_p(2))],['60Hz  p = ',num2str(tc_p(3))]};
            end
            x_step = (x_lim(2)-x_lim(1))/100;
            fill_x_left = x_lim(1)+x_step;fill_x_right = x_lim(1)+x_step*26;
            fill_y_high = y_lim(2)-0.025;
            text_x = fill_x_left+0.07;
            fill([fill_x_left,fill_x_right,fill_x_right,fill_x_left],[fill_y_high,fill_y_high,fill_y_low,fill_y_low],[1,1,1] )
            text(text_xx,text_yy,sub_str,'FontSize',15);
            E3E4_le = legend([b_E3,b_E4],'高于30Hz','低于30Hz','Location','northeast');
            E3E4_le.FontSize = 15;
            legend('boxoff')%删除标识外的框线
            set(gca,'FontSize',15);
            title(threshold_fig_name,'FontSize',22);
        end
    end
end


% %% 如果实验一方差不齐性，看是否后3个条件方差齐性
% if var_p(1) < 0.05
%     for j = 1:3
%         var_h_E1{1}(j) = lillietest(FOC_line_y_n{1}(:,j));
%         % h = 0表示符合正态分布,h = 1表示不符合正态分布
%     end
%     if  sum(var_h_E1{1}==0) == size(FOC_line_y_n{1},2)-1
%         var_p_E1(1) = vartestn(FOC_line_y_n{1}(:,2:4),'Display','off');
%         % p > 0.05 表示方差齐性，p < 0.05表示方差不齐性
%     else
%         var_p_E1(1) = 0;
%     end
% end
% var_n_E1 = nchoosek((1:4),2);
% for i = 1:size(var_n_E1,1)
%     var_p_E1(i) = vartestn(FOC_line_y_n{1}(:,var_n_E1(i,:)),'Display','off');
% end


%% 每个实验不同条件 errorbar 之间的差异

%% 转换程R进行运算的形式，并且保存.mat文件
if mat2R == 1
    FOC_ALL = FOC_line_y_n;FOC_table = cell(1,5);
    for i = 1:size(FOC_ALL,2)
        if i == 1
            table_name = {'Subject','15Hz','30Hz','60Hz','120Hz'};
            j = 5;
        elseif i == 2
            table_name = {'Subject','30Hz','Repetition','Discoloring','Translocation'};%{30Hz呈现1次，一致性重复，颜色不一致，位置不一致}
            j = 5;
        elseif i == 3
             table_name = {'Subject','Accelerate','Decelerate','Uniform'};
             j = 4;
        elseif i == 4
            table_name = {'Subject','Acc-Dec','Dec-Acc','Uniform'};
            j = 4;
        elseif i == 5
            table_name = {'Subject','30Hz','40Hz','60Hz'};
            j = 4;
        end
        sheet = ['Sheet',num2str(i)];
        FOC_table{i} = cell(size(data_file,2)+1,j);
        FOC_cell = num2cell(FOC_ALL{i}(:,:));
        FOC_table{i}(2:end,2:end) = num2cell(FOC_ALL{i});
        for jj = 2:size(data_file,2)+1
            FOC_table{i}{jj,1} = data_file{1, jj-1}(end-15:end-13);
        end
        FOC_table{i}(1,:) = table_name;
        xlswrite('FOC_table.xls', FOC_table{i},sheet);
    end
end

%% 有序无序实验的分析，整段注释掉了
% if ~ischar(f)
%     %% 无序实验条件是否与随机之间有差异
%     if size(FOC_line_y_n{1, 7},1)>1
%         draw_Data = [FOC_line_y_n{1, 7}(:,1);FOC_line_y_n{1, 7}(:,2);FOC_line_y_n{1, 7}(:,3)];
%         draw_Data(:,2) = randn(size(draw_Data,1),1).*std(draw_Data(:,1))+0.5;
%         draw_Mean = mean(draw_Data,1);
%         draw_SE = std(draw_Data,1);
% 
%         x_ = [0.5,1.3];
%         bar_color = [.45,.45,.45];dot_color = [0,0,0];
%         figure,hold on;
%         set(gcf,'Position',[200,50,1200,700]);
%         bar(x_,draw_Mean,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
%         xticks(x_);xticklabels({'选择无序时间更长','0.5 随机概率'});
%         x_lim = [0,1.8];y_lim = [0,1];
%         xlim(x_lim);ylim(y_lim);xlabel('是否有序','fontsize',20);
%         y_label_i = ylabel('POC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.2,0.5];
%         set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
%         errorbar(x_,draw_Mean,draw_SE,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
%         title_ = '有序 VS 无序，选择无序的 POC';
%         set(gca,'FontSize',15);
%         title(title_,'FontSize',22);
%         % 画散点
%         hold on
%         scatter_x = repmat(x_,size(draw_Data,1),1);% 有多少数据就复制为多少行
%         scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
%         scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
%         scatter_y = draw_Data;
%         scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
%         scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
%         [th,tp,ci,stats] = ttest(draw_Data(:,1),draw_Data(:,2));
% %         [th,tp,ci,stats] = ttest(bootstrp(1000,@median,draw_Data(:,1)),bootstrp(1000,@median,draw_Data(:,2)));
%         disp(['实验7：有序 VS 无序 t检验(与μ=0.5，σ=std() 正态分布比较) p = ',num2str(tp)]);
%         % 画显著性
%         y_1 = max(draw_Mean(1)+draw_SE(1),0.5);
%         y_ = [y_1,y_1]+0.05;
%         % 画星号及星号下的线
%         if th == 1
%             if tp < 0.001
%                 line(x_,y_,'Color',[0.7,0.7,0.7],'LineWidth',2);
%                 bar_str = '* * *';
%             elseif tp < 0.01
%                 line(x_,y_,'Color',[0.7,0.7,0.7],'LineWidth',2);
%                 bar_str = '* *';
%             elseif tp < 0.05
%                 line(x_,y_,'Color',[0.7,0.7,0.7],'LineWidth',2);
%                 bar_str = '*';
%             end
%             s_x = sum(x_)/2;s_y = y_1 + 0.06;
%             text(s_x,s_y,bar_str,'FontSize',25,'HorizontalAlignment','center');
%         end
%         % 标明被试量和p值
%         fill_y_low = y_lim(2)-0.13;
%         sub_str = {['n = ',num2str(size(FOC_line_y_n{1, 7},1))],['p = ',num2str(tp)]};
%         x_step = (x_lim(2)-x_lim(1))/100;
%         fill_x_left = x_lim(1)+x_step;fill_x_right = x_lim(1)+x_step*18;
%         fill_y_high = y_lim(2)-0.025;
%         text_yy = fill_y_high-0.05;
%         text_x = fill_x_left+0.02;
%         fill([fill_x_left,fill_x_right,fill_x_right,fill_x_left],[fill_y_high,fill_y_high,fill_y_low,fill_y_low],[1,1,1] )
%         text(text_x,text_yy,sub_str,'FontSize',15);
%         
%         %% 画散点图
%         figure,hold on;
%         set(gcf,'Position',[200,50,1200,700]);
%         plot((1:size(draw_Data,1)),draw_Data(:,1),'.','MarkerSize',25)
%         line([0,size(draw_Data,1)],[0.5,0.5],'LineStyle','--','Color',[0.6350 0.0780 0.1840],'LineWidth',2)
%     end
%     %% 将有序/无序比较的实验区分先后呈现，看先后呈现是否不同
%     if size(POC_7,1)>1 % 因为预先给了POC_7一行0，所以如果大于1行的时候，先把第一行去掉，剩下的才是真实的数据
%         %% 画每个条件的bar图
%         % 前3列是无序条件先呈现时在30/40/60Hz的时候被选择的概率
%         % 后3列是无序条件后呈现时在30/40/60Hz的时候被选择的概率
%         POC_7(1,:) = [];
%         POC7_Mean = mean(POC_7,1);
%         POC7_SE = std(POC_7,1);
%         % 画图
%         x_ = [0.5,1,1.5,2.5,3.0,3.5];
%         bar_color = [.45,.45,.45];
%         dot_color = [0,0,0];EdgeColor = [0 0 0];
%     %     bar_color = {[0 147 143]./255,[0 147 143]./255,[0 147 143]./255,[0 129 188]./255,[0 129 188]./255,[0 129 188]./255};
%         figure,hold on;
%         set(gcf,'Position',[200,50,1200,700]);
%         b = bar(x_,POC7_Mean,'FaceColor',bar_color,'EdgeColor',EdgeColor,'BarWidth',1,'LineWidth',2);
%     %     for k = 1:size(bar_color,2)
%     %         b.CData(k,:) = bar_color{k};
%     %     end
%         xticks(x_);xticklabels({'30Hz先','40Hz先','60Hz先','30Hz后','40Hz后','60Hz后'});
%         x_lim = [0,4.1];y_lim = [0,1];
%         xlim(x_lim);ylim(y_lim);xlabel('不同无序事件发生频率先后呈现','fontsize',20);
%         y_label_i = ylabel('POC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.3,0.5];
%         set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
%         errorbar(x_,POC7_Mean,POC7_SE,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
%         title_ = '有序 VS 无序，选择无序的 POC';
%         set(gca,'FontSize',15);
%         title(title_,'FontSize',22);
%         % 画散点
%         hold on
%         scatter_x = repmat(x_,size(POC_7,1),1);% 有多少数据就复制为多少行
%         scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
%         scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
%         scatter_y = POC_7;
%         scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
%         scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
%         % 做方差分析
% %         [p_7,tb_7] = anova1(POC_7,[],'off');
%         P0C_7ANOVA = [POC_7(:,1:3);POC_7(:,4:6)];
%         [p_7A,tbl_7A,stats_7A] = anova2(P0C_7ANOVA,size(POC_7,1));% Columns是频率，Rows是先后顺序
%         disp(['区分前后的无序/有序比较，F检验 频率p=',num2str(p_7A(1)),',顺序p=',num2str(p_7A(2)),',交互作用p=',num2str(p_7A(3))]);
%         %% 把交互作用的图画出来，横坐标是不同顺序，纵坐标是POC，不同的线是不同的频率
%         sc_color = {[255,94,105]./255,[7,182,75]./255,[0,169,255]./255};
%         int_fig = figure('Position',[100 100 1000 650]);hold on;
%         
%         pp1 = plot([1,2],POC7_Mean([1,4]),'Color',sc_color{1},'LineWidth',3);
%         scatter_x = repmat([1,2],size(POC_7,1),1);% 有多少数据就复制为多少行
%         scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
%         scatter_x = scatter_x + (rand(1,length(scatter_x))-0.5) .* 0.4;
%         scatter_y = POC_7(:,[1,4]);
%         scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
%         scatter(scatter_x,scatter_y,35,sc_color{1},'o','filled');
%         
%         pp2 = plot([1,2],POC7_Mean([2,5]),'Color',sc_color{2},'LineWidth',3);
%         scatter_x = repmat([1,2],size(POC_7,1),1);% 有多少数据就复制为多少行
%         scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
%         scatter_x = scatter_x + (rand(1,length(scatter_x))-0.5) .* 0.4;
%         scatter_y = POC_7(:,[2,5]);
%         scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
%         scatter(scatter_x,scatter_y,35,sc_color{2},'o','filled');
%         
%         pp3 = plot([1,2],POC7_Mean([3,6]),'Color',sc_color{3},'LineWidth',3);
%         scatter_x = repmat([1,2],size(POC_7,1),1);% 有多少数据就复制为多少行
%         scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
%         scatter_x = scatter_x + (rand(1,length(scatter_x))-0.5) .* 0.4;
%         scatter_y = POC_7(:,[3,6]);
%         scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
%         scatter(scatter_x,scatter_y,35,sc_color{3},'o','filled');
%         
%         xlim([0.5,2.5]);ylim([min(min(POC_7))-0.05,max(max(POC_7))+0.05]);
%         xticks([1,2]);xticklabels({'无序条件在前','无序条件在后'});
%         lgd = legend([pp1,pp2,pp3],{'30Hz','40Hz','60Hz'},'Location','best','FontSize',15);
%         title(lgd,'不同事件发生频率');
%         xlabel('先后顺序');ylabel('选择无序的 POC');
%         set(gca,'FontSize',15);
%         title('不同频率无序条件出现顺序不同时的POC','FontSize',22);
%         %% 将每个条件的数据画成散点图
% %         sub_n = size(POC_7,1);
% %         Gramm_data_1(:,1) = [POC_7(:,1);POC_7(:,2);POC_7(:,3)]; % 无序在前
% %         Gramm_data_1(:,2) = [POC_7(:,4);POC_7(:,5);POC_7(:,6)]; % 无序在后
% %         Gramm_data.color = [ones(sub_n,1).*30;ones(sub_n,1).*40;ones(sub_n,1).*60];% 不同条件设置不同颜色，30/40/60Hz
% %         num_max = max(max(POC_7));num_step = (num_max-0)/50;
% %         
% %         Gramm_data.x = Gramm_data_1(:,1);Gramm_data.y = Gramm_data_1(:,2);
% %         g=gramm('x',Gramm_data.x,'y',Gramm_data.y,'color',Gramm_data.color);
% % %         g.facet_grid([],cars.Origin_Region);% 设置不同的面板
% %         g.geom_point(); % 将数据转换为点，可以用g.geom_jitter()/geom_point()
% %         g.set_point_options('base_size',10);
% %         g.stat_glm('disp_fit',true); % 拟合并显示数据的广义线性模型。
% %         % g.stat_cornerhist(); % 在插入轴上显示x-y差异的直方图
% %         g.set_names('x','无序在前 POC','y','无序在后 POC','color','不同事件发生频率');
% %         g.set_title('不同事件发生频率条件下，有序 VS 无序 选择无序的概率');
% %         g.set_text_options('base_size',15);
% %         figure('Position',[100 100 1000 650]);
% %         g.draw();
%         %% 自己的程序
%         if true
%             sc_color = {[255,94,105]./255,[7,182,75]./255,[0,169,255]./255};
%             sub_n = size(POC_7,1);% 有多少被试
%             sc_data = {[POC_7(:,1),POC_7(:,4)],[POC_7(:,2),POC_7(:,5)],[POC_7(:,3),POC_7(:,6)]};%{30Hz[无序在前,无序在后],40Hz,60Hz}
%             % 产生散点坐标
%             Gramm_data_1(:,1) = [POC_7(:,1);POC_7(:,2);POC_7(:,3)]; % 无序在前
%             Gramm_data_1(:,2) = [POC_7(:,4);POC_7(:,5);POC_7(:,6)]; % 无序在后
%             num_max = max(max(Gramm_data_1));num_step = (num_max-0)/50; % 找到整个数据的最大值，用于计算之后点散开的标准距离
%             iii = 2;
%             while iii < sub_n*3
%                 tf = sum(ismember(Gramm_data_1(iii,:),Gramm_data_1(1:iii-1,:)));
%                 if tf ~= 0
%                     Gramm_data_1(iii,1) = Gramm_data_1(iii,1) + (rand(1,1)-0.5)*num_step;
%                     Gramm_data_1(iii,2) = Gramm_data_1(iii,2) + (rand(1,1)-0.5)*num_step;
%                 end
%                 iii = iii + 1;
%             end
%             sc_data_2 = {Gramm_data_1(1:sub_n,:),Gramm_data_1(sub_n+1:sub_n*2,:),Gramm_data_1(sub_n*2+1:sub_n*3,:)};
%             scatter_fig = figure('Position',[100 100 1000 650]);hold on;
%             for sc_i = 1:size(sc_data,2)
%                 
%                 % 线性回归模型进行拟合，计算置信区间，并画出
%                 mdl = fitlm(sc_data{sc_i}(:,1),sc_data{sc_i}(:,2),'RobustOpts','on');
%                 mdl_ = anova(mdl,'summary');
%                 p = mdl.Coefficients.Estimate';
%                 result(sc_i).Coefficients = mdl.Coefficients;
%                 result(sc_i).VariableNames = mdl.VariableNames;% x1,x2……xn,y
%                 result(sc_i).DFE = mdl.DFE; % Error degrees of freedom
%                 result(sc_i).RMSE = mdl.RMSE; % Root Mean Squared Error
%                 result(sc_i).Rsquared = mdl.Rsquared; % R-squared & Adjusted R-Squared
%                 result(sc_i).F = mdl_;% mdl_({'Model'},'F')可以读取
%                 [sc_S,sc_X,sc_Y,sc_CI] = Draw_CI(sc_data{sc_i}(:,1),sc_data{sc_i}(:,2),fliplr(p));
%                 % 画图
%                 sc_p(sc_i) = plot(sc_X,sc_Y,'Color',sc_color{sc_i},'LineWidth',3);
%                 areafill_cur = fill([sc_X' fliplr(sc_X')],[sc_Y' - sc_CI' ,fliplr(sc_Y' + sc_CI')],sc_color{sc_i});
%                 areafill_cur.FaceAlpha=0.2;
%                 areafill_cur.EdgeColor='none';
%                 areafill_cur.HandleVisibility = 'off';
%                 % 画散点图
%                 plot(sc_data_2{sc_i}(:,1),sc_data_2{sc_i}(:,2),'.','MarkerSize',25,'Color',sc_color{sc_i});
%             end
%             %% 把方程表示出来
%             for lgd_i = 1:size(result,2)
%                 for lgd_ii = 1:size(result(lgd_i).Coefficients.Estimate)
%                     if lgd_ii == 1
%                         result(lgd_i).con = result(lgd_i).Coefficients.Estimate(lgd_ii);
%                         result(lgd_i).result = num2str(result(lgd_i).con);
%                     else
%                         result(lgd_i).sc_b{lgd_ii-1} = [num2str(result(lgd_i).Coefficients.Estimate(lgd_ii)),'*',result(lgd_i).VariableNames{lgd_ii-1}];
%                         if result(lgd_i).Coefficients.Estimate(lgd_ii)>0
%                             result(lgd_i).sc_b{lgd_ii-1} = ['+',result(lgd_i).sc_b{lgd_ii-1}];
%                         end
%                         result(lgd_i).result = [result(lgd_i).result,result(lgd_i).sc_b{lgd_ii-1},', Rsquared = ',num2str(result(lgd_i).Rsquared.Ordinary)];
%                     end
%                 end
%             end
% 
%             lgd_t = {['30Hz: y = ',result(1).result],['40Hz: y = ',result(2).result],['60Hz: y = ',result(3).result]};
%             lgd = legend([sc_p(1),sc_p(2),sc_p(3)],lgd_t,'Location','best','FontSize',10);
%             title(lgd,'不同事件发生频率');
%             %% 其他设置
%             xlabel('无序条件在前时的 POC');ylabel('无序条件在后时的 POC');
%             set(gca,'FontSize',15);
%             title('不同频率 有序VS无序 的POC','FontSize',22);
%         end % 画不同事件发生频率有序与无序比较的散点图
%         %% 分成有序/无序进行画图、分析
% %         % 将数据转换为两列，即无序在前/在后
% %         POC_7_t = [POC_7(:,[1,4]);POC_7(:,[2,5]);POC_7(:,[3,6])];
% %         POC_7_tMean = mean(POC_7_t,1);
% %         POC_7_tSE = std(POC_7_t,1);
% %         x_ = [0.5,1.3];
% %         bar_color = [.45,.45,.45];dot_color = [0,0,0];
% %         figure,hold on;
% %         set(gcf,'Position',[200,50,1200,700]);
% %         bar(x_,POC_7_tMean,'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
% %         xticks(x_);xticklabels({'无序条件在前','无序条件在后'});
% %         x_lim = [0,1.8];y_lim = [0,1];
% %         xlim(x_lim);ylim(y_lim);xlabel('无序条件先/后呈现','fontsize',20);
% %         y_label_i = ylabel('POC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.2,0.5];
% %         set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
% %         errorbar(x_,POC_7_tMean,POC_7_tSE,'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
% %         title_ = '有序 VS 无序，选择无序的 POC';
% %         set(gca,'FontSize',15);
% %         title(title_,'FontSize',22);
% %         % 画散点
% %         hold on
% %         scatter_x = repmat(x_,size(POC_7_t,1),1);% 有多少数据就复制为多少行
% %         scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
% %         scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
% %         scatter_y = POC_7_t;
% %         scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
% %         scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
% %         % 做 t 检验
% %         [h_7,tp_7,ci_7,stats_7] = ttest(POC_7_t(:,1),POC_7_t(:,2));
% %         disp(['区分前后的无序/有序比较，t检验 p = ',num2str(tp_7)]);
%         
%     end % if size(POC_7,1)>1 ，对实验7进行画图/分析
%     
%     %% 画不同时间发生频率时有序VS无序的POC直方图
% %     clearvars -except FOC_line_y_n
% %     POC_x = (0.05+0.025:0.05:0.95+0.025)';
% %     POC_y = [2	0	0;0	0	0;1	1	0;0	1	1;0	1	1;0	0	1;2	0	2;...
% %             0	3	3;2	3	1;3	2	5;6	3	2;5	3	2;1	4	2;0	5	1;...
% %             4	2	3;0	1	5;1	0	0;2	1	1;1	0	0];
%     POC_D = zeros(size(FOC_line_y_n{1, 7},1),3);
%     POC_D(:,1) = FOC_line_y_n{1, 7}(:,1);
%     POC_D(:,2) = FOC_line_y_n{1, 7}(:,2);
%     POC_D(:,3) = FOC_line_y_n{1, 7}(:,3);
%     POC_1 = [FOC_line_y_n{1, 7}(:,1);FOC_line_y_n{1, 7}(:,2);FOC_line_y_n{1, 7}(:,3)];
%     POC_x = (min(POC_1)+0.025:0.05:max(POC_1)+0.025)';% 形成x轴判断条件
%     POC_y = zeros(size(POC_x,1),3);
%     for i = 1:3 % 3种事件发生频率
%         for ii = 1:size(POC_x,1) % 每一个x轴判断条件
%             POC_y(ii,i) = length(find(POC_D(:,i)>POC_x(ii)-0.05 & POC_D(:,i)<POC_x(ii)));
%         end
%     end
%     
%     POC_Bar = figure('Position',[100 100 1000 650]);hold on;
%     POC_Bar1 = bar(POC_x,POC_y,1,'stacked','FaceColor','flat','FaceAlpha',0.5,'LineStyle','none','EdgeAlpha',0);
%     sc_color = {[255,94,105]./255,[7,182,75]./255,[0,169,255]./255};
%     for i = 1:3
%         POC_Bar1(i).CData = repmat(sc_color{i},size(POC_Bar1(i).CData,1),1);
%     end
%     legend({'30Hz','40Hz','60Hz'},'Location','best','FontSize',10);
%     xlabel('选择无序条件时间更长的POC');ylabel('被试数量');
%     set(gca,'FontSize',15);
%     title('选择无序条件时间更长POC分布','FontSize',22);
%     POC_x_R= repmat(POC_x-0.025,1,3);
%     POC_y_mean = sum(POC_x_R.*POC_y)./30; % 3种事件发生频率选择无序的POC均值
%     POC_y_median = median(POC_D); % 3种事件发生频率选择无序的POC的中位数
% %     POC_1 = [FOC_line_y_n{1, 7}(:,1);FOC_line_y_n{1, 7}(:,2);FOC_line_y_n{1, 7}(:,3)];
% %     figure
% %     POC_Bar2 = histogram(POC_1,'BinWidth',0.05);
% %     POC_Bar2_y = POC_Bar2.BinCounts';
% %     POC_Bar1_y = sum(POC_y,2);
%     %% 累积分布函数
% %     POC_x = (0.05:0.05:0.95)';
% % %     POC_y = [0.55 0.45 0.5;0.15 0.2 0.2;0.5 0.4 0.4;0.5 0.5 0.45;...
% % %         0.6 0.7 0.5;0.6 0.7 0.8;0.45 0.6 0.35;0.9 0.7 0.8;0.75 0.9 0.9;...
% % %         0.75 0.6 0.8;0.55 0.65 0.8;0.45 0.55 0.75;0.55 0.65 0.6;...
% % %         0.85 0.65 0.7;0.6 0.45 0.5;0.5 0.5 0.5;0.6 0.75 0.8;...
% % %         0.55 0.65 0.5;0.65 0.45 0.4;0.55 0.55 0.55;0.05 0.15 0.25;...
% % %         0.75 0.75 0.65;0.55 0.6 0.4;0.95 0.8 0.75;0.9 0.7 0.65;...
% % %         0.05 0.4 0.3;0.35 0.25 0.35;0.35 0.4 0.55;0.75 0.7 0.6;0.6 0.55 0.75];
% %     POC_y = [2	0	0;0	0	0;1	1	0;0	1	1;0	1	1;0	0	1;2	0	2;...
% %         0	3	3;2	3	1;3	2	5;6	3	2;5	3	2;1	4	2;0	5	1;...
% %         4	2	3;0	1	5;1	0	0;2	1	1;1	0	0];
% %     ff = @(beta,x)(1+erf((x-beta(1))/beta(2)/2^0.5))/2;
% % %     ff = @(beta,x)cdf('Logistic',x,beta(1),beta(2));
% %     draw_x = linspace(0,1,1000); 
% %     sc_color = {[255,94,105]./255,[7,182,75]./255,[0,169,255]./255};
% %     figure;hold on;set(gcf,'Position',[300,150,1000,600]);
% %     for y_i = 1:size(POC_y,2)
% %         for y_ii = 1:size(POC_y,1)
% %             POC_Dy(y_ii,y_i) = sum(POC_y(1:y_ii,y_i));
% %         end
% %         [beta{y_i},pp_unique{y_i},R{y_i},J{y_i}] = nlinfit_beta(POC_x,POC_Dy(:,y_i),ff,[1,10],POC_x);% nlinfit 非线性回归
% %         PL(y_i) = plot(draw_x,ff(beta{y_i},draw_x),'-','linewidth',4,'Color',sc_color{y_i});% 画出拟合后的图
% %         scatter(POC_x,POC_Dy(:,y_i)./30,'MarkerFaceColor',sc_color{y_i},'MarkerEdgeColor',sc_color{y_i})
% %     end
% %     legend([PL(1),PL(2),PL(3)],{'30Hz','40Hz','60Hz'},'Location','best','FontSize',10);
%     
%     
%     
%     
%     
%     
%     
%     %%
%     disp(['一共有 ',num2str(size(POC_7,1)),' 名被试参加第7个实验'])
%     
% end







%% 无序刺激和有序刺激呈现 bar 图
load('NF.mat');
NewData = [NF,1-NF];
NewData2 = reshape(NF,size(NF,1)*size(NF,2),1);
NewData2 = [NewData2,1-NewData2];
bar_color = [.45,.45,.45];dot_color = [0,0,0];
figure;hold on;
x_ticks = [1,2,3,5,6,7,9,10];
bar(x_ticks,[mean(NewData,1),mean(NewData2,1)],'FaceColor',bar_color,'EdgeColor',bar_color,'BarWidth',0.6)
xticks(x_ticks);xticklabels({'无序30Hz','无序40Hz','无序60Hz','有序30Hz','有序40Hz','有序60Hz','无序','有序'});
% x_lim = [min(Ss_x{FOC_i})-1,max(Ss_x{FOC_i})+1];xlim(x_lim);
y_lim = [0,1.1];ylim(y_lim);
xlabel('实验条件','fontsize',20);
y_label_i = ylabel('POC','Rotation',0,'fontsize',20);y_label_i.Position = [-0.35,0.5];
set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
errorbar(x_ticks,[mean(NewData,1),mean(NewData2,1)],[std(NewData,1),std(NewData2,1)],'Color','k','LineStyle','none','LineWidth',2,'CapSize',15)
title_10 = '是否存在时空信息整合';
set(gca,'FontSize',15);
title(title_10,'FontSize',22);
hold on
scatter_x = repmat(x_ticks(1:6),size(NewData,1),1);
scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.2 - 0.1;
scatter_y = NewData;
scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
scatter(scatter_x,scatter_y,35,dot_color,'o','filled');
hold on
scatter_x = repmat(x_ticks(7:8),size(NewData2,1),1);
scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.2 - 0.1;
scatter_y = NewData2;
scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
scatter(scatter_x,scatter_y,35,dot_color,'o','filled');





