function p_list = SelectPicture(all_num,select_num,frame)
% 从所有图片中随机选取相应数量的图片，用于 ImageChanger 读取呈现
% all_num = 100;select_num=7;
new_P = randperm(all_num);
% P_name = cell(select_num,1);
% P_name = '';%{'p_1','p_2'}
P_position = [0,0];%[0 0;1 1]
% frame = 2;
eventmarker = [];
p_list = cell(select_num,4);
for num = 1:select_num
    p_list{num,1} = ['yy',num2str(new_P(num)),'.jpg'];
    p_list{num,2} = P_position;
    p_list{num,3} = frame;
    p_list{num,4} = eventmarker;
end
end