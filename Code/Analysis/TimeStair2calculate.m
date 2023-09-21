%% ���������

%%
clc;clear;

%%
prompt={'�Ƿ��Զ�ѭ��:[0���ֶ����룬1���Զ�ѭ��]','�Ƿ񻭸������Ե�ͼ:[0��������1����]','�Ƿ񱣴�ͼƬ:[0�������棬1������]'};
name='��������';
numlines=1;
defaultanswer={'1','0','0'};
answer=inputdlg(prompt,name,numlines,defaultanswer);
loop = str2double(answer{1});%����Ƿ��ֶ����á��� loop == 0�����ֶ�����
isfigure = str2double(answer{2});
save_picture = str2double(answer{3});
loop_set = [2,2];%�ֶ����õ���ϵĳ�ʼֵ
save_Threshold = 0;%�Ƿ񱣴浱ǰ���Եĸо�����
y_lim = [-0.10,1.10];%��ͼ��y�᷶Χ
loop_scale = [2,40];%��������ǳ�ʼֵ��ѭ����Χ
color = [0,0.7,0];

%%
[f, p1] = uigetfile('.mat','MultiSelect','on');  %open a window to choose your file
data_file = fullfile(p1, f);
cd(p1);
waitbar_h=waitbar(0,'waittttttttttttt....');
if ischar(f)
    disp('f is char')
    disp(['��ǰ�򿪵��ļ�Ϊ��',f]);
    data = open(data_file);
    Dot_num = zeros(1,size(data.behave.data,2));
    for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
    Dot_num = unique(Dot_num);%�õ�����Щ��������Щ�������Ǳ�ʾ���ٸ���
    answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
    answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
    answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);%�õ�ÿ������ѡ���Ҽ��Ĵ���
    answer_rate = answer_1(2,:)./(answer_1(1,:) + answer_1(2,:));%�õ�ѡ��ı���
    time = data.behave.data(1).UserVars.time;%��ȡ��ǰʵ��һ�����ֶ���s

    %% ȷ����ǰ���ԵĴ���
    t_num = strfind(data_file,'_behave');
    subject_name = data_file(t_num-5:t_num-3);%��ȡ '_behave' ǰ������ƣ�ȷ�����Դ���

    %% �������
    % �ۼƸ�˹�ֲ����
    x = Dot_num./time;
    y = answer_rate;
%     ff = @(beta,x)cdf('normal',x,beta(1),beta(2));% beta(1)�Ǿ�ֵ��beta(2)�Ǳ�׼�cdf���ۻ��ֲ�����,'normal'����̬�ֲ�
    ff = @(beta,x)(1+erf((x-beta(1))/beta(2)/2^0.5))/2;%��̬�ֲ����ۻ��ֲ�����
    xx = linspace(0,max(x),1000); %��Ϻ������x�᷶Χ
    if loop == 1
        [beta,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx);% �����н����� nlinfit �����Իع飬�ʺ�������beta��ʱ��
    else
        [beta,R,J,~,~,~] = nlinfit(x,y,ff,loop_set);% nlinfit �����Իع�
    end
    
    
    %% ��ͼ����������
    fig1 = figure;
    hold on
    set(gcf,'Position',[300,150,1000,600]);
    plot_x = log(x);
    xx_2 = linspace(min(x),max(x),1000); 
    log_xx = log(xx_2);
%     plot(plot_x,y*100,'b:','Marker','o','LineWidth',2)% �������ǰ��ͼ
    plot(plot_x,y,'k.','markersize',40)% �������ǰ��ͼ
    marker_text2 = num2cell(roundn(y,-3));
    text(plot_x,y-0.03,marker_text2,'FontSize',16,'Color','k');
    plot(log_xx,ff(beta,xx_2),'-','color',color,'linewidth',4)% ������Ϻ��ͼ
    Threshold2 = log_xx(find(ff(beta,xx_2)>=0.75,1));% ����о���������Ӧ��Ƶ��ֵ�������Ƶ��ֵת��Ϊ����
    line_x2 = [log_xx(1)-0.1,Threshold2,Threshold2,Threshold2];%���ߣ�����
    line_y2 = [0.75,0.75,0.75,y_lim(1)];%���ߣ�����
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2)
    text_x2 = [log_xx(1),Threshold2+0.1];
    text_y2 = [0.78,0.35];
    log_Threshold = exp(Threshold2);
    str2 = {'ȷ����Ϊ 0.75',['�о�����Ϊ��' num2str(roundn(log_Threshold,-2)) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
    % ������������
    [y_fit,y_CI] = nlpredci(ff,xx_2,beta,R,'Jacobian',J,'predopt','curve','simopt','on');
    areafill_cur = fill([log_xx fliplr(log_xx)],[y_fit - y_CI ,fliplr(y_fit + y_CI)],color);
    areafill_cur.FaceAlpha=0.3;
    areafill_cur.EdgeColor=color;
    areafill_cur.HandleVisibility = 'off';
    
    % ����������
    line_grid_x = [plot_x;plot_x];
    line_grid_y = repmat(y_lim',1,length(plot_x));
    line(line_grid_x,line_grid_y,'Color','black','LineStyle',':','LineWidth',1)
    xlabel('�¼�����Ƶ��(��������)');
    ylabel('ȷ����');
    title_str2 = [subject_name ' �¼�����Ƶ�ʸо�����(��������)'];
    title(title_str2);
    legend('��ʵ���','�ۻ���˹�ֲ����','75%�о�����','Location','southeast');
    set(gca,'FontSize',15);
    xticks(plot_x);xticklabels(num2cell(x));
    ylim(y_lim);xlim([log_xx(1)-0.1,log_xx(end)+0.1]);
    hold off
    % save_picture = 1;
    if save_picture == 1,print(fig1,'-djpeg',title_str2);end
    
    %% ����Ŷȼ���,�þ���ϵ������
    [xData, yData] = prepareCurveData( x, y );
    % Set up fittype and options.
    ft = fittype( '(1+erf((x-mu)/sigma/2^0.5))/2', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.StartPoint = beta;
    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    % gof: sse�����ƽ���ͣ�rsquare������ϵ����dfe������е����ɶȣ�adjrsquare�����ɶȵ���ϵ����rmse���������(��׼���)
    % ��������Ϸ�ʽ�Ƿ���һ��
    fit_y = feval(fitresult,xx_2)';nlinfit_y = ff(beta,xx_2);is_same = sum(fit_y ~= nlinfit_y);
    if is_same == 0
        disp(['����ϵ��Ϊ��',num2str(gof.rsquare)]);disp(['��׼��Ϊ��',num2str(gof.rmse)]);
    else
        disp('fit �� nlinfit ��Ͻ����ͬ�������޷���������Ŷȣ�����')
    end
%     figure
%     plot( fitresult, xData, yData );

else
    disp('f ~ischar')
    answer_rate = zeros(size(data_file,2),7);
    for i = 1:size(data_file,2)
        waitbar(i/size(data_file,2));
        disp(['��ǰ�򿪵��ļ�Ϊ��',f(i)]);
        data_name = char(data_file(i));
        data = open(data_name);
        Dot_num = zeros(1,size(data.behave.data,2));
        for ii = 1:size(data.behave.data,2),Dot_num(ii) = data.behave.data(ii).UserVars.Dot_num;end
        Dot_num = unique(Dot_num);%�õ�����Щ��������Щ�������Ǳ�ʾ���ٸ���
        answer_0(1,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.left);
        answer_0(2,1:size(data.behave.condition,2)) = cat(1,data.behave.condition.right);
        answer_1 = answer_0(:,1:size(answer_0,2)/2) + answer_0(:,size(answer_0,2)/2+1:end);%�õ�ÿ������ѡ���Ҽ��Ĵ���
        answer_rate(i,:) = answer_1(2,:)./(answer_1(1,:) + answer_1(2,:));%�õ�ѡ��ı���
        time = data.behave.data(1).UserVars.time;%��ȡ��ǰʵ��һ�����ֶ���s
        if isfigure ~= 0
         %% ȷ����ǰ���ԵĴ���
            t_num = strfind(data_name,'_behave');
            subject_name = data_name(t_num-5:t_num-3);%��ȡ '_behave' ǰ������ƣ�ȷ�����Դ���

            %% �������
            % �ۼƸ�˹�ֲ����
            x = Dot_num./time;
            y = answer_rate(i,:);
        %     ff = @(beta,x)cdf('normal',x,beta(1),beta(2));% beta(1)�Ǿ�ֵ��beta(2)�Ǳ�׼�cdf���ۻ��ֲ�����,'normal'����̬�ֲ�
            ff = @(beta,x)(1+erf((x-beta(1))/beta(2)/2^0.5))/2;%��̬�ֲ����ۻ��ֲ�����
            xx = linspace(0,max(x),1000); %��Ϻ������x�᷶Χ
            if loop == 1
                [beta,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx);% �����н����� nlinfit �����Իع飬�ʺ�������beta��ʱ��
            else
                [beta,R,J,~,~,~] = nlinfit(x,y,ff,loop_set);% nlinfit �����Իع�
            end


            %% ��ͼ����������
            fig1 = figure;
            hold on
            set(gcf,'Position',[300,150,1000,600]);
            plot_x = log(x);
            xx_2 = linspace(min(x),max(x),1000); 
            log_xx = log(xx_2);
        %     plot(plot_x,y*100,'b:','Marker','o','LineWidth',2)% �������ǰ��ͼ
            plot(plot_x,y,'k.','markersize',40)% �������ǰ��ͼ
            marker_text2 = num2cell(roundn(y,-3));
            text(plot_x,y-0.03,marker_text2,'FontSize',16,'Color','k');
            plot(log_xx,ff(beta,xx_2),'-','color',color,'linewidth',4)% ������Ϻ��ͼ
            Threshold2 = log_xx(find(ff(beta,xx_2)>=0.75,1));% ����о���������Ӧ��Ƶ��ֵ�������Ƶ��ֵת��Ϊ����
            line_x2 = [log_xx(1)-0.1,Threshold2,Threshold2,Threshold2];%���ߣ�����
            line_y2 = [0.75,0.75,0.75,y_lim(1)];%���ߣ�����
            line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2)
            text_x2 = [log_xx(1),Threshold2+0.1];
            text_y2 = [0.78,0.35];
            log_Threshold = exp(Threshold2);
            str2 = {'ȷ����Ϊ 0.75',['�о�����Ϊ��' num2str(roundn(log_Threshold,-2)) ' Hz']};
            text(text_x2,text_y2,str2,'FontSize',20)
            % ������������
            [y_fit,y_CI] = nlpredci(ff,xx_2,beta,R,'Jacobian',J,'predopt','curve','simopt','on');
            areafill_cur = fill([log_xx fliplr(log_xx)],[y_fit - y_CI ,fliplr(y_fit + y_CI)],color);
            areafill_cur.FaceAlpha=0.3;
            areafill_cur.EdgeColor=color;
            areafill_cur.HandleVisibility = 'off';

            % ����������
            line_grid_x = [plot_x;plot_x];
            line_grid_y = repmat(y_lim',1,length(plot_x));
            line(line_grid_x,line_grid_y,'Color','black','LineStyle',':','LineWidth',1)
            xlabel('�¼�����Ƶ��(��������)');
            ylabel('ȷ����');
            title_str2 = [subject_name ' �¼�����Ƶ�ʸо�����(��������)'];
            title(title_str2);
            legend('��ʵ���','�ۻ���˹�ֲ����','75%�о�����','Location','southeast');
            set(gca,'FontSize',15);
            xticks(plot_x);xticklabels(num2cell(x));
            ylim(y_lim);xlim([log_xx(1)-0.1,log_xx(end)+0.1]);
            hold off
            % save_picture = 1;
            if save_picture ~= 0,print(fig1,'-djpeg',title_str2);end

            %% ����Ŷȼ���,�þ���ϵ������
            [xData, yData] = prepareCurveData( x, y );
            % Set up fittype and options.
            ft = fittype( '(1+erf((x-mu)/sigma/2^0.5))/2', 'independent', 'x', 'dependent', 'y' );
            opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
            opts.Display = 'Off';
            opts.StartPoint = beta;
            % Fit model to data.
            [fitresult, gof] = fit( xData, yData, ft, opts );
            % gof: sse�����ƽ���ͣ�rsquare������ϵ����dfe������е����ɶȣ�adjrsquare�����ɶȵ���ϵ����rmse���������(��׼���)
            % ��������Ϸ�ʽ�Ƿ���һ��
            fit_y = feval(fitresult,xx_2)';nlinfit_y = ff(beta,xx_2);is_same = sum(fit_y ~= nlinfit_y);
            if is_same == 0
                disp(['����ϵ��Ϊ��',num2str(gof.rsquare)]);disp(['��׼��Ϊ��',num2str(gof.rmse)]);
            else
                disp('fit �� nlinfit ��Ͻ����ͬ�������޷���������Ŷȣ�����')
            end
        end
    end
     %% �������
    % �ۼƸ�˹�ֲ����
    x = Dot_num./time;
    y = sum(answer_rate)/size(data_file,2);
    y_error = std(answer_rate);
%     ff = @(beta,x)cdf('normal',x,beta(1),beta(2));% beta(1)�Ǿ�ֵ��beta(2)�Ǳ�׼�cdf���ۻ��ֲ�����,'normal'����̬�ֲ�
    ff = @(beta,x)(1+erf((x-beta(1))/beta(2)/2^0.5))/2;%��̬�ֲ����ۻ��ֲ�����
    xx = linspace(0,max(x),1000); %��Ϻ������x�᷶Χ
    if loop == 1
        [beta,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx);% �����н����� nlinfit �����Իع飬�ʺ�������beta��ʱ��
    else
        [beta,R,J,~,~,~] = nlinfit(x,y,ff,loop_set);% nlinfit �����Իع�
    end
    
    fig2 = figure;
    hold on
    set(gcf,'Position',[200,50,1200,700]);
    plot_x = log(x);
    xx_2 = linspace(min(x),max(x),1000); 
    log_xx = log(xx_2);
%     plot(plot_x,y*100,'b:','Marker','o','LineWidth',2)% �������ǰ��ͼ
    errorbar(plot_x,y,y_error,'Color','k','LineStyle','none','LineWidth',2,'Marker','.',...
        'MarkerSize',30,'MarkerEdgeColor','k','CapSize',15)
    marker_text2 = num2cell(roundn(y,-3));%����3λС��
    text(plot_x,y-0.03,marker_text2,'FontSize',16,'Color','k');
    plot(log_xx,ff(beta,xx_2),'-','color',color,'linewidth',4)% ������Ϻ��ͼ
    Threshold2 = log_xx(find(ff(beta,xx_2)>=0.75,1));% ����о���������Ӧ��Ƶ��ֵ�������Ƶ��ֵת��Ϊ����
    line_x2 = [log_xx(1)-0.1,Threshold2,Threshold2,Threshold2];%���ߣ�����
    line_y2 = [0.75,0.75,0.75,y_lim(1)];%���ߣ�����
    line(line_x2,line_y2,'Color','red','LineStyle','--','LineWidth',2)
    text_x2 = [log_xx(1),Threshold2+0.1];
    text_y2 = [0.78,0.35];
    log_Threshold = exp(Threshold2);
    str2 = {'ȷ����Ϊ 0.75',['�о�����Ϊ��' num2str(roundn(log_Threshold,-2)) ' Hz']};
    text(text_x2,text_y2,str2,'FontSize',20)
    % ������������
    [y_fit,y_CI] = nlpredci(ff,xx_2,beta,R,'Jacobian',J,'predopt','curve','simopt','on');
    areafill_cur = fill([log_xx fliplr(log_xx)],[y_fit - y_CI ,fliplr(y_fit + y_CI)],color);
    areafill_cur.FaceAlpha=0.3;
    areafill_cur.EdgeColor=color;
    areafill_cur.HandleVisibility = 'off';
    % ����������
    line_grid_x = [plot_x;plot_x];
    line_grid_y = repmat(y_lim',1,length(plot_x));
    line(line_grid_x,line_grid_y,'Color','black','LineStyle',':','LineWidth',1)
    xlabel('�¼�����Ƶ��(Hz)');
    y_label_i = ylabel('ȷ����','Rotation',0,'fontsize',20);y_label_i.Position = [log_xx(1)-0.3,0.5];
    title_str2 = ' �¼�����Ƶ�ʸо�����';
    title(title_str2);
    legend('��ʵ���','�ۻ���˹�ֲ����','75%�о�����','Location','southeast');
    set(gca,'FontSize',15);
    xticks(plot_x);xticklabels(num2cell(x));
    ylim(y_lim);xlim([log_xx(1)-0.1,log_xx(end)+0.1]);
    
    % ��ɢ��
    scatter_x = repmat(plot_x,size(data_file,2),1);
    scatter_x = reshape(scatter_x,1,size(scatter_x,1)*size(scatter_x,2));
    scatter_x = scatter_x + rand(1,length(scatter_x)) .* 0.05 - 0.025;
    scatter_y = answer_rate;
    scatter_y = reshape(scatter_y,1,size(scatter_y,1)*size(scatter_y,2));
    scatter(scatter_x,scatter_y,35,[0.5,0.5,0.5],'o','filled');
    set(gca,'ytick',(0:0.1:1))% ����y����ʾ�ı��
    hold off
    if save_picture ~= 0,print(fig2,'-djpeg',title_str2);end
    
    %% ����Ŷȼ���,�þ���ϵ������
    [xData, yData] = prepareCurveData( x, y );
    % Set up fittype and options.
    ft = fittype( '(1+erf((x-mu)/sigma/2^0.5))/2', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.StartPoint = beta;
    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    % gof: sse�����ƽ���ͣ�rsquare������ϵ����dfe������е����ɶȣ�adjrsquare�����ɶȵ���ϵ����rmse���������(��׼���)
    % ��������Ϸ�ʽ�Ƿ���һ��
    fit_y = feval(fitresult,xx_2)';nlinfit_y = ff(beta,xx_2);is_same = sum(fit_y ~= nlinfit_y);
    if is_same == 0
        disp(['����ϵ��Ϊ��',num2str(gof.rsquare)]);disp(['��׼��Ϊ��',num2str(gof.rmse)]);
    else
        disp('fit �� nlinfit ��Ͻ����ͬ�������޷���������Ŷȣ�����')
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




