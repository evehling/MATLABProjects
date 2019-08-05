%{
Elisabeth Vehling 
ITP 168, Spring 2019
Lab 20
vehling@usc.edu
%}
clear; clc; close;
%% Part 1
dat = dlmread('traj.txt', 'r'); %read in the file
alt = dat; %assign altitude vector to the data read in
%% Part 2
time = linspace(0,530,53); %make vec of 53 values, spaced 10 secs apart

%calculate deltas
altDelta = diff(alt); %delta of altitude (y)
timeDelta = 10; %delta of time time(x), because linearly spaced

%Plot Altitude
subplot(3,1,1); %create 3 subplots
plot(time, alt); %plot the altitude over time
ylabel('Altitude (ft)'); %label axes and titles
xlabel('Time (s)');
title('Atlantis Shuttle Launch Data');

%Calculate Average Velocity (feet/second)
subplot(3,1,2);
velocity = altDelta/timeDelta; %calculate derivative for velocity
velocity = [0; velocity]; %add a zero to the velocity vector for starting velocity
plot(time(1:end),velocity); %plot the velocity over time
ylabel('Velocity (ft/s)');%label axes
xlabel('Time (s)');

%Calculate Acceleration: (g's = 32.2 ft/sec^2)
subplot(3,1,3)
diffVel = diff(velocity);%calculate differences between velocity vector elements
accel = diffVel/timeDelta;%divide the two delta vectors to get the derivative
accel = [0; accel]; %add 0 to the first element of the acceleration vector
accel = accel/32.2; %divide by 32.2 to convert to g's
plot(time(1:end),accel); %Plot accleration over time
xlabel('Time (s)');%label axes
ylabel('Acceleration (g)');


