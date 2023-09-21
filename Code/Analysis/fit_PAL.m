%% 
clc;clear;

%%
% save_picture = 0;
ParOrNonPar = 1;%是否检验参数
save_Threshold = 0;%是否保存当前被试的感觉阈限

alpha_level = 0.02;
beta_level = (15:0.02:30);
gamma_level = (0:0.01:0.1);
lambda_level = (0:0.01:0.1);
%%
[f, p1] = uigetfile('.mat','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p1, f);
cd(p1);
waitbar_h=waitbar(0,'waittttttttttttt....');
if ischar(f)
    disp('f is char')
    disp(['当前打开的文件为：',f]);
    data = open(data_file);
    %% 确定当前被试的代码
    t_num = strfind(data_file,'_behave');
    subject_name = data_file(t_num-3:t_num-1);%读取 '_behave' 前面的名称，确定被试代码
    %% 读取数据进行计算
    Dot_num = zeros(1,size(data.behave.data,2));
    for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
    Dot_num = unique(Dot_num);%得到有哪些条件，这些条件都是表示多少个点
    time = data.behave.data(1).UserVars.time;%读取当前实验一共呈现多少s
    answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
    answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
    answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);
    %第一行是每个条件选择左键的次数，第二行是每个条件选择右键的次数
    %% 设置拟合参数
    x = Dot_num./time;
    StimLevels = log(x);
    NumPos = answer_1(2,:);
    OutOfNum = sum(answer_1);
    paramsFree = [1 1 1 0];
    searchGrid.alpha = (min(StimLevels)+0.2:alpha_level:max(StimLevels)-0.2);
    searchGrid.beta = beta_level;%扩大参数的范围，看拟合的结果是否会变化
    searchGrid.gamma = gamma_level;%扩大参数的范围，看拟合的结果是否会变好
    searchGrid.lambda = lambda_level; %lapse rate, safe as 0 (or 0.02)
    PF = @PAL_Logistic;% 用哪种函数拟合
%     PF = @PAL_Weibull;% 用哪种函数拟合
    
    %% 进行曲线拟合
    disp('Fitting function.....');
    [paramsValues, LLW] = PAL_PFML_Fit(StimLevels,NumPos,OutOfNum,searchGrid,paramsFree, PF);
    %曲线拟合，利用PF这种函数进行拟合，得到拟合方程的参数 paramsFittedW
    disp('done:')
    message = sprintf('0.50 Threshold estimate: %6.4f\n',exp(paramsValues(1)));
    fprintf(message);
    message = sprintf('Slope estimate: %6.4f\n',paramsValues(2));
    fprintf(message);
    
%     %% 多次循环，计算 阈限、斜率、猜测率和错误率的值的误差估计
%     B=100;
%     disp('Determining standard errors.....');
%     if ParOrNonPar == 1
%         [SD,paramsSim,LLSim,converged] = PAL_PFML_BootstrapParametric(...
%             StimLevels, OutOfNum, paramsValues, paramsFree, B, PF, ...
%             'searchGrid', searchGrid);
%         % paramsSim：所有B次模拟数据进行拟合之后的参数，是B*4的矩阵。
%         % converged：是否收敛（拟合成功）。成功为1，不成功为0.
%     else
%         [SD,paramsSim,LLSim,converged] = PAL_PFML_BootstrapNonParametric(...
%             StimLevels, NumPos, OutOfNum, [], paramsFree, B, PF,...
%             'searchGrid',searchGrid);
%     end
%     disp('done:');
%     message = sprintf('Standard error of Threshold: %6.4f\n',SD(1));
%     fprintf(message);
%     message = sprintf('Standard error of Slope: %6.4f\n',SD(2));
%     fprintf(message);
    
%     %% 拟合优度检验
%     B=100;
%     disp('Determining Goodness-of-fit.....');
%     [Dev,pDev] = PAL_PFML_GoodnessOfFit(StimLevels, NumPos, OutOfNum, ...
%         paramsValues, paramsFree, B, PF, 'searchGrid', searchGrid);
%     disp('done:');
%     %Put summary of results on screen
%     message = sprintf('Deviance: %6.4f\n',Dev);
%     fprintf(message);
%     message = sprintf('p-value: %6.4f\n',pDev);
%     fprintf(message);
    
    %% 画图
    X=(min(StimLevels):(max(StimLevels)-min(StimLevels))/1000:max(StimLevels));
    pYesValue =PF(paramsValues,X);
    p_i = roundn(pYesValue,-2);%在第二位小数的位置进行四舍五入
    Threshold = X(find(p_i==0.75,1));
    Threshold_num = exp(Threshold);
    right_rate = roundn(NumPos./OutOfNum,-2);
    
    fig = figure('name','Maximum Likelihood Psychometric Function Fitting');
    set(gcf,'Position',[300,150,1000,600]);
    set(gca, 'fontsize',16);
    hold on
    plot(X,pYesValue,'-','color',[0 .7 0],'linewidth',4)%画出拟合之后的曲线
    plot(StimLevels,NumPos./OutOfNum,'k.','markersize',40)%画出各个数据点
    marker_text2 = num2cell(right_rate);
    text(StimLevels-0.02,right_rate+0.04,marker_text2,'FontSize',16,'Color','k');
    line_x2 = [min(StimLevels)-0.1,Threshold,Threshold,Threshold];%横线，竖线
    line_y2 = [0.75,0.75,0.75,-0.02];%横线，竖线
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2);
    text_x2 = [StimLevels(1),Threshold+0.1];
    text_y2 = [0.78,0.35];
    str2 = {'确认率为 0.75',['感觉阈限为：' num2str(Threshold_num) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
%     set(gca, 'Xtick',StimLevels);
    xticks(StimLevels);xticklabels(num2cell(x));
    axis([min(StimLevels)-0.1 max(StimLevels)+0.1 -0.02 1.05]);
    xlabel('事件发生频率(Hz)');
    ylabel('选择概率');
    legend('Logistic拟合','选择概率','75%感觉阈限','Location','southeast');
    title_str2 = [subject_name ' 事件发生频率感觉阈限(对数坐标)'];
    title(title_str2);
    message = sprintf('0.75 Threshold estimate: %6.4f\n',Threshold_num);
    fprintf(message);
else
    disp('f ~ischar')
    NumPos = zeros(size(data_file,2),7);
    OutOfNum = zeros(size(data_file,2),7);
    for i = 1:size(data_file,2)
        waitbar(i/size(data_file,2));
        disp(['当前打开的文件为：',f(i)]);
        %% 读取数据进行计算
        data_name = char(data_file(i));
        data = open(data_name);
        Dot_num = zeros(1,size(data.behave.data,2));
        for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
        Dot_num = unique(Dot_num);%得到有哪些条件，这些条件都是表示多少个点
        time = data.behave.data(1).UserVars.time;%读取当前实验一共呈现多少s
        answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
        answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
        answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);%得到每个条件选择右键的次数
        x = Dot_num./time;
        StimLevels = log(x);
        NumPos(i,:) = answer_1(2,:);
        OutOfNum(i,:) = sum(answer_1);
        
    end
    paramsFree = [1 1 1 0];
    searchGrid.alpha = (min(StimLevels)+0.2:alpha_level:max(StimLevels)-0.2);
    searchGrid.beta = beta_level;%扩大参数的范围，看拟合的结果是否会变化
    searchGrid.gamma = gamma_level;%扩大参数的范围，看拟合的结果是否会变好
    searchGrid.lambda = lambda_level; %lapse rate, safe as 0 (or 0.02)
    PF = @PAL_Logistic;% 用哪种函数拟合
%     PF = @PAL_Weibull;% 用哪种函数拟合
    %% 进行曲线拟合
    disp('Fitting function.....');
    NumPos_all = sum(NumPos);OutOfNum_all = sum(OutOfNum);
    [paramsValues, LLW] = PAL_PFML_Fit(StimLevels,NumPos_all,OutOfNum_all,searchGrid,paramsFree, PF);
    %曲线拟合，利用PF这种函数进行拟合，得到拟合方程的参数 paramsFittedW
    disp('done:')
    message = sprintf('0.50 Threshold estimate: %6.4f\n',exp(paramsValues(1)));
    fprintf(message);
    message = sprintf('Slope estimate: %6.4f\n',paramsValues(2));
    fprintf(message);
%     %% 多次循环，计算 阈限、斜率、猜测率和错误率的值的误差估计
%     B=100;
%     disp('Determining standard errors.....');
%     if ParOrNonPar == 1
%         [SD,paramsSim,LLSim,converged] = PAL_PFML_BootstrapParametric(...
%             StimLevels, OutOfNum_all, paramsValues, paramsFree, B, PF, ...
%             'searchGrid', searchGrid);
%         % paramsSim：所有B次模拟数据进行拟合之后的参数，是B*4的矩阵。
%         % converged：是否收敛（拟合成功）。成功为1，不成功为0.
%     else
%         [SD,paramsSim,LLSim,converged] = PAL_PFML_BootstrapNonParametric(...
%             StimLevels, NumPos_all, OutOfNum_all, [], paramsFree, B, PF,...
%             'searchGrid',searchGrid);
%     end
%     disp('done:');
%     message = sprintf('Standard error of Threshold: %6.4f\n',SD(1));
%     fprintf(message);
%     message = sprintf('Standard error of Slope: %6.4f\n',SD(2));
%     fprintf(message);
%     
%     %% 拟合优度检验
%     B=100;
%     disp('Determining Goodness-of-fit.....');
%     [Dev,pDev] = PAL_PFML_GoodnessOfFit(StimLevels, NumPos_all, OutOfNum_all, ...
%         paramsValues, paramsFree, B, PF, 'searchGrid', searchGrid);
%     disp('done:');
%     %Put summary of results on screen
%     message = sprintf('Deviance: %6.4f\n',Dev);
%     fprintf(message);
%     message = sprintf('p-value: %6.4f\n',pDev);
%     fprintf(message);

    %% 画图
    X=(min(StimLevels):(max(StimLevels)-min(StimLevels))/1000:max(StimLevels));
    pYesValue =PF(paramsValues,X);
    p_i = roundn(pYesValue,-2);%在第二位小数的位置进行四舍五入
    Threshold = X(find(p_i==0.75,1));
    Threshold_num = exp(Threshold);
    right_rate = roundn(NumPos_all./OutOfNum_all,-2);
    
    fig = figure('name','Maximum Likelihood Psychometric Function Fitting');
    set(gcf,'Position',[300,150,1000,600]);
    set(gca, 'fontsize',16);
    hold on
    plot(X,pYesValue,'-','color',[0 .7 0],'linewidth',4)%画出拟合之后的曲线
    plot(StimLevels,NumPos_all./OutOfNum_all,'k.','markersize',40)%画出各个数据点
    marker_text2 = num2cell(right_rate);
    text(StimLevels-0.02,right_rate+0.04,marker_text2,'FontSize',16,'Color','k');
    line_x2 = [min(StimLevels)-0.1,Threshold,Threshold,Threshold];%横线，竖线
    line_y2 = [0.75,0.75,0.75,-0.02];%横线，竖线
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2);
    text_x2 = [StimLevels(1),Threshold+0.1];
    text_y2 = [0.78,0.35];
    str2 = {'确认率为 0.75',['感觉阈限为：' num2str(Threshold_num) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
%     set(gca, 'Xtick',StimLevels);
    xticks(StimLevels);xticklabels(num2cell(x));
    axis([min(StimLevels)-0.1 max(StimLevels)+0.1 -0.02 1.05]);
    xlabel('事件发生频率(Hz)');
    ylabel('选择概率');
    legend('Logistic拟合','选择概率','75%感觉阈限','Location','southeast');
    title_str2 =  ' 事件发生频率感觉阈限(对数坐标)';
    title(title_str2);
    message = sprintf('0.75 Threshold estimate: %6.4f\n',Threshold_num);
    fprintf(message);
    
end
close(waitbar_h);


