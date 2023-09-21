function Dot_position = CircleTimePosition(varargin)
 % ����һЩ�е�λ�����꣬���˳���
 % Dot_position = CircleTimePosition(frame,radius,angle,clockwise,accelerate_style)
 % clockwise �� 1->˳ʱ�룬-1->��ʱ��
 % accelerate_style �� 0->���٣�1->�ȼ��٣�2->�ȼ��٣�3->�ȼ��ٺ���٣�4->�ȼ��ٺ����

 
% frame = 80;%[16,32,48,64,80]
% angle = [0,2*pi];
% radius = 5;
frame = varargin{1};
radius = varargin{2};
angle = varargin{3};
clockwise = varargin{4};

position = zeros(1,2,frame);
if nargin == 4
    %�����˶�
    angle_dot = linspace(angle(1),angle(2),frame);
    for ii = 1:frame
        position(1,1,ii) = radius .* sin(angle_dot(ii));
        position(1,2,ii) = radius .* cos(angle_dot(ii));
    end
elseif nargin == 5
    accelerate_style = varargin{5};
    if accelerate_style == 0
        %�����˶�
         angle_dot = linspace(angle(1),angle(2),frame);
        for ii = 1:frame
            position(1,1,ii) = radius .* sin(angle_dot(ii));
            position(1,2,ii) = radius .* cos(angle_dot(ii));
        end
    elseif accelerate_style == 1 || accelerate_style == 2
        accelerate = 2*(angle(2)-angle(1))/((frame-1)^2);% S = 1/2 * a * t^2,��������ص�ԭ��λ��(��ʼ����ֹ�غ�)
        angle_dot = angle(1);
        if accelerate_style == 1
            %�ȼ����˶�
            position(1,1,1) = radius .* sin(angle_dot);
            position(1,2,1) = radius .* cos(angle_dot);
            for ii = 2:frame
                angle_dot = (accelerate * ((ii-1)^2))/2;
                position(1,1,ii) = radius .* sin(angle_dot);
                position(1,2,ii) = radius .* cos(angle_dot);
            end
        elseif accelerate_style == 2
            %�ȼ����˶�
            vel_first = accelerate * (frame-1);%�����ٶ�
            position(1,1,1) = radius .* sin(angle_dot);
            position(1,2,1) = radius .* cos(angle_dot);
            for ii = 2:frame
               angle_dot = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%���ݳ�ʼ�ٶȼ�����ת���ĽǶ�
               position(1,1,ii) = radius .* sin(angle_dot);
               position(1,2,ii) = radius .* cos(angle_dot);
            end
        end
    elseif accelerate_style == 3 || accelerate_style == 4
        if rem(frame/2,1) == 0
            % �����ֵ�֡��ż��ʱ
            accelerate = (angle(2)-angle(1))/((frame/2-1)^2);% S = 1/2 * a * t^2,һ��ľ����Ӧһ���ʱ��
            angle_dot = angle(1);
            position = zeros(1,2,frame);
            if accelerate_style == 3
                %�ȼ��ٺ����
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame/2
                    %����
                    angle_dot = (accelerate * ((ii-1)^2))/2;
                    position(1,1,ii) = radius .* sin(angle_dot);
                    position(1,2,ii) = radius .* cos(angle_dot);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                position(:,:,frame/2+1:end) = position(:,:,frame/2:-1:1);
                position(:,1,frame/2+1:end) = position(:,1,frame/2+1:end).*(-1);

            elseif accelerate_style == 4
                %�ȼ��ٺ����
                vel_first = accelerate * (frame/2-1);%�����ٶ�
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame/2
                   angle_dot = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%���ݳ�ʼ�ٶȼ�����ת���ĽǶ�
                   position(1,1,ii) = radius .* sin(angle_dot);
                   position(1,2,ii) = radius .* cos(angle_dot);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                position(:,:,frame/2+1:end) = position(:,:,frame/2:-1:1);
                position(:,1,frame/2+1:end) = position(:,1,frame/2+1:end).*(-1);
            end
        else
            % �����ֵ�֡������ʱ
            frame_2 = ceil(frame/2);
            accelerate = (angle(2)-angle(1))/((frame_2-1)^2);%һ��ľ����Ӧһ���ʱ��
            angle_dot = angle(1);
            position = zeros(1,2,frame);
            if accelerate_style == 3
                %�ȼ��ٺ����
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame_2
                    %����
                    angle_dot = (accelerate * ((ii-1)^2))/2;
                    position(1,1,ii) = radius .* sin(angle_dot);
                    position(1,2,ii) = radius .* cos(angle_dot);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                position(:,:,frame_2+1:end) = position(:,:,frame_2-1:-1:1);
                position(:,1,frame_2+1:end) = position(:,1,frame_2+1:end).*(-1);

            elseif accelerate_style == 4
                %�ȼ��ٺ����
                vel_first = accelerate * (frame_2-1);%�����ٶ�
                position(1,1,1) = radius .* sin(angle_dot);
                position(1,2,1) = radius .* cos(angle_dot);
                for ii = 2:frame_2
                   angle_dot = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%���ݳ�ʼ�ٶȼ�����ת���ĽǶ�
                   position(1,1,ii) = radius .* sin(angle_dot);
                   position(1,2,ii) = radius .* cos(angle_dot);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                position(:,:,frame_2+1:end) = position(:,:,frame_2-1:-1:1);
                position(:,1,frame_2+1:end) = position(:,1,frame_2+1:end).*(-1);
            end
            
            
            
        end
        
    else
        disp('accelerate style is error !!!')
    end
    
end
if clockwise == 1
    % ˳ʱ��
    Dot_position = position .* [-1,1];
elseif clockwise == -1
    % ��ʱ��
    Dot_position = position;
end

end