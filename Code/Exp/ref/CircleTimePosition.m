function Dot_position = CircleTimePosition(varargin)
 % 生成一些列点位置坐标，依此呈现
 % Dot_position = CircleTimePosition(frame,radius,angle,clockwise,accelerate_style)
 % clockwise ： 1->顺时针，-1->逆时针
 % accelerate_style ： 0->匀速，1->匀加速，2->匀减速，3->先加速后减速，4->先减速后加速

 
% frame = 80;%[16,32,48,64,80]
% angle = [0,2*pi];
% radius = 5;
frame = varargin{1};
radius = varargin{2};
angle = varargin{3};
clockwise = varargin{4};

position = zeros(1,2,frame);
if nargin == 4
    %匀速运动
    angle_dot = linspace(angle(1),angle(2),frame);
    for ii = 1:frame
        position(1,1,ii) = radius .* sin(angle_dot(ii));
        position(1,2,ii) = radius .* cos(angle_dot(ii));
    end
elseif nargin == 5
    accelerate_style = varargin{5};
    if accelerate_style == 0
        %匀速运动
         angle_dot = linspace(angle(1),angle(2),frame);
        for ii = 1:frame
            position(1,1,ii) = radius .* sin(angle_dot(ii));
            position(1,2,ii) = radius .* cos(angle_dot(ii));
        end
    elseif accelerate_style == 1 || accelerate_style == 2
        accelerate = 2*(angle(2)-angle(1))/((frame-1)^2);% S = 1/2 * a * t^2,并且最后点回到原来位置(起始和终止重合)
        angle_dot = angle(1);
        if accelerate_style == 1
            %匀加速运动
            position(1,1,1) = radius .* sin(angle_dot);
            position(1,2,1) = radius .* cos(angle_dot);
            for ii = 2:frame
                angle_dot = (accelerate * ((ii-1)^2))/2;
                position(1,1,ii) = radius .* sin(angle_dot);
                position(1,2,ii) = radius .* cos(angle_dot);
            end
        elseif accelerate_style == 2
            %匀减速运动
            vel_first = accelerate * (frame-1);%最快的速度
            position(1,1,1) = radius .* sin(angle_dot);
            position(1,2,1) = radius .* cos(angle_dot);
            for ii = 2:frame
               angle_dot = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%根据初始速度计算旋转过的角度
               position(1,1,ii) = radius .* sin(angle_dot);
               position(1,2,ii) = radius .* cos(angle_dot);
            end
        end
    elseif accelerate_style == 3 || accelerate_style == 4
        if rem(frame/2,1) == 0
            % 当呈现的帧是偶数时
            accelerate = (angle(2)-angle(1))/((frame/2-1)^2);% S = 1/2 * a * t^2,一半的距离对应一半的时间
            angle_dot = angle(1);
            position = zeros(1,2,frame);
            if accelerate_style == 3
                %先加速后减速
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame/2
                    %加速
                    angle_dot = (accelerate * ((ii-1)^2))/2;
                    position(1,1,ii) = radius .* sin(angle_dot);
                    position(1,2,ii) = radius .* cos(angle_dot);
                end
                % 减速部分就是加速部分对称过来
                position(:,:,frame/2+1:end) = position(:,:,frame/2:-1:1);
                position(:,1,frame/2+1:end) = position(:,1,frame/2+1:end).*(-1);

            elseif accelerate_style == 4
                %先减速后加速
                vel_first = accelerate * (frame/2-1);%最快的速度
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame/2
                   angle_dot = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%根据初始速度计算旋转过的角度
                   position(1,1,ii) = radius .* sin(angle_dot);
                   position(1,2,ii) = radius .* cos(angle_dot);
                end
                % 加速部分就是减速部分对称过来
                position(:,:,frame/2+1:end) = position(:,:,frame/2:-1:1);
                position(:,1,frame/2+1:end) = position(:,1,frame/2+1:end).*(-1);
            end
        else
            % 当呈现的帧是奇数时
            frame_2 = ceil(frame/2);
            accelerate = (angle(2)-angle(1))/((frame_2-1)^2);%一半的距离对应一半的时间
            angle_dot = angle(1);
            position = zeros(1,2,frame);
            if accelerate_style == 3
                %先加速后减速
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame_2
                    %加速
                    angle_dot = (accelerate * ((ii-1)^2))/2;
                    position(1,1,ii) = radius .* sin(angle_dot);
                    position(1,2,ii) = radius .* cos(angle_dot);
                end
                % 减速部分就是加速部分对称过来
                position(:,:,frame_2+1:end) = position(:,:,frame_2-1:-1:1);
                position(:,1,frame_2+1:end) = position(:,1,frame_2+1:end).*(-1);

            elseif accelerate_style == 4
                %先减速后加速
                vel_first = accelerate * (frame_2-1);%最快的速度
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame_2
                   angle_dot = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%根据初始速度计算旋转过的角度
                   position(1,1,ii) = radius .* sin(angle_dot);
                   position(1,2,ii) = radius .* cos(angle_dot);
                end
                % 加速部分就是减速部分对称过来
                position(:,:,frame_2+1:end) = position(:,:,frame_2-1:-1:1);
                position(:,1,frame_2+1:end) = position(:,1,frame_2+1:end).*(-1);
            end
            
            
            
        end
        
    else
        disp('accelerate style is error !!!')
    end
    
end
if clockwise == 1
    % 顺时针
    Dot_position = position .* [-1,1];
elseif clockwise == -1
    % 逆时针
    Dot_position = position;
end

end