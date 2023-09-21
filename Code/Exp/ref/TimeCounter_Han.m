classdef TimeCounter_Han < mladapter
    properties
        Duration = 0
        Exact
    end
    properties (SetAccess = protected)
        start_time
    end
    properties (Access = protected)
        EndTime
    end
    methods
        function obj = TimeCounter_Han(varargin)
            obj = obj@mladapter(varargin{:});
            obj.Exact = isa(obj.Adapter,'mlstimulus') || isa(obj.Adapter,'mltracker');
        end
        function init(obj,p)
            init@mladapter(obj,p);
            if obj.Exact
                obj.EndTime = obj.Duration - 2*obj.Tracker.Screen.FrameLength;
            else
                obj.EndTime = obj.Duration;
            end
        end
        function fini(obj,p)
            fini@mladapter(obj,p);
            obj.start_time = p.FirstFlipTime;
        end
        function continue_ = analyze(obj,p)
            analyze@mladapter(obj,p);
            obj.Success = obj.EndTime < p.scene_time();
            continue_ = ~obj.Success;
        end
    end
end
