% Contains the system of equations for integration
% Alexander Mitkus
% April March 24, 2012
% APPM 3050, Project 1

function udot = System( t, u)

global A B V_PA g CDM

% Define V_P/A
V_PA = sqrt((u(3)*cos(u(4)) - A)^2 + (u(3)*sin(u(4)) - B)^2);

% This is the system of equations

% X
udot(1) = u(3)*cos(u(4));

% Y
udot(2) = u(3)*sin(u(4));%y

% V
udot(3) = -CDM*V_PA*(u(3)-A*cos(u(4))-B*sin(u(4)))-g*sin(u(4));

% Theta
udot(4) = -CDM/u(3)*V_PA*((A*sin(u(4)))-(B*cos(u(4))))-g/u(3)*cos(u(4));

% Make udot column vector
udot = [udot(1), udot(2), udot(3), udot(4)]';

end