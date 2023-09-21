function Timestair = Time_JND_InitStair(upordown, Con_num, ntrial, initJump)
% ��ʼ�����ݣ�upordown=-1Ϊ�ݶ��½���nlevels��һ���ж��ٸ�ʵ��������ntrial��һ��ʵ������һ�����ж��ٸ�trial��initJump�ǳ�ʼ����
% If the vector upordown is 1 by N, then N stairs are initiated. The
% element being 1 or 0 represents the corresponding staircase is to go downstairs
% or upstairs��[1 1] for two descending staircases per block
% upordown=[-1,-1,-1,-1];% -1���½���1������
% Con_num=20;% number of levels of the condition
% ntrial=40; %how many trials
% initJump=4;% initial number of levels to jump on a staircase
%% ��ʼ��
Timestair.upordown = upordown;
Timestair.nstairs = length(upordown);                % һ���ɼ�������ͬʱ�����ݶȼ��
Timestair.ntrial = ntrial;                           % һ��ʵ������һ�������ٸ�trial
Timestair.Con_num = Con_num;                         % ��ʼʵ������һ�����ٸ�
Timestair.initJump = ones(1,Timestair.nstairs).*initJump;% ��ʼ����
Timestair.trials = zeros(ntrial,Timestair.nstairs);   % ÿ�����͵������У�ÿ��trial��������������ʼΪ0
Timestair.TorF = zeros(ntrial,Timestair.nstairs);     % ÿ�����͵������У�ÿ��trial�ķ�Ӧ��������ʼΪ0
Timestair.st_num = ones(1,Timestair.nstairs);      % ��¼ÿ�����͵������У���ǰ�Ѿ����˶��ٸ�trial������ȷ��֮�������ھ����е�λ��
Timestair.nextRun = ones(1,Timestair.nstairs);     % ĳ�����͵������´��Ƿ��������ʵ�飨���ҵ�����С�ɾ����ֹͣ�����ͣ�
Timestair.corinarow = zeros(1,Timestair.nstairs);  % ��Ե�����
Timestair.nrevs = zeros(1,Timestair.nstairs);      % ��ת�Ĵ���
Timestair.prevchange = zeros(1,Timestair.nstairs); % ��һ�εķ�ת״̬�������0�򲻷�ת�������1��ת
Timestair.t = 1;                                   % ��ǰ�ǵڶ��ٴ�ʵ�飨�������жϣ�
Timestair.ExpRun = 1;                              % ����ʵ���Ƿ����У������1�����У������0������
%% ȷ����һ��ʵ��������������������һ��
for i = 1:Timestair.nstairs
    if upordown == -1                              % ������յݼ�˳����
        Timestair.trials(1,i) = Con_num;            % ��һ�� trial ��ʵ�������������һ��ԭʼʵ������
    elseif upordown == 1                           % ������յ���˳����
        Timestair.trials(1,i) = 1;                 % ��һ�� trial ��ʵ���������ǵ�һ��ԭʼʵ������
    end
end
%% ��ʲô����˳����ֲ�ͬ���͵ļ���ʵ��̼�
Timestair.whichstair = zeros(Timestair.nstairs*Timestair.ntrial,1);
for i = 1:Timestair.nstairs
    Timestair.whichstair((i-1)*Timestair.ntrial+1:(i-1)*Timestair.ntrial+Timestair.ntrial) = i.*ones(Timestair.ntrial,1);
end
Timestair.whichstair = Timestair.whichstair(randperm(length(Timestair.whichstair)));% ȷ������trial�������е����ĸ����͵�����������ȷ��֮�������ھ����е�λ��



end
