function [beta_idx,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx)
% 进行计算 nlinfit 拟合的合适参数，适合beta有两个时
% beta_idx = [初始值1，初始值2，参数1，参数2]
    warning('off')
    pp_ii = cell(loop_scale(2)-loop_scale(1)+1,loop_scale(2)-loop_scale(1)+1);
    R_ii = pp_ii;J_ii = pp_ii;i_num = 1;
    for i1 = loop_scale(1):loop_scale(2)
        for i2 = loop_scale(1):loop_scale(2)
            try
                [pp,R,J,~,~,~] = nlinfit(x,y,ff,[i1 i2]);% nlinfit 非线性回归
                if pp(1) && ~isempty(lastwarn) && ~isempty(xx(find(ff(pp,xx)*100>=75,1)))
%                     disp_str = ['i1=',num2str(i1),',i2=',num2str(i2),',pp=',num2str(pp)];
%                     disp(disp_str)
                    pp_ii{i1,i2}(1) = i_num;pp_ii{i1,i2}(2) = i1;pp_ii{i1,i2}(3) = i2;pp_ii{i1,i2}(4:5) = pp;
                    R_ii{i1,i2} = R; J_ii{i1,i2} =J; 
                    i_num = i_num +1;
                end
            catch
%                 disp_str = ['i1=',num2str(i1),',i2=',num2str(i2)];
%                 disp(disp_str)
            end

        end
    end

%     pp_ii = pp_ii';R_ii = R_ii';J_ii = J_ii';
    pp_ii_ = pp_ii(not(cellfun(@isempty,pp_ii)));%删除cell中的空元素
    R_ii_= R_ii(not(cellfun(@isempty,R_ii)));%删除cell中的空元素
    J_ii_= J_ii(not(cellfun(@isempty,J_ii)));%删除cell中的空元素
    pp_mat = cell2mat(pp_ii_);%将cell数据转换为数组
    R_mat = cell2mat(R_ii_')';%将cell数据转换为数组
%     J_mat = cell2mat(J_ii_')';%将cell数据转换为数组
    % 确定精度，从而判断数据是否一致
    digits(6)
    pp_mat_4 = double(vpa(pp_mat));
    % 删除重复行
    [C,ia,ic] = unique(pp_mat_4(:,4:5),'rows');%ia是数据中删除重复元素之后元素所在的行
    pp_unique = pp_mat(ia,:);%得到没有重复的数据
    hold_num = pp_unique(:,1);
    pp_unique = sortrows(pp_unique,[2,3]);%先按照第2列排序，再按照第3列排序
    % 输出标准。经过几个数据尝试，发现第一个pp1>0的组合就可以输出，因此初步将这个作为判断标准
    count = find(pp_unique(:,3)>0,2);count = count(end);
    beta_idx = pp_unique(count,4:5);
    R_mat = R_mat(hold_num,:);J_ii_ = J_ii_(hold_num);
    R = R_mat(count,:)';
    J = J_ii_{count};
    
end














