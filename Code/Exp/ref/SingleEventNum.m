% �������/��������¿��ܱ�ʶ��Ϊ�����¼�������
%% 
clear all;clc;
%% ��������
Dot_num_first = 90;
angle = 360;
%% 
accelerate = 2*angle/((Dot_num_first-1)^2);% S = 1/2 * a * t^2,��������ص�ԭ��λ��(��ʼ����ֹ�غ�)
angle_dot_first = zeros(1,Dot_num_first);
%�ȼ����˶�
for ii = 2:Dot_num_first
    angle_dot_first(ii) = (accelerate * ((ii-1)^2))/2;
end
angle_dot_first = fliplr(angle_dot_first); % �������ҷ�ת
angle_dif = abs(diff(angle_dot_first)); % ������֮��ĽǶȲ�
angle_s = angle/(Dot_num_first-1); % �����˶�ʱ�ĽǶȲ�

%% �����¼�����
EventId = find(angle_dif<angle_s,1); % ���һ������Ϊ�Ƕ����¼��ĵ�
angle_r = angle_dot_first(EventId + 1) - angle_s; % ���ж��ٽǶȿ��Ա�������������¼�
SingleEvent = EventId + 1 + floor(angle_r/angle_s); % һ�����������¼�
text = ['һ������ ',num2str(SingleEvent),' ���¼�'];
disp(text);