function DrawTrialsData(data,text_data,title_text,save_picture)
% 画出每个实验条件每个trial的选择
% 选左键为1，选右键为2

draw_trial_data = data.behave.trial;
draw_trial_data(:,4) = draw_trial_data(:,2)==203;
draw_trial_data(draw_trial_data(:,4)==0,4) = 2;
table_row = max(draw_trial_data(:,3));condition_num = max(draw_trial_data(:,1));
draw_table = zeros(table_row,condition_num);
for row = 1:table_row
    for condition = 1:condition_num
        draw_trial_row = find(draw_trial_data(:,1)==condition,row);
        draw_table(row,condition) = draw_trial_data(draw_trial_row(end),4);
    end
end
switch condition_num
    case 32
        width = 1420;
    case 16
        width = 750;
end
fig_table = figure;
set(gcf,'Position',[50,50,width,710]);
uit = uitable(fig_table,'ColumnWidth',{42},'Data',draw_table,'Position',[0,320,width-20,340]);
uit.FontSize = 15;
subplot(2,1,2)
axis off
text(-0.1,0.4,text_data,'FontSize',15);
suptitle(title_text);
if save_picture == 1,print(fig_table,'-djpeg',title_text);end

end

