function [Angle_Dot,Dot_Hz] = CircleTimeAngle(varargin)
 % 生成一些列点位置坐标，依此呈现
 % clockwise ： 1->顺时针，-1->逆时针
 % accelerate_style ： 0->匀速，1->匀加速，2->匀减速，3->先加速后减速，4->先减速后加速

% frame = 80;%[16,32,48,64,80]
% angle = [0,2*pi];
frame = varargin{1};
angle = varargin{2};
Angle_Dot = zeros(1,frame-1);
if nargin == 2
    %匀速运动
    angle_dot = linspace(angle(1),angle(2),frame);
    Angle_Dot = diff(angle_dot);
elseif nargin == 3
    accelerate_style = varargin{3};
    angle_dot = zeros(1,frame);
    if accelerate_style == 0
        %匀速运动
         angle_dot = linspace(angle(1),angle(2),frame);
         Angle_Dot = diff(angle_dot);
    elseif accelerate_style == 1 || accelerate_style == 2
        accelerate = 2*(angle(2)-angle(1))/((frame-1)^2);% S = 1/2 * a * t^2,并且最后点回到原来位置(起始和终止重合)
        angle_dot(1) = angle(1);
        if accelerate_style == 1
            %匀加速运动
            for ii = 2:frame
                angle_dot(ii) = (accelerate * ((ii-1)^2))/2;
            end
        elseif accelerate_style == 2
            %匀减速运动
            vel_first = accelerate * (frame-1);%最快的速度
            for ii = 2:frame
               angle_dot(ii) = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%根据初始速度计算旋转过的角度
            end
        end
        Angle_Dot= diff(angle_dot);
    elseif accelerate_style == 3 || accelerate_style == 4
        if rem(frame/2,1) == 0
            % 当呈现的帧是偶数时
            accelerate = (angle(2)-angle(1))/((frame/2-1)^2);% S = 1/2 * a * t^2,一半的距离对应一半的时间
            angle_dot(1) = angle(1);
            if accelerate_style == 3
                %先加速后减速
                for ii = 2:frame/2
                    %加速
                    angle_dot(ii) = (accelerate * ((ii-1)^2))/2;
                    Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % 减速部分就是加速部分对称过来
                Angle_Dot(frame/2+1:end) = Angle_Dot(frame/2-1:-1:1);

            elseif accelerate_style == 4
                %先减速后加速
                vel_first = accelerate * (frame/2-1);%最快的速度
                for ii = 2:frame/2
                   angle_dot(ii) = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%根据初始速度计算旋转过的角度
                   Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % 加速部分就是减速部分对称过来
                Angle_Dot(frame/2+1:end) = Angle_Dot(frame/2-1:-1:1);
            end
        else
            % 当呈现的帧是奇数时
            frame_2 = ceil(frame/2);
            accelerate = (angle(2)-angle(1))/((frame_2-1)^2);%一半的距离对应一半的时间
            angle_dot(1) = angle(1);
            if accelerate_style == 3
                %先加速后减速
                for ii = 2:frame_2
                    %加速
                    angle_dot(ii) = (accelerate * ((ii-1)^2))/2;
                    Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % 减速部分就是加速部分对称过来
                Angle_Dot(frame_2:end) = Angle_Dot(frame_2-1:-1:1);

            elseif accelerate_style == 4
                %先减速后加速
                vel_first = accelerate * (frame_2-1);%最快的速度
                for ii = 2:frame_2
                   angle_dot(ii) = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%根据初始速度计算旋转过的角度
                   Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % 加速部分就是减速部分对称过来
                Angle_Dot(frame_2:end) = Angle_Dot(frame_2-1:-1:1);
            end
            
            
            
        end
        
    else
        disp('accelerate style is error !!!')
    end
    
end
%% 计算每个间隔对应的是多少频率的距离
w = Angle_Dot;
Dot_Hz = zeros(1,length(w));
ff = @(w)(2*pi+w)/(3*w);
for i = 1:length(w)
    Dot_Hz(i) = ff(w(i));
end
% figure
% plot(Dot_Hz)


end