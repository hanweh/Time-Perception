function [beta_idx,pp_unique,R,J] = nlinfit_beta(x,y,ff,loop_scale,xx)
% ���м��� nlinfit ��ϵĺ��ʲ������ʺ�beta������ʱ
% beta_idx = [��ʼֵ1����ʼֵ2������1������2]
    warning('off')
    pp_ii = cell(loop_scale(2)-loop_scale(1)+1,loop_scale(2)-loop_scale(1)+1);
    R_ii = pp_ii;J_ii = pp_ii;i_num = 1;
    for i1 = loop_scale(1):loop_scale(2)
        for i2 = loop_scale(1):loop_scale(2)
            try
                [pp,R,J,~,~,~] = nlinfit(x,y,ff,[i1 i2]);% nlinfit �����Իع�
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
    pp_ii_ = pp_ii(not(cellfun(@isempty,pp_ii)));%ɾ��cell�еĿ�Ԫ��
    R_ii_= R_ii(not(cellfun(@isempty,R_ii)));%ɾ��cell�еĿ�Ԫ��
    J_ii_= J_ii(not(cellfun(@isempty,J_ii)));%ɾ��cell�еĿ�Ԫ��
    pp_mat = cell2mat(pp_ii_);%��cell����ת��Ϊ����
    R_mat = cell2mat(R_ii_')';%��cell����ת��Ϊ����
%     J_mat = cell2mat(J_ii_')';%��cell����ת��Ϊ����
    % ȷ�����ȣ��Ӷ��ж������Ƿ�һ��
    digits(6)
    pp_mat_4 = double(vpa(pp_mat));
    % ɾ���ظ���
    [C,ia,ic] = unique(pp_mat_4(:,4:5),'rows');%ia��������ɾ���ظ�Ԫ��֮��Ԫ�����ڵ���
    pp_unique = pp_mat(ia,:);%�õ�û���ظ�������
    hold_num = pp_unique(:,1);
    pp_unique = sortrows(pp_unique,[2,3]);%�Ȱ��յ�2�������ٰ��յ�3������
    % �����׼�������������ݳ��ԣ����ֵ�һ��pp1>0����ϾͿ����������˳����������Ϊ�жϱ�׼
    count = find(pp_unique(:,3)>0,2);count = count(end);
    beta_idx = pp_unique(count,4:5);
    R_mat = R_mat(hold_num,:);J_ii_ = J_ii_(hold_num);
    R = R_mat(count,:)';
    J = J_ii_{count};
    
end














