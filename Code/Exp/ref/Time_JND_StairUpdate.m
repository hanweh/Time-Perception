function Timestair = Time_JND_StairUpdate(Timestair, TorF, ncorinarow, nrevstosmall)
%     initJump = 3; % initial number of levels to jump on a staircase
%     ncorinarow = 2; % after these many correct responses, we go down to the next level
%     nrevstosmall = 4; % after these many reversals, the step size is reduced
%     TorF=1;

%% 当前这个 trial 的条件
thestair = Timestair.whichstair(Timestair.t);                              % 当前这个trial进行的是哪个类型的条件
%Update staircase
thetrial = Timestair.st_num(thestair);                                     % 当前这个trial是这个类型条件的第几个trial
Timestair.TorF(thetrial,thestair) = TorF;                                  % 这个类型的条件的这次trial是否正确
Timestair.st_num(thestair) = Timestair.st_num(thestair)+1;                 % 下一个trial是这个类型条件的第几个trial
%% 确定下一个实验的梯度方向
if Timestair.upordown(thestair) == 1, TorF = TorF - 1;end                  % 如果是递增的情况，则判断错了才往后走，判断对了往回走
if (TorF)
	Timestair.corinarow(thestair) = Timestair.corinarow(thestair)+1;       % 当前这种类型的实验条件答对的次数
	if Timestair.corinarow(thestair) == ncorinarow                         % 如果答对的数量达到最大答对数量
		change = Timestair.upordown(thestair);                             % 之后要变化的方式
		Timestair.corinarow(thestair) = 0;                                 % 这种类型的实验条件答对的次数归零
	else
		change = 0;                                                        % 之后不变化
	end
else
    Timestair.upordown(thestair) = Timestair.upordown(thestair)*(-1);      
	change = Timestair.upordown(thestair);                                 % 之后的变化要以默认相反的方向进行变化
	Timestair.corinarow(thestair) = 0;                                     % 这种类型的实验条件答对的次数归零
end

%% 下一次 trial 进行梯度变化的方向及步幅
if Timestair.prevchange(thestair) == 0                                     % 如果前一个 trial 的变化状态是 不进行梯梯度变化
	Timestair.prevchange(thestair) = change;                               % 当前这个类型的实验条件的变化状态进行赋值
elseif (change ~= 0) && (change ~= Timestair.prevchange(thestair))         % 如果变化状态不是不变化，并且变化状态和前一次变化状态不同
	Timestair.nrevs(thestair) = Timestair.nrevs(thestair)+1;               % 表示下一次实验需要进行梯度反转，这里记录了反转了多少次
	Timestair.prevchange(thestair) = change;                               % 下一次进行梯度变化的方向
end

if Timestair.nrevs(thestair) <= nrevstosmall                               % 如果反转次数少于最大反转次数
	changeJump = change*Timestair.initJump(thestair);                      % 变化的梯度就是 变化方向*步幅
else
    Timestair.nrevs(thestair) = 0;
    JumpShift = ceil(Timestair.initJump(thestair)/2);
    % 判断什么条件下步幅缩小
    % 为防止提前结束，当步幅等于步幅减小的幅度时，为避免步幅变0，调整步幅-1
    % 为防止提前结束，当步幅为1时，必须要相同条件多次呈现才结束条件
    if hetrial > ncorinarow*3+1
        a1 = Timestair.trials(thetrial-ncorinarow*3:thetrial-1,thestair) == Timestair.trials(thetrial,thestair);
        a2 = Timestair.trials(thetrial-ncorinarow*3:thetrial-1,thestair) == Timestair.trials(thetrial,thestair)+Timestair.initJump(thestair);
        a3 = Timestair.trials(thetrial-ncorinarow*3:thetrial-1,thestair) == Timestair.trials(thetrial,thestair)-Timestair.initJump(thestair);
    end
    if Timestair.initJump(thestair) == JumpShift && Timestair.initJump(thestair) ~= 1
        Timestair.initJump(thestair) = Timestair.initJump(thestair) - 1;
    else
        Timestair.initJump(thestair) = Timestair.initJump(thestair) - JumpShift;% 步幅缩小
    end
    
    if Timestair.initJump(thestair) == 0 && thetrial > ncorinarow*3+1 && (~all(a1+a2) || ~all(a1+a3))
        Timestair.initJump(thestair) = 1;
    end
    changeJump = change*Timestair.initJump(thestair);
end

if Timestair.initJump(thestair) == 0                                       % 如果步幅变成0，则之后这种类型的条件将不再运行
    Timestair.nextRun(thestair) = 0;
end
%% 下一次运行的条件选取
Timestair.trials(thetrial+1,thestair) = Timestair.trials(thetrial,thestair)+changeJump;
if(Timestair.trials(thetrial+1,thestair) < 1)                              % 下一次实验的条件已经低于最小条件了
    if thetrial > ncorinarow*2 && all(Timestair.trials(thetrial-ncorinarow*2+1:thetrial,thestair) == 1 == 1)
        % 如果之前已经是最小条件了，并且不是刚开始就有问题，那么之后就不再运行该类型的条件
        Timestair.nextRun(thestair) = 0;
        warning('UpdateStair: Reached bottom of staircase!')
    else
        Timestair.trials(thetrial+1,thestair) = 1;
    end
elseif(Timestair.trials(thetrial+1,thestair) > Timestair.Con_num)           % 下一次的条件已经高于最大条件了
    if thetrial > ncorinarow*2 && all(Timestair.trials(thetrial-ncorinarow*2+1:thetrial,thestair) == Timestair.Con_num == 1)
        % 如果之前已经是最大条件了，并且不是刚开始就有问题，那么之后就不再运行该类型的条件
        Timestair.nextRun(thestair) = 0;
        warning('UpdateStair: Reached top of staircase!')
    else
        Timestair.trials(thetrial+1,thestair) = Timestair.Con_num;
    end
end

%% 如果某个类型的条件不需要继续实验，则删除之后实验条件中的该类型条件
if Timestair.nextRun(thestair) == 0
    condition_all = Timestair.whichstair;                                  % 原始的所有实验条件
    condition_befor = condition_all(1:Timestair.t);                        % 之前运行过的所有的实验条件
    condition_after = condition_all(Timestair.t+1:end);                    % 之后还没有运行过的实验条件
    condition_after(condition_after == thestair) = [];                     % 将之后还没运行过的实验条件中的 thestair 这个类型的条件删掉
    Timestair.whichstair = [];                                             % 将之前的实验条件类型顺序删掉
    Timestair.whichstair = [condition_befor;condition_after];              % 形成新的实验条件类型顺序
    Timestair.nextRun(thestair) = -1;                                      % 删过之后，避免重复此步骤
end
%% 下一次 trial 是第几次trial，是否还能运行
Timestair.t = Timestair.t+1;                                               % 下一次trial是第多少次实验（进行了判断的）
if Timestair.t > length(Timestair.whichstair)                              % 如果已经不存在下一次实验了，则 ExpRun 返回 0 
    Timestair.ExpRun = 0;
end


end
