%{
Elisabeth Vehling
ITP 168, Spring 2019
Lab 21
vehling@usc.edu
%}
clear; clc;close;
%% Part 1:
f_v = @(t) -3*t*t + 30*t; %anonymous funct. for velocity
cross = false;%set while loop condition to false
z=1;%set starting second bound as 1
while cross == false %while the value has not crossed 0
    time = linspace(0,z,500); %create 500 element vector from 0-specificed second
    velocity = []; %vec of velocity values
    for i=1:1:500 %for each time element
        velocity(i) = f_v(time(i));%plug in time value to equation
    end
    area = cumtrapz(time,velocity);%calculate integral of velocity
    if area(end) < 0 %if the last element in vector is negative, must have crossed to negative during that second
        cross = true;%set while loop condition to true
        crossTime = z; %set the time crossed to the current second
    else
        z = z+1; %if not, increment the end seconds
    end
end
%% Part 2: Plot
%output time
fprintf('Time until the object reaches the ground = %0.2f seconds\n',z);%
%reset time vector to 0-second z
time = linspace(0,z,500);
plot(time, area);%plot the position vs time
hold on
plot(time,velocity); % plot the velocity vs time
title('Position and Velocity Profile'); %label the graph
ylabel('Height/Velocity (m)/(m/s)');
xlabel('Time (s)');
legend('Height', 'Velocity');

