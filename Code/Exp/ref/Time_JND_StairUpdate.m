function Timestair = Time_JND_StairUpdate(Timestair, TorF, ncorinarow, nrevstosmall)
%     initJump = 3; % initial number of levels to jump on a staircase
%     ncorinarow = 2; % after these many correct responses, we go down to the next level
%     nrevstosmall = 4; % after these many reversals, the step size is reduced
%     TorF=1;

%% ��ǰ��� trial ������
thestair = Timestair.whichstair(Timestair.t);                              % ��ǰ���trial���е����ĸ����͵�����
%Update staircase
thetrial = Timestair.st_num(thestair);                                     % ��ǰ���trial��������������ĵڼ���trial
Timestair.TorF(thetrial,thestair) = TorF;                                  % ������͵����������trial�Ƿ���ȷ
Timestair.st_num(thestair) = Timestair.st_num(thestair)+1;                 % ��һ��trial��������������ĵڼ���trial
%% ȷ����һ��ʵ����ݶȷ���
if Timestair.upordown(thestair) == 1, TorF = TorF - 1;end                  % ����ǵ�������������жϴ��˲������ߣ��ж϶���������
if (TorF)
	Timestair.corinarow(thestair) = Timestair.corinarow(thestair)+1;       % ��ǰ�������͵�ʵ��������ԵĴ���
	if Timestair.corinarow(thestair) == ncorinarow                         % �����Ե������ﵽ���������
		change = Timestair.upordown(thestair);                             % ֮��Ҫ�仯�ķ�ʽ
		Timestair.corinarow(thestair) = 0;                                 % �������͵�ʵ��������ԵĴ�������
	else
		change = 0;                                                        % ֮�󲻱仯
	end
else
    Timestair.upordown(thestair) = Timestair.upordown(thestair)*(-1);      
	change = Timestair.upordown(thestair);                                 % ֮��ı仯Ҫ��Ĭ���෴�ķ�����б仯
	Timestair.corinarow(thestair) = 0;                                     % �������͵�ʵ��������ԵĴ�������
end

%% ��һ�� trial �����ݶȱ仯�ķ��򼰲���
if Timestair.prevchange(thestair) == 0                                     % ���ǰһ�� trial �ı仯״̬�� ���������ݶȱ仯
	Timestair.prevchange(thestair) = change;                               % ��ǰ������͵�ʵ�������ı仯״̬���и�ֵ
elseif (change ~= 0) && (change ~= Timestair.prevchange(thestair))         % ����仯״̬���ǲ��仯�����ұ仯״̬��ǰһ�α仯״̬��ͬ
	Timestair.nrevs(thestair) = Timestair.nrevs(thestair)+1;               % ��ʾ��һ��ʵ����Ҫ�����ݶȷ�ת�������¼�˷�ת�˶��ٴ�
	Timestair.prevchange(thestair) = change;                               % ��һ�ν����ݶȱ仯�ķ���
end

if Timestair.nrevs(thestair) <= nrevstosmall                               % �����ת�����������ת����
	changeJump = change*Timestair.initJump(thestair);                      % �仯���ݶȾ��� �仯����*����
else
    Timestair.nrevs(thestair) = 0;
    JumpShift = ceil(Timestair.initJump(thestair)/2);
    % �ж�ʲô�����²�����С
    % Ϊ��ֹ��ǰ���������������ڲ�����С�ķ���ʱ��Ϊ���ⲽ����0����������-1
    % Ϊ��ֹ��ǰ������������Ϊ1ʱ������Ҫ��ͬ������γ��ֲŽ�������
    if hetrial > ncorinarow*3+1
        a1 = Timestair.trials(thetrial-ncorinarow*3:thetrial-1,thestair) == Timestair.trials(thetrial,thestair);
        a2 = Timestair.trials(thetrial-ncorinarow*3:thetrial-1,thestair) == Timestair.trials(thetrial,thestair)+Timestair.initJump(thestair);
        a3 = Timestair.trials(thetrial-ncorinarow*3:thetrial-1,thestair) == Timestair.trials(thetrial,thestair)-Timestair.initJump(thestair);
    end
    if Timestair.initJump(thestair) == JumpShift && Timestair.initJump(thestair) ~= 1
        Timestair.initJump(thestair) = Timestair.initJump(thestair) - 1;
    else
        Timestair.initJump(thestair) = Timestair.initJump(thestair) - JumpShift;% ������С
    end
    
    if Timestair.initJump(thestair) == 0 && thetrial > ncorinarow*3+1 && (~all(a1+a2) || ~all(a1+a3))
        Timestair.initJump(thestair) = 1;
    end
    changeJump = change*Timestair.initJump(thestair);
end

if Timestair.initJump(thestair) == 0                                       % ����������0����֮���������͵���������������
    Timestair.nextRun(thestair) = 0;
end
%% ��һ�����е�����ѡȡ
Timestair.trials(thetrial+1,thestair) = Timestair.trials(thetrial,thestair)+changeJump;
if(Timestair.trials(thetrial+1,thestair) < 1)                              % ��һ��ʵ��������Ѿ�������С������
    if thetrial > ncorinarow*2 && all(Timestair.trials(thetrial-ncorinarow*2+1:thetrial,thestair) == 1 == 1)
        % ���֮ǰ�Ѿ�����С�����ˣ����Ҳ��Ǹտ�ʼ�������⣬��ô֮��Ͳ������и����͵�����
        Timestair.nextRun(thestair) = 0;
        warning('UpdateStair: Reached bottom of staircase!')
    else
        Timestair.trials(thetrial+1,thestair) = 1;
    end
elseif(Timestair.trials(thetrial+1,thestair) > Timestair.Con_num)           % ��һ�ε������Ѿ��������������
    if thetrial > ncorinarow*2 && all(Timestair.trials(thetrial-ncorinarow*2+1:thetrial,thestair) == Timestair.Con_num == 1)
        % ���֮ǰ�Ѿ�����������ˣ����Ҳ��Ǹտ�ʼ�������⣬��ô֮��Ͳ������и����͵�����
        Timestair.nextRun(thestair) = 0;
        warning('UpdateStair: Reached top of staircase!')
    else
        Timestair.trials(thetrial+1,thestair) = Timestair.Con_num;
    end
end

%% ���ĳ�����͵���������Ҫ����ʵ�飬��ɾ��֮��ʵ�������еĸ���������
if Timestair.nextRun(thestair) == 0
    condition_all = Timestair.whichstair;                                  % ԭʼ������ʵ������
    condition_befor = condition_all(1:Timestair.t);                        % ֮ǰ���й������е�ʵ������
    condition_after = condition_all(Timestair.t+1:end);                    % ֮��û�����й���ʵ������
    condition_after(condition_after == thestair) = [];                     % ��֮��û���й���ʵ�������е� thestair ������͵�����ɾ��
    Timestair.whichstair = [];                                             % ��֮ǰ��ʵ����������˳��ɾ��
    Timestair.whichstair = [condition_befor;condition_after];              % �γ��µ�ʵ����������˳��
    Timestair.nextRun(thestair) = -1;                                      % ɾ��֮�󣬱����ظ��˲���
end
%% ��һ�� trial �ǵڼ���trial���Ƿ�������
Timestair.t = Timestair.t+1;                                               % ��һ��trial�ǵڶ��ٴ�ʵ�飨�������жϵģ�
if Timestair.t > length(Timestair.whichstair)                              % ����Ѿ���������һ��ʵ���ˣ��� ExpRun ���� 0 
    Timestair.ExpRun = 0;
end


end
