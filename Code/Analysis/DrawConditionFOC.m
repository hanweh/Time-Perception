function DrawConditionFOC(data,draw_condition,first_second,x_label,x_ticklabels,title_name,save_picture)
% 将包含某种实验条件的所有情况的FOC画出来
% draw_condition ={{1,2,3,4,5,6,7,13,19,10,16,22};{7,8,9,10,11,12,1,14,20,4,17,23};{13,14,15,16,17,18,2,8,21,5,11,24};{19,20,21,22,23,24,3,9,15,6,12,18}};
%     %{[顺-后];[逆-后];[顺-前];[逆-前]},每一个里面都是 45-90-180-360
% first_second = {{1,1,1,1,1,1,2,2,2,2,2,2};{1,1,1,1,1,1,2,2,2,2,2,2};{1,1,1,1,1,1,2,2,2,2,2,2};{1,1,1,1,1,1,2,2,2,2,2,2}};

% 读取每个实验条件的数据
draw_condition_rawdata = cell2mat(struct2cell(data.behave.condition));
draw_condition_data = zeros(size(draw_condition_rawdata,3),size(draw_condition_rawdata,1));
for con = 1:size(draw_condition_rawdata,1),draw_condition_data(:,con) = draw_condition_rawdata(con,1,:);end

FOC_condition = cell(size(draw_condition,1),1);
FOC_condition_raw = cell(size(draw_condition,1),1);
FOC_condition_count = cell(size(draw_condition,1),1);
for condition_block_con = 1:size(draw_condition,1)
   condition_num = draw_condition{condition_block_con};
   order = first_second{condition_block_con};
   for condition = 1:size(condition_num,2)
       FOC_condition_raw{condition_block_con}(condition) = 0;
       FOC_condition_count{condition_block_con}(condition) = 0;
       for ii = 1:length(condition_num{condition})
           FOC_condition_raw{condition_block_con}(condition) = FOC_condition_raw{condition_block_con}(condition) + draw_condition_data(condition_num{condition}(ii),order{condition}(ii)+2);
           FOC_condition_count{condition_block_con}(condition) = FOC_condition_count{condition_block_con}(condition) + draw_condition_data(condition_num{condition}(ii),2);
       end
       FOC_condition{condition_block_con} = FOC_condition_raw{condition_block_con}./FOC_condition_count{condition_block_con};
   end
   FOC_x = (1:size(condition_num,2));FOC_y = FOC_condition{condition_block_con};
    figure;
    set(gcf,'Position',[200,50,1200,700]);
    plot(FOC_x,FOC_y,'b','LineWidth',2,'Marker','.','MarkerSize',30,'MarkerEdgeColor','r');
    xlabel(x_label(condition_block_con));ylabel('FOC');
    xticks(FOC_x);xticklabels(x_ticklabels{condition_block_con,1});
    xlim([min(FOC_x)-0.2,max(FOC_x)+0.2]);ylim([-0.03,1.03]);
    title(title_name,'FontSize',20);set(gca,'FontSize',12);
    if save_picture == 1,picture_name = [title_name,'[',x_label{condition_block_con},']'];print('-djpeg',picture_name);end
end

end