function explode(v, ang, time, mag, mass1, mass2)
%EXPLODE: This function simulates an object being shot from a cannon and
%plots the trajectory of the object before the explosion, trajectory of the
%centroid, and the two separate masses. This functions takes the velocity,
%angle, time, impulse magnitude of the explosion along with the masses as
%inputs and produces no outputs.
%{
Elisabeth Vehling
ITP 168 Spring 2019
Homework 8
vehling@usc.edu
%}
if nargin == 5 %if second mass is not given, set equal to mass 1
    mass2 = mass1;
elseif nargin < 5 %if there's less than 5 inputs, throw error
    error('Not enough input arguments');
elseif nargin > 6
    error('Too many input arguments');%if there's more than 6 inputs, throw error
end
%check if each input is scalar
if ~isscalar(v) ||~isscalar(ang) || ~isscalar(time) || ~isscalar(mag) || ~isscalar(mass1) || ~isscalar(mass2)
    error('Inputs must be positive, numeric, scalar values.');
end
%check if each input is numeric
if ~isnumeric(v) || ~isnumeric(ang) || ~isnumeric(time) || ~isnumeric(mag) || ~isnumeric(mass1) || ~isnumeric(mass2)
    error('Inputs must be positive, numeric, scalar values.');
end
% check if inputs are positive
if v < 0 || ang < 0 || ang > 90 || time < 0 || mag < 0 || mass1 < 0 || mass2 <0
    error('Inputs must be positive, numeric, scalar values.');
end
timeG= (2*v*sin(ang))/9.81; %calculate time object hits the ground
if time > timeG %if time of explosion is greater than the time object hits time
    error('Time of explosion must occur before object hits the ground.');
end
%% Part 2: Trajectory Before Explosion
xVec = [];%create vec to hold values
for i=1:1:time %until time of explosion
    xVec(i) = v*cos(ang)*i; %calculate x loc of the object
end
yVec = []; %create vec to hold values
for i=1:1:time
    yVec(i) = v*sin(ang)*i-(1/2)*9.81*i*i; %calculate y loc
end
%% Part 3: Trajectory of Centroid
vxTE = [];%create empty vecs to hold centroid x and y coords
vyTE = [];
for i=1:1:time %for same duration as before explosion
    vxTE(i) = v*cos(ang); %calculate x loc of the centroid
end
for i=1:1:time
    vyTE(i) =v* sin(ang) - 9.81*time; %calculate y loc of centroid
end
%% Trajectory of Masses
vM1 = (mag/mass1);
vM2 = (mag/mass2);
xMVec = [];%create vec to hold values
for i=1:1:time %until time of explosion
    xMVec(i) = vM1*cos(ang)*i; %calculate x loc of the object
end
yMVec = []; %create vec to hold values
for i=1:1:time
    yMVec(i) = vM2*sin(ang)*i-(1/2)*9.81*i*i; %calculate y loc
end

%% Note
%So I know that this assignment isn't entirely correct/complete and that
%I'm submitting it a day late, so I'm sorry you have to grade this--but
%this week absolutely wrecked me with 4 midterms and I don't have the
%mental stamina to finish this off. Anyway, I'm sorry!! 
end
