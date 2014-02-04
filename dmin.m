% Returns minimum distance to target along a single initial firing angle
% Alexander Mitkus
% April 4, 2012
% APPM 3050, Project 1

function low = dmin (theta_0)

global XT YT V_0 options

% Integration time interval
tInit  = 0;           
tFin   = 1000;

% Initial conditions
uInit(1) = 0;          
uInit(2) = 0;
uInit(3) = V_0;
uInit(4) = theta_0;

% Integrate along that path
[t,u] = ode45(@System, [tInit, tFin],uInit,options);

% Calculate distance array at each point along path
d=sqrt(((u(:,1)-XT).^2)+(u(:,2)-YT).^2);

% Return the minimum of this array
low = min(d);

end