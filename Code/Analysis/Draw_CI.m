function [S,X,Y,DELTA] = Draw_CI(x,y,p)
%% ���㻭���������õ�������
 %% Ϊ֮���������������׼��
V(:,2) = ones(length(x),1,class(x));
V(:,1) = x.*V(:,2);
[Q,S.R] = qr(V,0);
S.df = max(0,length(y) - 2);
r = y - V*p';
S.normr = norm(r);
[Y,DELTA] = polyconf(p,x,S,'alpha',0.05,'simopt','on','predopt','curve');

%% �����ݽ��е����������X/Y/DELTA�ֱ��ǵ���֮�����ڻ�ͼ��x/y�����Լ�95%��CI
d_x = x;
d_x(:,2) = (1:size(d_x,1));
d_x = sortrows(d_x,1);
d_y = Y(d_x(:,2));
d_D = DELTA(d_x(:,2));
X = d_x(:,1);
Y = d_y;
DELTA = d_D;
end






