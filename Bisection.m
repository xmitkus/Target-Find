% Returns the theta root, by bisection, of dmin values given initial
% overshot and undershot guesses
% Alexander Mitkus
% April 2, 2012
% APPM 3050, Project 1

function theta_f = Bisection (Theta_01, Theta_02)

% Options (the ode45 controller) is global
global options

% Hold lots of decimal places
format long      

% Set Theta_C as midpoint between 2 initial theta guesses
Theta_C=(Theta_01+Theta_02)/2;

% Integration time interval
tInit  = 0;
tFin   = 1000;

% Initial conditions (4th is declared within while loop)
uInit(1) = 0;
uInit(2) = 0;
uInit(3) = 1500;


% These options control ode45 integration. They were left fairly stock,
% as we found that this works fine for our purposes
options = odeset('Events', @ControlEvents,...
                 'Refine', 12,...
                 'RelTol',1e-3,...
                 'AbsTol',0.0001);

% While loop to control bisection. Breaks when the left and right
% zero bounds become very close together
while abs(Theta_02-Theta_01) > .00001
    
    % Theta for integration is set equal to center theta
    uInit(4) = Theta_C;
    
    % Call ode45 to integrate along this path
    [t,u] = ode45(@System, [tInit, tFin],uInit,options);
    
    % Find dmin values a small bit left and a small bit right from the
    % center to determine whether the function is increasing or 
    % decreasing at that point
    left = dmin(Theta_C-0.0000001);
    right = dmin(Theta_C+0.0000001);
    
    % If decreasing
    if left > right
        
        % Move left bound to center
        Theta_01 = Theta_C;
        
    % If increasing
    elseif right > left    
        
        % Move right bound to center
        Theta_02 = Theta_C;
    
    % If by chance they are equal
    elseif left == right
        
        % Break out of loop and return this value
        break;
    
    end
    
    % Reset center to midpoint of new left and right bounds
    Theta_C = (Theta_01+Theta_02)/2;
    
end

% Return value is equal to midpoint of left and right bounds. Note that
% this is done is line 66, so is not necessary other than to catch the
% case on line 58, as that will break past line 66.
theta_f = (Theta_01+Theta_02)/2;

end   