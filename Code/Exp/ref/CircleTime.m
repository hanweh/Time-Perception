classdef CircleTime < mlstimulus
    properties
        Center   % [x,y] in degrees
        Frame    %frame
        DotSize    % in degrees
        DotColor
        Dot_position %每一帧点的坐标
        NumDot
        Interleaf
        first_Interleaf
        color_change %1:相同位置的帧颜色发生变化；其他：相同位置的帧颜色不变
        position_change %1:中间重复帧跳出屏幕；其他：中间重复帧重复之前位置
        List
    end
    properties (Access = protected)
        DotID
        DotPosition
        ScrPosition
        Update
        i_frame
        i_Interleaf
        color
    end
    
    methods
        function obj = CircleTime(varargin)
            obj = obj@mlstimulus(varargin{:});
            obj.List = { [0 0], 1, 0.15, [1 1 1], [0 0 0], 1, 1, 1, 0, 0};
        end
        function delete(obj), destroy_dots(obj); end
        function set.Center(obj,val), row = numchk(obj,val,'Center'); obj.Center = val; update_ScrPosition(obj,row); end %#ok<*MCSUP> 
        function set.NumDot(obj,val), row = numchk(obj,val,'NumDot'); obj.NumDot = val; update_DotID(obj,row); update_DotPosition(obj,row); update_ScrPosition(obj,row);  end
        function set.DotSize(obj,val), row = numchk(obj,val,'DotSize'); obj.DotSize = val; update_DotSize(obj,row); end
        function set.DotColor(obj,val), row = numchk(obj,val,'DotColor'); obj.DotColor = val; update_DotColor(obj,row); end
        function set.Interleaf(obj,val), row = numchk(obj,val,'Interleaf'); obj.Interleaf = val; update_DotPosition(obj,row); end
        function set.List(obj,val), obj.List = val; create_graphic(obj); end
        function init(obj,p)
            init@mladapter(obj,p);  % pass init@mlstimulus
            obj.Triggered = false;
            if ~obj.Trigger
                obj.Triggered = true; 
                activate_dots(obj,true);
                obj.i_frame = 1;
                obj.i_Interleaf = obj.first_Interleaf;
            end
        end
        function fini(obj,p)
            fini@mladapter(obj,p);
            activate_dots(obj,false);
        end
        function continue_ = analyze(obj,p)
            continue_ = analyze@mladapter(obj,p);  % pass analyze@mlstimulus
            obj.Success = obj.Adapter.Success;
            if ~obj.Triggered && obj.Success, obj.Triggered = true; activate_dots(obj,true); p.eventmarker(obj.EventMarker); end
        end
        function draw(obj,p)
            draw@mlstimulus(obj,p);
            if obj.Triggered
                for m=1:length(obj.DotID)
                    if obj.color_change == 1
                        % 中间的重复出现的点颜色不同
                        if obj.i_Interleaf == 1 || obj.i_Interleaf == 2
                            obj.color = repmat([1,0,0],obj.NumDot(m,:),1);
                        elseif obj.i_Interleaf == 3 || obj.i_Interleaf == 4
                            obj.color = repmat([0,1,0],obj.NumDot(m,:),1);
                        elseif obj.i_Interleaf == 5 || obj.i_Interleaf == 6
                            obj.color = repmat([0,0,1],obj.NumDot(m,:),1);
                        end
                        mglsetproperty(obj.DotID{m,1},'active',true,'edgecolor',obj.color,'facecolor',obj.color);
                    end
                    
%                     mglsetorigin(obj.DotID{m,1},obj.DotPosition{m}(1:2)+obj.ScrPosition{m});
%                     obj.i_frame
%                     obj.i_Interleaf
%                     disp('**************')
                    obj.DotPosition{m} = obj.Dot_position(:,:,obj.i_frame) .* obj.Tracker.Screen.PixelsPerDegree;
                    if obj.position_change == 1
                        if obj.i_Interleaf ~= 1 && obj.i_Interleaf ~= 2
                            % 如果要中间有间隔的呈现点，而不是重复出现之前的点位置
                            obj.DotPosition{m} = obj.Dot_position(:,:,obj.i_frame).*obj.Tracker.Screen.PixelsPerDegree.*100;
                        end
                    end
                    
                    if obj.i_Interleaf<obj.Interleaf
                        obj.i_Interleaf=obj.i_Interleaf+1;
                    else
                        obj.i_Interleaf = 1;
                        obj.i_frame = obj.i_frame + 1;
                    end
                    if 0==mod(obj.i_frame,obj.Frame+1),obj.i_frame = obj.i_frame - obj.Frame; end
%                     disp('***');
%                     obj.i_frame
%                     obj.i_Interleaf
                    mglsetorigin(obj.DotID{m,1},obj.DotPosition{m}(1:2)+obj.ScrPosition{m});
                end
            end
        end
    end
    
    methods (Access = protected)
        function destroy_dots(obj), for m=1:length(obj.DotID), mgldestroygraphic(obj.DotID{m}); end, obj.DotID = []; end
        function activate_dots(obj,state), for m=1:length(obj.DotID), mglactivategraphic(obj.DotID{m},state); end, end
        function create_graphic(obj)
            destroy_dots(obj);
            [nobj,col] = size(obj.List);
            list = cell(nobj,10);
            list(:,1:col) = obj.List;%将List的前8列的值分别赋值给list的前8列
            obj.GraphicID = NaN(1,nobj);            
            Center = zeros(nobj,2); %#ok<*PROP>
            Frame = zeros(nobj,1);
            DotSize = ones(nobj,1);
            DotColor = ones(nobj,3);
            Dot_position = zeros(nobj,3);
            NumDot = ones(nobj,1);
            Interleaf = ones(nobj,1);
            first_Interleaf = ones(nobj,1);
            color_change = zeros(1);
            position_change = zeros(1);

            for m=1:nobj
                if ~isempty(list{m,1}), Center(m,:) = list{m,1}; end
                if ~isempty(list{m,2}), Frame(m,:) = list{m,2}; end
                if ~isempty(list{m,3}), DotSize(m,:) = list{m,3}; end
                if ~isempty(list{m,4}), DotColor(m,:) = list{m,4}; end
                if ~isempty(list{m,5}), Dot_position(m,:) = list{m,5}; end
                if ~isempty(list{m,6}), NumDot(m,:) = list{m,6}; end
                if ~isempty(list{m,7}), Interleaf(m,:) = list{m,7}; end
                if ~isempty(list{m,8}), first_Interleaf(m,:) = list{m,8}; end
                if ~isempty(list{m,9}), color_change = list{m,9}; end
                if ~isempty(list{m,10}), position_change = list{m,10}; end
            end
            obj.Update = false;
            obj.Center = Center;
            obj.Frame = Frame;
            obj.DotSize = DotSize;
            obj.DotColor = DotColor;
            obj.Dot_position = Dot_position;
            obj.NumDot = NumDot;
            obj.Interleaf = Interleaf;
            obj.first_Interleaf = first_Interleaf;
            obj.color_change = color_change;
            obj.position_change = position_change;

            obj.DotID = cell(nobj,1);
            obj.DotPosition = cell(nobj,1);
            obj.ScrPosition = cell(nobj,1);

            obj.Update = true;
            update_DotID(obj,1:nobj);
            update_DotPosition(obj,1:nobj);
            update_ScrPosition(obj,1:nobj);   
            activate_dots(obj,false);
        end
        function update_DotSize(obj,row)  % DotSize
            if ~obj.Update, return, end
            for m=row, mglsetproperty(obj.DotID{m},'size',obj.Tracker.Screen.PixelsPerDegree*obj.DotSize(m,:)); end
        end
        function update_DotColor(obj,row)  % DotColor
            if ~obj.Update, return, end
            for m=row, mglsetproperty(obj.DotID{m},'edgecolor',obj.DotColor(m,:),'facecolor',obj.DotColor(m,:)); end
        end
        function update_DotID(obj,row)  % NumDot
            if ~obj.Update, return, end
            for m=row
                mgldestroygraphic(obj.DotID{m});
                obj.DotID{m} = NaN(1,obj.NumDot(m,:));
                dotsize = obj.Tracker.Screen.PixelsPerDegree * obj.DotSize(m,:);
                for n=1:obj.NumDot(m,:), obj.DotID{m}(n) = mgladdcircle([obj.DotColor(m,:); obj.DotColor(m,:)],dotsize); end
                mglactivategraphic(obj.DotID{m},false);
            end
        end
        function update_DotPosition(obj,row)  %  NumDot
            if ~obj.Update, return, end
            for m=row
                obj.DotPosition{m} = obj.Dot_position(:,:,1) .*obj.Tracker.Screen.PixelsPerDegree;
            end
        end
        function update_ScrPosition(obj,row)  % Position, NumDot
            %为每一个点设置一个初始的位置，为ScrPosition
            if ~obj.Update, return, end
            for m=row, obj.ScrPosition{m} = repmat(obj.Tracker.CalFun.deg2pix(obj.Center(m,:)),obj.NumDot(m,:),1); end            
        end
    end
end

