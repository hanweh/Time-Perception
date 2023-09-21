function DrawConditionRT(data,draw_condition,first_second,x_label,x_ticklabels,title_name,save_picture)
% 将每一种实验条件的正确率画出来
% draw_condition = {[1,4,7,10];[2,5,13,16];[3,6,19,22];[8,11,14,17];[9,12,20,23];[15,18,21,24]};%{[45-90];[45-180];[45-360];[90-180];[90-360];[180-360]}
% first_second = {[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1];[2,2,1,1]};
draw_condition_data = data.behave.condition;
draw_condition_data = cell2mat(struct2cell(draw_condition_data));
FOC = cell(size(draw_condition,1),1);
for condition_block_con = 1:size(draw_condition,1)
   condition_num = cell2mat(draw_condition(condition_block_con));
   order = cell2mat(first_second(condition_block_con));
   for condition = 1:size(condition_num,2)
      FOC{condition_block_con}(condition) = draw_condition_data(order(condition)+2,1,condition_num(condition))/draw_condition_data(2,1,condition_num(condition));
   end
   FOC_x = (1:size(condition_num,2));FOC_y = FOC{condition_block_con};
    figure;
    set(gcf,'Position',[200,50,1200,700]);
    plot(FOC_x,FOC_y,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
    xlabel(x_label(condition_block_con));ylabel('FOC');
    xticks(FOC_x);xticklabels(x_ticklabels{condition_block_con,1});
    xlim([min(FOC_x)-0.2,max(FOC_x)+0.2]);ylim([-0.03,1.03]);
    title(title_name,'FontSize',20);set(gca,'FontSize',15);
    if save_picture == 1,picture_name = [title_name,'[',x_label{condition_block_con},']'];print('-djpeg',picture_name);end
end

end