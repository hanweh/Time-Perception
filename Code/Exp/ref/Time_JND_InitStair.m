function Timestair = Time_JND_InitStair(upordown, Con_num, ntrial, initJump)
% 初始化数据，upordown=-1为梯度下降，nlevels是一共有多少个实验条件，ntrial是一种实验条件一共进行多少个trial，initJump是初始步幅
% If the vector upordown is 1 by N, then N stairs are initiated. The
% element being 1 or 0 represents the corresponding staircase is to go downstairs
% or upstairs，[1 1] for two descending staircases per block
% upordown=[-1,-1,-1,-1];% -1是下降，1是上升
% Con_num=20;% number of levels of the condition
% ntrial=40; %how many trials
% initJump=4;% initial number of levels to jump on a staircase
%% 初始化
Timestair.upordown = upordown;
Timestair.nstairs = length(upordown);                % 一共由几种条件同时进行梯度检测
Timestair.ntrial = ntrial;                           % 一种实验条件一共做多少个trial
Timestair.Con_num = Con_num;                         % 初始实验条件一共多少个
Timestair.initJump = ones(1,Timestair.nstairs).*initJump;% 初始步幅
Timestair.trials = zeros(ntrial,Timestair.nstairs);   % 每个类型的条件中，每个trial的条件，不过初始为0
Timestair.TorF = zeros(ntrial,Timestair.nstairs);     % 每个类型的条件中，每个trial的反应，不过初始为0
Timestair.st_num = ones(1,Timestair.nstairs);      % 记录每个类型的条件中，当前已经做了多少个trial，用于确定之后数据在矩阵中的位置
Timestair.nextRun = ones(1,Timestair.nstairs);     % 某个类型的条件下次是否继续进行实验（若找到了最小可觉差即可停止该类型）
Timestair.corinarow = zeros(1,Timestair.nstairs);  % 答对的数量
Timestair.nrevs = zeros(1,Timestair.nstairs);      % 反转的次数
Timestair.prevchange = zeros(1,Timestair.nstairs); % 上一次的反转状态。如果是0则不反转，如果是1则反转
Timestair.t = 1;                                   % 当前是第多少次实验（进行了判断）
Timestair.ExpRun = 1;                              % 整个实验是否运行，如果是1则运行，如果是0则不运行
%% 确定第一个实验条件是总体条件的哪一个
for i = 1:Timestair.nstairs
    if upordown == -1                              % 如果按照递减顺序检测
        Timestair.trials(1,i) = Con_num;            % 第一个 trial 的实验条件就是最后一个原始实验条件
    elseif upordown == 1                           % 如果按照递增顺序检测
        Timestair.trials(1,i) = 1;                 % 第一个 trial 的实验条件就是第一个原始实验条件
    end
end
%% 已什么样的顺序呈现不同类型的几个实验刺激
Timestair.whichstair = zeros(Timestair.nstairs*Timestair.ntrial,1);
for i = 1:Timestair.nstairs
    Timestair.whichstair((i-1)*Timestair.ntrial+1:(i-1)*Timestair.ntrial+Timestair.ntrial) = i.*ones(Timestair.ntrial,1);
end
Timestair.whichstair = Timestair.whichstair(randperm(length(Timestair.whichstair)));% 确定所有trial到底运行的是哪个类型的条件，并且确定之后数据在矩阵中的位置



end
