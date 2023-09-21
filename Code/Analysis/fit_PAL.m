%% 
clc;clear;

%%
% save_picture = 0;
ParOrNonPar = 1;%�Ƿ�������
save_Threshold = 0;%�Ƿ񱣴浱ǰ���Եĸо�����

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
    disp(['��ǰ�򿪵��ļ�Ϊ��',f]);
    data = open(data_file);
    %% ȷ����ǰ���ԵĴ���
    t_num = strfind(data_file,'_behave');
    subject_name = data_file(t_num-3:t_num-1);%��ȡ '_behave' ǰ������ƣ�ȷ�����Դ���
    %% ��ȡ���ݽ��м���
    Dot_num = zeros(1,size(data.behave.data,2));
    for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
    Dot_num = unique(Dot_num);%�õ�����Щ��������Щ�������Ǳ�ʾ���ٸ���
    time = data.behave.data(1).UserVars.time;%��ȡ��ǰʵ��һ�����ֶ���s
    answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
    answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
    answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);
    %��һ����ÿ������ѡ������Ĵ������ڶ�����ÿ������ѡ���Ҽ��Ĵ���
    %% ������ϲ���
    x = Dot_num./time;
    StimLevels = log(x);
    NumPos = answer_1(2,:);
    OutOfNum = sum(answer_1);
    paramsFree = [1 1 1 0];
    searchGrid.alpha = (min(StimLevels)+0.2:alpha_level:max(StimLevels)-0.2);
    searchGrid.beta = beta_level;%��������ķ�Χ������ϵĽ���Ƿ��仯
    searchGrid.gamma = gamma_level;%��������ķ�Χ������ϵĽ���Ƿ����
    searchGrid.lambda = lambda_level; %lapse rate, safe as 0 (or 0.02)
    PF = @PAL_Logistic;% �����ֺ������
%     PF = @PAL_Weibull;% �����ֺ������
    
    %% �����������
    disp('Fitting function.....');
    [paramsValues, LLW] = PAL_PFML_Fit(StimLevels,NumPos,OutOfNum,searchGrid,paramsFree, PF);
    %������ϣ�����PF���ֺ���������ϣ��õ���Ϸ��̵Ĳ��� paramsFittedW
    disp('done:')
    message = sprintf('0.50 Threshold estimate: %6.4f\n',exp(paramsValues(1)));
    fprintf(message);
    message = sprintf('Slope estimate: %6.4f\n',paramsValues(2));
    fprintf(message);
    
%     %% ���ѭ�������� ���ޡ�б�ʡ��²��ʺʹ����ʵ�ֵ��������
%     B=100;
%     disp('Determining standard errors.....');
%     if ParOrNonPar == 1
%         [SD,paramsSim,LLSim,converged] = PAL_PFML_BootstrapParametric(...
%             StimLevels, OutOfNum, paramsValues, paramsFree, B, PF, ...
%             'searchGrid', searchGrid);
%         % paramsSim������B��ģ�����ݽ������֮��Ĳ�������B*4�ľ���
%         % converged���Ƿ���������ϳɹ������ɹ�Ϊ1�����ɹ�Ϊ0.
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
    
%     %% ����Ŷȼ���
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
    
    %% ��ͼ
    X=(min(StimLevels):(max(StimLevels)-min(StimLevels))/1000:max(StimLevels));
    pYesValue =PF(paramsValues,X);
    p_i = roundn(pYesValue,-2);%�ڵڶ�λС����λ�ý�����������
    Threshold = X(find(p_i==0.75,1));
    Threshold_num = exp(Threshold);
    right_rate = roundn(NumPos./OutOfNum,-2);
    
    fig = figure('name','Maximum Likelihood Psychometric Function Fitting');
    set(gcf,'Position',[300,150,1000,600]);
    set(gca, 'fontsize',16);
    hold on
    plot(X,pYesValue,'-','color',[0 .7 0],'linewidth',4)%�������֮�������
    plot(StimLevels,NumPos./OutOfNum,'k.','markersize',40)%�����������ݵ�
    marker_text2 = num2cell(right_rate);
    text(StimLevels-0.02,right_rate+0.04,marker_text2,'FontSize',16,'Color','k');
    line_x2 = [min(StimLevels)-0.1,Threshold,Threshold,Threshold];%���ߣ�����
    line_y2 = [0.75,0.75,0.75,-0.02];%���ߣ�����
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2);
    text_x2 = [StimLevels(1),Threshold+0.1];
    text_y2 = [0.78,0.35];
    str2 = {'ȷ����Ϊ 0.75',['�о�����Ϊ��' num2str(Threshold_num) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
%     set(gca, 'Xtick',StimLevels);
    xticks(StimLevels);xticklabels(num2cell(x));
    axis([min(StimLevels)-0.1 max(StimLevels)+0.1 -0.02 1.05]);
    xlabel('�¼�����Ƶ��(Hz)');
    ylabel('ѡ�����');
    legend('Logistic���','ѡ�����','75%�о�����','Location','southeast');
    title_str2 = [subject_name ' �¼�����Ƶ�ʸо�����(��������)'];
    title(title_str2);
    message = sprintf('0.75 Threshold estimate: %6.4f\n',Threshold_num);
    fprintf(message);
else
    disp('f ~ischar')
    NumPos = zeros(size(data_file,2),7);
    OutOfNum = zeros(size(data_file,2),7);
    for i = 1:size(data_file,2)
        waitbar(i/size(data_file,2));
        disp(['��ǰ�򿪵��ļ�Ϊ��',f(i)]);
        %% ��ȡ���ݽ��м���
        data_name = char(data_file(i));
        data = open(data_name);
        Dot_num = zeros(1,size(data.behave.data,2));
        for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
        Dot_num = unique(Dot_num);%�õ�����Щ��������Щ�������Ǳ�ʾ���ٸ���
        time = data.behave.data(1).UserVars.time;%��ȡ��ǰʵ��һ�����ֶ���s
        answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
        answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
        answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);%�õ�ÿ������ѡ���Ҽ��Ĵ���
        x = Dot_num./time;
        StimLevels = log(x);
        NumPos(i,:) = answer_1(2,:);
        OutOfNum(i,:) = sum(answer_1);
        
    end
    paramsFree = [1 1 1 0];
    searchGrid.alpha = (min(StimLevels)+0.2:alpha_level:max(StimLevels)-0.2);
    searchGrid.beta = beta_level;%��������ķ�Χ������ϵĽ���Ƿ��仯
    searchGrid.gamma = gamma_level;%��������ķ�Χ������ϵĽ���Ƿ����
    searchGrid.lambda = lambda_level; %lapse rate, safe as 0 (or 0.02)
    PF = @PAL_Logistic;% �����ֺ������
%     PF = @PAL_Weibull;% �����ֺ������
    %% �����������
    disp('Fitting function.....');
    NumPos_all = sum(NumPos);OutOfNum_all = sum(OutOfNum);
    [paramsValues, LLW] = PAL_PFML_Fit(StimLevels,NumPos_all,OutOfNum_all,searchGrid,paramsFree, PF);
    %������ϣ�����PF���ֺ���������ϣ��õ���Ϸ��̵Ĳ��� paramsFittedW
    disp('done:')
    message = sprintf('0.50 Threshold estimate: %6.4f\n',exp(paramsValues(1)));
    fprintf(message);
    message = sprintf('Slope estimate: %6.4f\n',paramsValues(2));
    fprintf(message);
%     %% ���ѭ�������� ���ޡ�б�ʡ��²��ʺʹ����ʵ�ֵ��������
%     B=100;
%     disp('Determining standard errors.....');
%     if ParOrNonPar == 1
%         [SD,paramsSim,LLSim,converged] = PAL_PFML_BootstrapParametric(...
%             StimLevels, OutOfNum_all, paramsValues, paramsFree, B, PF, ...
%             'searchGrid', searchGrid);
%         % paramsSim������B��ģ�����ݽ������֮��Ĳ�������B*4�ľ���
%         % converged���Ƿ���������ϳɹ������ɹ�Ϊ1�����ɹ�Ϊ0.
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
%     %% ����Ŷȼ���
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

    %% ��ͼ
    X=(min(StimLevels):(max(StimLevels)-min(StimLevels))/1000:max(StimLevels));
    pYesValue =PF(paramsValues,X);
    p_i = roundn(pYesValue,-2);%�ڵڶ�λС����λ�ý�����������
    Threshold = X(find(p_i==0.75,1));
    Threshold_num = exp(Threshold);
    right_rate = roundn(NumPos_all./OutOfNum_all,-2);
    
    fig = figure('name','Maximum Likelihood Psychometric Function Fitting');
    set(gcf,'Position',[300,150,1000,600]);
    set(gca, 'fontsize',16);
    hold on
    plot(X,pYesValue,'-','color',[0 .7 0],'linewidth',4)%�������֮�������
    plot(StimLevels,NumPos_all./OutOfNum_all,'k.','markersize',40)%�����������ݵ�
    marker_text2 = num2cell(right_rate);
    text(StimLevels-0.02,right_rate+0.04,marker_text2,'FontSize',16,'Color','k');
    line_x2 = [min(StimLevels)-0.1,Threshold,Threshold,Threshold];%���ߣ�����
    line_y2 = [0.75,0.75,0.75,-0.02];%���ߣ�����
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2);
    text_x2 = [StimLevels(1),Threshold+0.1];
    text_y2 = [0.78,0.35];
    str2 = {'ȷ����Ϊ 0.75',['�о�����Ϊ��' num2str(Threshold_num) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
%     set(gca, 'Xtick',StimLevels);
    xticks(StimLevels);xticklabels(num2cell(x));
    axis([min(StimLevels)-0.1 max(StimLevels)+0.1 -0.02 1.05]);
    xlabel('�¼�����Ƶ��(Hz)');
    ylabel('ѡ�����');
    legend('Logistic���','ѡ�����','75%�о�����','Location','southeast');
    title_str2 =  ' �¼�����Ƶ�ʸо�����(��������)';
    title(title_str2);
    message = sprintf('0.75 Threshold estimate: %6.4f\n',Threshold_num);
    fprintf(message);
    
end
close(waitbar_h);


