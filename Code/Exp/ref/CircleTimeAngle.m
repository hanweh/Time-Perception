function [Angle_Dot,Dot_Hz] = CircleTimeAngle(varargin)
 % ����һЩ�е�λ�����꣬���˳���
 % clockwise �� 1->˳ʱ�룬-1->��ʱ��
 % accelerate_style �� 0->���٣�1->�ȼ��٣�2->�ȼ��٣�3->�ȼ��ٺ���٣�4->�ȼ��ٺ����

% frame = 80;%[16,32,48,64,80]
% angle = [0,2*pi];
frame = varargin{1};
angle = varargin{2};
Angle_Dot = zeros(1,frame-1);
if nargin == 2
    %�����˶�
    angle_dot = linspace(angle(1),angle(2),frame);
    Angle_Dot = diff(angle_dot);
elseif nargin == 3
    accelerate_style = varargin{3};
    angle_dot = zeros(1,frame);
    if accelerate_style == 0
        %�����˶�
         angle_dot = linspace(angle(1),angle(2),frame);
         Angle_Dot = diff(angle_dot);
    elseif accelerate_style == 1 || accelerate_style == 2
        accelerate = 2*(angle(2)-angle(1))/((frame-1)^2);% S = 1/2 * a * t^2,��������ص�ԭ��λ��(��ʼ����ֹ�غ�)
        angle_dot(1) = angle(1);
        if accelerate_style == 1
            %�ȼ����˶�
            for ii = 2:frame
                angle_dot(ii) = (accelerate * ((ii-1)^2))/2;
            end
        elseif accelerate_style == 2
            %�ȼ����˶�
            vel_first = accelerate * (frame-1);%�����ٶ�
            for ii = 2:frame
               angle_dot(ii) = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%���ݳ�ʼ�ٶȼ�����ת���ĽǶ�
            end
        end
        Angle_Dot= diff(angle_dot);
    elseif accelerate_style == 3 || accelerate_style == 4
        if rem(frame/2,1) == 0
            % �����ֵ�֡��ż��ʱ
            accelerate = (angle(2)-angle(1))/((frame/2-1)^2);% S = 1/2 * a * t^2,һ��ľ����Ӧһ���ʱ��
            angle_dot(1) = angle(1);
            if accelerate_style == 3
                %�ȼ��ٺ����
                for ii = 2:frame/2
                    %����
                    angle_dot(ii) = (accelerate * ((ii-1)^2))/2;
                    Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                Angle_Dot(frame/2+1:end) = Angle_Dot(frame/2-1:-1:1);

            elseif accelerate_style == 4
                %�ȼ��ٺ����
                vel_first = accelerate * (frame/2-1);%�����ٶ�
                for ii = 2:frame/2
                   angle_dot(ii) = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%���ݳ�ʼ�ٶȼ�����ת���ĽǶ�
                   Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                Angle_Dot(frame/2+1:end) = Angle_Dot(frame/2-1:-1:1);
            end
        else
            % �����ֵ�֡������ʱ
            frame_2 = ceil(frame/2);
            accelerate = (angle(2)-angle(1))/((frame_2-1)^2);%һ��ľ����Ӧһ���ʱ��
            angle_dot(1) = angle(1);
            if accelerate_style == 3
                %�ȼ��ٺ����
                for ii = 2:frame_2
                    %����
                    angle_dot(ii) = (accelerate * ((ii-1)^2))/2;
                    Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                Angle_Dot(frame_2:end) = Angle_Dot(frame_2-1:-1:1);

            elseif accelerate_style == 4
                %�ȼ��ٺ����
                vel_first = accelerate * (frame_2-1);%�����ٶ�
                for ii = 2:frame_2
                   angle_dot(ii) = vel_first * (ii-1) + 1/2 * (-1) * accelerate * (ii-1)^2;%���ݳ�ʼ�ٶȼ�����ת���ĽǶ�
                   Angle_Dot(ii-1) = angle_dot(ii)-angle_dot(ii-1);
                end
                % ���ٲ��־��Ǽ��ٲ��ֶԳƹ���
                Angle_Dot(frame_2:end) = Angle_Dot(frame_2-1:-1:1);
            end
            
            
            
        end
        
    else
        disp('accelerate style is error !!!')
    end
    
end
%% ����ÿ�������Ӧ���Ƕ���Ƶ�ʵľ���
w = Angle_Dot;
Dot_Hz = zeros(1,length(w));
ff = @(w)(2*pi+w)/(3*w);
for i = 1:length(w)
    Dot_Hz(i) = ff(w(i));
end
% figure
% plot(Dot_Hz)


end