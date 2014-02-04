% Controls the ode45 integrator
% Alexander Mitkus
% April 3, 2012
% APPM 3050, Project 1

function [value, stopInteg,direction] = ControlEvents( t, u )

global XT YT v d

    % Calculate distance and velocity
    d=[(u(1)-XT),(u(2)-YT)];
    v=[u(3)*cos(u(4)),u(3)*sin(u(4))];
    
    % Control value is the dot product of velocity and distance vectors
    value = dot(v,d);  
    
    % Value will be very unlikely to be exactly zero,
    % so this will set it to zero if it is very close.
    if abs(value)<.0001 ;
        value=0;
    end
    
    stopInteg = 1;
    
    direction=0;
    
end





