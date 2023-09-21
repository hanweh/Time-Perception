%% 待解决问题

%%
clc;clear;

%%
prompt={'是否自动循环:[0：手动输入，1：自动循环]','是否画各个被试的图:[0：不画，1：画]','是否保存图片:[0：不保存，1：保存]'};
name='参数输入';
numlines=1;
defaultanswer={'1','0','0'};
answer=inputdlg(prompt,name,numlines,defaultanswer);
loop = str2double(answer{1});%拟合是否手动设置。若 loop == 0，则手动设置
isfigure = str2double(answer{2});
save_picture = str2double(answer{3});
loop_set = [2,2];%手动设置的拟合的初始值
save_Threshold = 0;%是否保存当前被试的感觉阈限
y_lim = [-0.10,1.10];%画图的y轴范围
loop_scale = [2,40];%计算拟合是初始值的循环范围
color = [0,0.7,0];

%%
[f, p1] = uigetfile('.mat','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p1, f);
cd(p1);
waitbar_h=waitbar(0,'waittttttttttttt....');
if ischar(f)
    disp('f is char')
    disp(['当前打开的文件为：',f]);
    data = open(data_file);
    Dot_num = zeros(1,size(data.behave.data,2));
    for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
    Dot_num = unique(Dot_num);%得到有哪些条件，这些条件都是表示多少个点
    answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
    answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
    answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);%得到每个条件选择右键的次数
    answer_rate = answer_1(2,:)./(answer_1(1,:) + answer_1(2,:));%得到选择的比率
    time = data.behave.data(1).UserVars.time;%读取当前实验一共呈现多少s

    %% 确定当前被试的代码
    t_num = strfind(data_file,'_behave');
    subject_name = data_file(t_num-5:t_num-3);%读取 '_behave' 前面的名称，确定被试代码

    %% 曲线拟合
    % 累计高斯分布拟合
    x = Dot_num./time;
    y = answer_rate;
%     ff = @(beta,x)cdf('normal',x,beta(1),beta(2));% beta(1)是均值，beta(2)是标准差，cdf是累积分布函数,'normal'是正态分布
    ff = @(beta,x)(1+erf((x-beta(1))/beta(2)/2^0.5))/2;%正态分布的累积分布函数
    xx = linspace(0,max(x),1000); %拟合后的数据x轴范围
    if loop == 1
        [beta,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx);% 函数中进行了 nlinfit 非线性回归，适合有两个beta的时候
    else
        [beta,R,J,~,~,~] = nlinfit(x,y,ff,loop_set);% nlinfit 非线性回归
    end
    
    
    %% 画图：对数坐标
    fig1 = figure;
    hold on
    set(gcf,'Position',[300,150,1000,600]);
    plot_x = log(x);
    xx_2 = linspace(min(x),max(x),1000); 
    log_xx = log(xx_2);
%     plot(plot_x,y*100,'b:','Marker','o','LineWidth',2)% 画出拟合前的图
    plot(plot_x,y,'k.','markersize',40)% 画出拟合前的图
    marker_text2 = num2cell(roundn(y,-3));
    text(plot_x,y-0.03,marker_text2,'FontSize',16,'Color','k');
    plot(log_xx,ff(beta,xx_2),'-','color',color,'linewidth',4)% 画出拟合后的图
    Threshold2 = log_xx(find(ff(beta,xx_2)>=0.75,1));% 求出感觉阈限所对应的频率值，这里的频率值转换为对数
    line_x2 = [log_xx(1)-0.1,Threshold2,Threshold2,Threshold2];%横线，竖线
    line_y2 = [0.75,0.75,0.75,y_lim(1)];%横线，竖线
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2)
    text_x2 = [log_xx(1),Threshold2+0.1];
    text_y2 = [0.78,0.35];
    log_Threshold = exp(Threshold2);
    str2 = {'确认率为 0.75',['感觉阈限为：' num2str(roundn(log_Threshold,-2)) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
    % 增加置信区间
    [y_fit,y_CI] = nlpredci(ff,xx_2,beta,R,'Jacobian',J,'predopt','curve','simopt','on');
    areafill_cur = fill([log_xx fliplr(log_xx)],[y_fit - y_CI ,fliplr(y_fit + y_CI)],color);
    areafill_cur.FaceAlpha=0.3;
    areafill_cur.EdgeColor=color;
    areafill_cur.HandleVisibility = 'off';
    
    % 增加网格线
    line_grid_x = [plot_x;plot_x];
    line_grid_y = repmat(y_lim',1,length(plot_x));
    line(line_grid_x,line_grid_y,'Color','black','LineStyle',':','LineWidth',1)
    xlabel('事件发生频率(对数坐标)');
    ylabel('确认率');
    title_str2 = [subject_name ' 事件发生频率感觉阈限(对数坐标)'];
    title(title_str2);
    legend('真实情况','累积高斯分布拟合','75%感觉阈限','Location','southeast');
    set(gca,'FontSize',15);
    xticks(plot_x);xticklabels(num2cell(x));
    ylim(y_lim);xlim([log_xx(1)-0.1,log_xx(end)+0.1]);
    hold off
    % save_picture = 1;
    if save_picture == 1,print(fig1,'-djpeg',title_str2);end
    
    %% 拟合优度检验,用决定系数体现
    [xData, yData] = prepareCurveData( x, y );
    % Set up fittype and options.
    ft = fittype( '(1+erf((x-mu)/sigma/2^0.5))/2', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.StartPoint = beta;
    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    % gof: sse：误差平方和；rsquare：决定系数；dfe：误差中的自由度；adjrsquare：自由度调整系数；rmse：均方误差(标准误差)
    % 看两种拟合方式是否结果一致
    fit_y = feval(fitresult,xx_2)';nlinfit_y = ff(beta,xx_2);is_same = sum(fit_y ~= nlinfit_y);
    if is_same == 0
        disp(['决定系数为：',num2str(gof.rsquare)]);disp(['标准误为：',num2str(gof.rmse)]);
    else
        disp('fit 和 nlinfit 拟合结果不同！！！无法计算拟合优度！！！')
    end
%     figure
%     plot( fitresult, xData, yData );

else
    disp('f ~ischar')
    answer_rate = zeros(size(data_file,2),7);
    for i = 1:size(data_file,2)
        waitbar(i/size(data_file,2));
        disp(['当前打开的文件为：',f(i)]);
        data_name = char(data_file(i));
        data = open(data_name);
        Dot_num = zeros(1,size(data.behave.data,2));
        for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
        Dot_num = unique(Dot_num);%得到有哪些条件，这些条件都是表示多少个点
        answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
        answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
        answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);%得到每个条件选择右键的次数
        answer_rate(i,:) = answer_1(2,:)./(answer_1(1,:) + answer_1(2,:));%得到选择的比率
        time = data.behave.data(1).UserVars.time;%读取当前实验一共呈现多少s
        if isfigure ~= 0
         %% 确定当前被试的代码
            t_num = strfind(data_name,'_behave');
            subject_name = data_name(t_num-5:t_num-3);%读取 '_behave' 前面的名称，确定被试代码

            %% 曲线拟合
            % 累计高斯分布拟合
            x = Dot_num./time;
            y = answer_rate(i,:);
        %     ff = @(beta,x)cdf('normal',x,beta(1),beta(2));% beta(1)是均值，beta(2)是标准差，cdf是累积分布函数,'normal'是正态分布
            ff = @(beta,x)(1+erf((x-beta(1))/beta(2)/2^0.5))/2;%正态分布的累积分布函数
            xx = linspace(0,max(x),1000); %拟合后的数据x轴范围
            if loop == 1
                [beta,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx);% 函数中进行了 nlinfit 非线性回归，适合有两个beta的时候
            else
                [beta,R,J,~,~,~] = nlinfit(x,y,ff,loop_set);% nlinfit 非线性回归
            end


            %% 画图：对数坐标
            fig1 = figure;
            hold on
            set(gcf,'Position',[300,150,1000,600]);
            plot_x = log(x);
            xx_2 = linspace(min(x),max(x),1000); 
            log_xx = log(xx_2);
        %     plot(plot_x,y*100,'b:','Marker','o','LineWidth',2)% 画出拟合前的图
            plot(plot_x,y,'k.','markersize',40)% 画出拟合前的图
            marker_text2 = num2cell(roundn(y,-3));
            text(plot_x,y-0.03,marker_text2,'FontSize',16,'Color','k');
            plot(log_xx,ff(beta,xx_2),'-','color',color,'linewidth',4)% 画出拟合后的图
            Threshold2 = log_xx(find(ff(beta,xx_2)>=0.75,1));% 求出感觉阈限所对应的频率值，这里的频率值转换为对数
            line_x2 = [log_xx(1)-0.1,Threshold2,Threshold2,Threshold2];%横线，竖线
            line_y2 = [0.75,0.75,0.75,y_lim(1)];%横线，竖线
            line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2)
            text_x2 = [log_xx(1),Threshold2+0.1];
            text_y2 = [0.78,0.35];
            log_Threshold = exp(Threshold2);
            str2 = {'确认率为 0.75',['感觉阈限为：' num2str(roundn(log_Threshold,-2)) ' Hz']};
            text(text_x2,text_y2,str2,'FontSize',20)
            % 增加置信区间
            [y_fit,y_CI] = nlpredci(ff,xx_2,beta,R,'Jacobian',J,'predopt','curve','simopt','on');
            areafill_cur = fill([log_xx fliplr(log_xx)],[y_fit - y_CI ,fliplr(y_fit + y_CI)],color);
            areafill_cur.FaceAlpha=0.3;
            areafill_cur.EdgeColor=color;
            areafill_cur.HandleVisibility = 'off';

            % 增加网格线
            line_grid_x = [plot_x;plot_x];
            line_grid_y = repmat(y_lim',1,length(plot_x));
            line(line_grid_x,line_grid_y,'Color','black','LineStyle',':','LineWidth',1)
            xlabel('事件发生频率(对数坐标)');
            ylabel('确认率');
            title_str2 = [subject_name ' 事件发生频率感觉阈限(对数坐标)'];
            title(title_str2);
            legend('真实情况','累积高斯分布拟合','75%感觉阈限','Location','southeast');
            set(gca,'FontSize',15);
            xticks(plot_x);xticklabels(num2cell(x));
            ylim(y_lim);xlim([log_xx(1)-0.1,log_xx(end)+0.1]);
            hold off
            % save_picture = 1;
            if save_picture ~= 0,print(fig1,'-djpeg',title_str2);end

            %% 拟合优度检验,用决定系数体现
            [xData, yData] = prepareCurveData( x, y );
            % Set up fittype and options.
            ft = fittype( '(1+erf((x-mu)/sigma/2^0.5))/2', 'independent', 'x', 'dependent', 'y' );
            opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
            opts.Display = 'Off';
            opts.StartPoint = beta;
            % Fit model to data.
            [fitresult, gof] = fit( xData, yData, ft, opts );
            % gof: sse：误差平方和；rsquare：决定系数；dfe：误差中的自由度；adjrsquare：自由度调整系数；rmse：均方误差(标准误差)
            % 看两种拟合方式是否结果一致
            fit_y = feval(fitresult,xx_2)';nlinfit_y = ff(beta,xx_2);is_same = sum(fit_y ~= nlinfit_y);
            if is_same == 0
                disp(['决定系数为：',num2str(gof.rsquare)]);disp(['标准误为：',num2str(gof.rmse)]);
            else
                disp('fit 和 nlinfit 拟合结果不同！！！无法计算拟合优度！！！')
            end
        end
    end
     %% 曲线拟合
    % 累计高斯分布拟合
    x = Dot_num./time;
    y = sum(answer_rate)/size(data_file,2);
    y_error = std(answer_rate);
%     ff = @(beta,x)cdf('normal',x,beta(1),beta(2));% beta(1)是均值，beta(2)是标准差，cdf是累积分布函数,'normal'是正态分布
    ff = @(beta,x)(1+erf((x-beta(1))/beta(2)/2^0.5))/2;%正态分布的累积分布函数
    xx = linspace(0,max(x),1000); %拟合后的数据x轴范围
    if loop == 1
        [beta,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx);% 函数中进行了 nlinfit 非线性回归，适合有两个beta的时候
    else
        [beta,R,J,~,~,~] = nlinfit(x,y,ff,loop_set);% nlinfit 非线性回归
    end
    
    fig2 = figure;
    hold on
    set(gcf,'Position',[200,50,1200,700]);
    plot_x = log(x);
    xx_2 = linspace(min(x),max(x),1000); 
    log_xx = log(xx_2);
%     plot(plot_x,y*100,'b:','Marker','o','LineWidth',2)% 画出拟合前的图
    errorbar(plot_x,y,y_error,'Color','k','LineStyle','none','LineWidth',2,'Marker','.',...
        'MarkerSize',30,'MarkerEdgeColor','k','CapSize',15)
    marker_text2 = num2cell(roundn(y,-3));%保留3位小数
    text(plot_x,y-0.03,marker_text2,'FontSize',16,'Color','k');
    plot(log_xx,ff(beta,xx_2),'-','color',color,'linewidth',4)% 画出拟合后的图
    Threshold2 = log_xx(find(ff(beta,xx_2)>=0.75,1));% 求出感觉阈限所对应的频率值，这里的频率值转换为对数
    line_x2 = [log_xx(1)-0.1,Threshold2,Threshold2,Threshold2];%横线，竖线
    line_y2 = [0.75,0.75,0.75,y_lim(1)];%横线，竖线
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2)
    text_x2 = [log_xx(1),Threshold2+0.1];
    text_y2 = [0.78,0.35];
    log_Threshold = exp(Threshold2);
    str2 = {'确认率为 0.75',['感觉阈限为：' num2str(roundn(log_Threshold,-2)) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
    % 增加置信区间
    [y_fit,y_CI] = nlpredci(ff,xx_2,beta,R,'Jacobian',J,'predopt','curve','simopt','on');
    areafill_cur = fill([log_xx fliplr(log_xx)],[y_fit - y_CI ,fliplr(y_fit + y_CI)],color);
    areafill_cur.FaceAlpha=0.3;
    areafill_cur.EdgeColor=color;
    areafill_cur.HandleVisibility = 'off';
    % 增加网格线
    line_grid_x = [plot_x;plot_x];
    line_grid_y = repmat(y_lim',1,length(plot_x));
    line(line_grid_x,line_grid_y,'Color','black','LineStyle',':','LineWidth',1)
    xlabel('事件发生频率(Hz)');
    y_label_i = ylabel('确认率','Rotation',0,'fontsize',20);y_label_i.Position = [log_xx(1)-0.3,0.5];
    title_str2 = ' 事件发生频率感觉阈限';
    title(title_str2);
    legend('真实情况','累积高斯分布拟合','75%感觉阈限','Location','southeast');
    set(gca,'FontSize',15);
    xticks(plot_x);xticklabels(num2cell(x));
    ylim(y_lim);xlim([log_xx(1)-0.1,log_xx(end)+0.1]);
    
    % 画散点
    scatter_x = repmat(plot_x,size(data_file,2),1);
    scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
    scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
    scatter_y = answer_rate;
    scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
    scatter(scatter_x,scatter_y,35,[0.5,0.5,0.5],'o','filled');
    set(gca,'ytick',(0:0.1:1))% 设置y轴显示的标尺
    hold off
    if save_picture ~= 0,print(fig2,'-djpeg',title_str2);end
    
    %% 拟合优度检验,用决定系数体现
    [xData, yData] = prepareCurveData( x, y );
    % Set up fittype and options.
    ft = fittype( '(1+erf((x-mu)/sigma/2^0.5))/2', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.StartPoint = beta;
    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    % gof: sse：误差平方和；rsquare：决定系数；dfe：误差中的自由度；adjrsquare：自由度调整系数；rmse：均方误差(标准误差)
    % 看两种拟合方式是否结果一致
    fit_y = feval(fitresult,xx_2)';nlinfit_y = ff(beta,xx_2);is_same = sum(fit_y ~= nlinfit_y);
    if is_same == 0
        disp(['决定系数为：',num2str(gof.rsquare)]);disp(['标准误为：',num2str(gof.rmse)]);
    else
        disp('fit 和 nlinfit 拟合结果不同！！！无法计算拟合优度！！！')
    end
%     figure
%     plot( fitresult, xData, yData );
end
close(waitbar_h);

if save_Threshold == 1
    load Threshold_all
    sub_num = length(Threshold_all) + 1;
    Threshold_all(sub_num) = log_Threshold;
    save Threshold_all
end

% hold on
% load Threshold_all
% [muHat,sigmaHat,muCI,sigmaCI] = normfit(Threshold_all,0.05);
% Threshold_interval_x = [muCI';muCI'];
% Threshold_interval_y = [y_lim;y_lim]';
% line(log(Threshold_interval_x),Threshold_interval_y,'Color','red','LineStyle','--','LineWidth',1)
% hold off




