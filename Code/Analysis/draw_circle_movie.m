
draw_i = 4;% 1：画有序列的实验刺激视频，2：画无序的实验刺激视频，3：画噪音视频，4：画注视点视频，5：JND有序和对应的JND无序
current_block = 4;
Current_trial = 3;
condition_idx = CicleTimeCondition(current_block,Current_trial,120,4,[0,2*pi]);
screen_size = [50 50 550 550];
R =50;
DotSize = 30;
% Screen CreateMovie?
%% 变量
if draw_i == 1 || draw_i == 2
    if draw_i == 2
        condition_idx.Dot_position_first = condition_idx.Dot_position_first(:,:,randperm(size(condition_idx.Dot_position_first,3)));% 乱序
    end
    draw_frequency = condition_idx.Dot_position_first.*R;
    color_change = condition_idx.color_change_first;
    position_change = condition_idx.position_change_first;
%     draw_frequency = condition_idx.Dot_position_second.*R;
%     color_change = condition_idx.color_change_second;
%     position_change = condition_idx.position_change_second;
    draw_frequency = repmat(draw_frequency,360/size(draw_frequency,3),1,1);
    %% 形成视频
    whichscreen=max(Screen('Screens'));
    % white=WhiteIndex(whichscreen);
    [windowPtr,rect] = Screen('OpenWindow',whichscreen,0,screen_size);%在屏幕中间显示一个黑色的400*400像素的窗口
    [centerx,centery]=RectCenter(rect);%获取中心点坐标
    % help VideoRecording
    moviePtr = Screen('CreateMovie',windowPtr,strcat('CircleTime','.mp4'),[],[],120,':CodecSettings= Keyframe=1 Videoquality=1.0');%创建一个影片,以 CircleTime 为名,120==>frame_rate=120，则每一帧画面呈现时间为1/120s
    p = 1;q = 1;
    for i = 1:360
        dot_position = [draw_frequency(p,:,q);0 0];
        if current_block == 2 && color_change == 1
            if mod(i,6) == 1||mod(i,6) == 2
                color_i = [255,0,0];
            elseif mod(i,6) == 3||mod(i,6) == 4
                color_i = [0,255,0];
            elseif mod(i,6) == 5||mod(i,6) == 0
                color_i = [0,0,255];
            end
        elseif current_block == 2 && position_change == 1
            if mod(i,6) ~= 1 && mod(i,6) ~= 2
                dot_position = dot_position.*100;
            end
            color_i = [255,255,255];
        else
            color_i = [255,255,255];
        end
        Screen('DrawDots',windowPtr,dot_position',DotSize,[color_i;255,255,255]',[centerx centery],2);
        Screen('AddFrameToMovie',windowPtr);
        Screen('Flip',windowPtr);
    %     img = Screen('GetImage',windowPtr);
    %     picture_name = [num2str(i),'.jpg'];
    %     imwrite(img,picture_name);
    %     fig_eps = figure;
    %     scatter(dot_position(:,1)-dot_position(:,1).*0.7,-dot_position(:,2),'filled');
    %     picture_name = [condition,num2str(i),'.eps'];
    %     print(fig_eps,'-depsc',picture_name)
        p = p + 1;
        if p == size(draw_frequency,1)+1
            p = 1;
            q = q + 1;
        end
    end
    Screen('FinalizeMovie',moviePtr);
    Screen('CloseAll');
end
% clear;
% for ii = 1:360
%     fig_name = [num2str(ii),'.jpg'];
%     I = imread(fig_name);
%     [Ig,map]=rgb2ind(I,256);
%     if ii == 1
%         imwrite(Ig,map,'CircleTime.gif','gif','Loopcount',inf,'DelayTime',0);
%     else
%         imwrite(Ig,map,'CircleTime.gif','gif','WriteMode','append','DelayTime',0);
%     end
% end
%% 画噪音视频
if draw_i == 3
    Noise.size = [screen_size(4)-screen_size(2),screen_size(3)-screen_size(1)];
    Screen('Preference', 'SkipSyncTests', 0);
    % whichscreen=max(Screen('Screens'));
    [windowPtr,rect] = Screen('OpenWindow',0,0,screen_size);
    moviePtr = Screen('CreateMovie',windowPtr,strcat('Texture','.mp4'),[],[],120,':CodecSettings= Keyframe=1 Videoquality=1.0');%创建一个影片,以 CircleTime 为名,120==>frame_rate=120，则每一帧画面呈现时间为1/120s
    for i = 1:36 % 300ms
        if mod(i,2)==1
            Noise.lumi = 100.*rand(Noise.size);
        end
        Noise.tex = Screen('MakeTexture', windowPtr, Noise.lumi, [], 1);
        Screen('DrawTexture', windowPtr, Noise.tex);
        Screen('AddFrameToMovie',windowPtr);
        Screen('Flip',windowPtr);
    end
    Screen('FinalizeMovie',moviePtr);
    Screen('CloseAll');
end
%% 画注视点图
if draw_i == 4
     whichscreen=max(Screen('Screens'));
     Screen('Preference', 'SkipSyncTests', 0);
    % white=WhiteIndex(whichscreen);
    [windowPtr,rect] = Screen('OpenWindow',whichscreen,0,screen_size);%在屏幕中间显示一个黑色的400*400像素的窗口
    [centerx,centery]=RectCenter(rect);%获取中心点坐标
    moviePtr = Screen('CreateMovie',windowPtr,strcat('Fixation_Point','.mp4'),[],[],120,':CodecSettings= Keyframe=1 Videoquality=1.0');%创建一个影片,以 CircleTime 为名,120==>frame_rate=120，则每一帧画面呈现时间为1/120s
    p = 1;q = 1;
    for i = 1:24 % 200ms
        rect = [centerx-3,centery-15,centerx+3,centery+15;centerx-15,centery-3,centerx+15,centery+3]';
        color = [255,0,0;255,0,0]';
        Screen('FillRect',windowPtr,color,rect);
        Screen('AddFrameToMovie',windowPtr);
        Screen('Flip',windowPtr);
    end
    Screen('FinalizeMovie',moviePtr);
    Screen('CloseAll');
end

%% 画JND 实验刺激
% clear;
% draw_i = 5;
% current_block = 1;
% condition_idx = CicleTimeCondition(current_block,1,120,4,[0,2*pi]);
if draw_i == 5
    % 呈现时间：2.5s-300，2.45-294，2.4-288，2.35-282，2.3-276，2.25-270，2.2-264，2.15-258，2.1-252，2.05-246，2.0-240
    % 1.95-234，1.9-228
    Time = 228;
    dot_num = size(condition_idx.Dot_position_first,3)*Time/360;
    dot_on = randperm(size(condition_idx.Dot_position_first,3),1);
    condition_idx.Dot_position_first = repmat(condition_idx.Dot_position_first,[1,1,2]);
    condition_idx.Dot_position_first = condition_idx.Dot_position_first(:,:,dot_on:dot_on+dot_num-1);
    draw_frequency = condition_idx.Dot_position_first.*R;
    color_change = condition_idx.color_change_first;
    position_change = condition_idx.position_change_first;
    % draw_frequency = condition_idx.Dot_position_second.*R;
    % color_change = condition_idx.color_change_second;
    % position_change = condition_idx.position_change_second;
    draw_frequency = repmat(draw_frequency,Time/size(draw_frequency,3),1,1);
    %% 形成视频
    whichscreen=max(Screen('Screens'));
    % white=WhiteIndex(whichscreen);
    [windowPtr,rect] = Screen('OpenWindow',whichscreen,0,screen_size);%在屏幕中间显示一个黑色的400*400像素的窗口
    [centerx,centery]=RectCenter(rect);%获取中心点坐标
    moviePtr = Screen('CreateMovie',windowPtr,['S',num2str(Time/120),'s.mp4'],[],[],120,':CodecSettings= Keyframe=1 Videoquality=1.0');%创建一个影片,以 CircleTime 为名,120==>frame_rate=120，则每一帧画面呈现时间为1/120s
    p = 1;q = 1;
    for i = 1:Time
        dot_position = [draw_frequency(p,:,q);0 0];
        if current_block == 2 && color_change == 1
            if mod(i,6) == 1||mod(i,6) == 2
                color_i = [255,0,0];
            elseif mod(i,6) == 3||mod(i,6) == 4
                color_i = [0,255,0];
            elseif mod(i,6) == 5||mod(i,6) == 0
                color_i = [0,0,255];
            end
        elseif current_block == 2 && position_change == 1
            if mod(i,6) ~= 1 && mod(i,6) ~= 2
                dot_position = dot_position.*100;
            end
            color_i = [255,255,255];
        else
            color_i = [255,255,255];
        end
        Screen('DrawDots',windowPtr,dot_position',DotSize,[color_i;255,255,255]',[centerx centery],2);
        Screen('AddFrameToMovie',windowPtr);
        Screen('Flip',windowPtr);
    %     img = Screen('GetImage',windowPtr);
    %     picture_name = [num2str(i),'.jpg'];
    %     imwrite(img,picture_name);
    %     fig_eps = figure;
    %     scatter(dot_position(:,1)-dot_position(:,1).*0.7,-dot_position(:,2),'filled');
    %     picture_name = [condition,num2str(i),'.eps'];
    %     print(fig_eps,'-depsc',picture_name)
        p = p + 1;
        if p == size(draw_frequency,1)+1
            p = 1;
            q = q + 1;
        end
    end
    Screen('FinalizeMovie',moviePtr);
    Screen('CloseAll');
    
    %% 画无序的
    condition_idx.Dot_position_first = condition_idx.Dot_position_first(:,:,randperm(size(condition_idx.Dot_position_first,3)));% 乱序
    draw_frequency = condition_idx.Dot_position_first.*R;
    % draw_frequency = condition_idx.Dot_position_second.*R;
    draw_frequency = repmat(draw_frequency,Time/size(draw_frequency,3),1,1);
    %% 形成视频
    whichscreen=max(Screen('Screens'));
    % white=WhiteIndex(whichscreen);
    [windowPtr,rect] = Screen('OpenWindow',whichscreen,0,screen_size);%在屏幕中间显示一个黑色的400*400像素的窗口
    [centerx,centery]=RectCenter(rect);%获取中心点坐标
    moviePtr = Screen('CreateMovie',windowPtr,['NS',num2str(Time/120),'s.mp4'],[],[],120,':CodecSettings= Keyframe=1 Videoquality=1.0');%创建一个影片,以 CircleTime 为名,120==>frame_rate=120，则每一帧画面呈现时间为1/120s
    p = 1;q = 1;
    for i = 1:Time
        dot_position = [draw_frequency(p,:,q);0 0];
        if current_block == 2 && color_change == 1
            if mod(i,6) == 1||mod(i,6) == 2
                color_i = [255,0,0];
            elseif mod(i,6) == 3||mod(i,6) == 4
                color_i = [0,255,0];
            elseif mod(i,6) == 5||mod(i,6) == 0
                color_i = [0,0,255];
            end
        elseif current_block == 2 && position_change == 1
            if mod(i,6) ~= 1 && mod(i,6) ~= 2
                dot_position = dot_position.*100;
            end
            color_i = [255,255,255];
        else
            color_i = [255,255,255];
        end
        Screen('DrawDots',windowPtr,dot_position',DotSize,[color_i;255,255,255]',[centerx centery],2);
        Screen('AddFrameToMovie',windowPtr);
        Screen('Flip',windowPtr);
    %     img = Screen('GetImage',windowPtr);
    %     picture_name = [num2str(i),'.jpg'];
    %     imwrite(img,picture_name);
    %     fig_eps = figure;
    %     scatter(dot_position(:,1)-dot_position(:,1).*0.7,-dot_position(:,2),'filled');
    %     picture_name = [condition,num2str(i),'.eps'];
    %     print(fig_eps,'-depsc',picture_name)
        p = p + 1;
        if p == size(draw_frequency,1)+1
            p = 1;
            q = q + 1;
        end
    end
    Screen('FinalizeMovie',moviePtr);
    Screen('CloseAll');

    
end
% 
% 





