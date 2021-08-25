function [value,isterminal,direction] = curves_no_slip_event(t,y,params)
%% curves_no_slip_event
% Levi Manring, Duke University
% 2021
%
% This function is used by the curves_slip_ode to check and see if the vehicle
% stops slipping.
%
% Inputs:
%   t: 1x1 double inidicating the timestep of ode integration
%   y: 1xN array inticating the states of the dynamics model from the ode
%   params: a parameter structure including the masses, moments of
%           inertia, and dimensions needed to define the planar vehicle model
%
% Outputs: see https://www.mathworks.com/help/matlab/math/ode-event-location.html
%   value: 1x1 double describing the value of the event function
%   isterminal: 1x1 boulean determining termination of integration (1
%           terminates, 0 continues)
%   direction: 1x1 double, 0 if all events are to be found, +1 if only
%           events while event function is increasing, -1 if only events while
%           event function is decreasing

%%

% check the relative velocity between wheel A and the ditch surface
value = v_rel_fcn(y,params);

% choose to give a status report on zero-finding
if abs(value) < 3
    
    fprintf('%4.10f y, %4.10f ydot, %3.8f value \n',y(1), y(2),value);
    
end

isterminal = 1;   % stop the integration
direction = 0;  

end