% Returns the proper firing angle to hit a target at a given point with
% given wind present
% Alexander Mitkus
% March 21, 2012
% APPM 3050, Project 1

function Theta_0 = Target1( coord, wind )

% Declare necessary global variables
global XT YT A B V_0 CDM g

% XT and YT are target coordinates 
XT = coord(1);
YT = coord(2);

% A and B are wind coordinates
A = wind(1);
B = wind(2);

% CDM is drag coefficient
CDM = 0.002;

% Gravitational constant
g = 9.81;
V_0 = 1500;

% Integration time interval
tInit  = 0;          
tFin   = 1000;

% Take direct shot at target, then subtract pi/12 to be sure.
% This is now the undershot
Theta_01=atan(YT/XT)-pi/12;

% Add pi/2 to the undershot. This is the overshot
Theta_02=Theta_01+pi/2;

% These are the initial values for integration
% uInit(1) = x = 0 because we start at the origin
% uInit(2) = y = 0 because we start at the origin
% uInit(3) = v = V_0 because that initial speed is given
% uInit(4) = theta = undershot 
uInit(1) = 0;            
uInit(2) = 0;
uInit(3) = V_0;
uInit(4) = Theta_01;

% Call Bisection with upper and lower initial theta guesses
Theta_0 = Bisection(Theta_01, Theta_02);

% Uncomment the following section to plot some dmins
% and check that the returned value makes sense

%{
theta_0 = zeros(16,1);
min = zeros(16,1);
for i=1:16
    theta_0(i,1) = pi/32*i;
    min(i,1) = dmin(theta_0(i,1));
end
plot(theta_0,min);
disp('Theta1: ')
disp(Theta_01)
disp('Theta2: ')
disp(Theta_02)
%}

end